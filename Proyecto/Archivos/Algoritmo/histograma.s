.global histogram_equalization
.syntax unified

@ r0: dirección de la imagen
@ r1: ancho de la imagen
@ r2: altura de la imagen
@ r3: dirección de la imagen equalizada

histogram_equalization:
    @ Calcular histograma
    mov r4, #0                 @ r4 = índice del histograma
    mov r5, #256               @ r5 = tamaño del histograma
    ldr r6, =histogram         @ r6 = dirección del histograma
    mov r7, #0                 @ r7 = valor del píxel

    loop_calc_histogram:
        ldr r8, [r0], #4        @ Cargar el siguiente píxel de la imagen
        ldrb r7, [r8]           @ Cargar el valor del píxel (asumiendo imágenes de 8 bits)
        ldr r9, [r6, r7, lsl #2]@ Obtener el valor actual del histograma para el píxel
        add r9, r9, #1          @ Incrementar el valor del histograma en 1
        str r9, [r6, r7, lsl #2]@ Almacenar el nuevo valor del histograma
        subs r5, r5, #1         @ Decrementar el contador del histograma
        bne loop_calc_histogram @ Repetir mientras no se haya recorrido todo el histograma

    @ Calcular la función de distribución acumulativa (CDF)
    mov r4, #0                 @ r4 = índice de CDF
    ldr r6, =cdf               @ r6 = dirección de CDF

    loop_calc_cdf:
        ldr r9, [r6, r4, lsl #2]@ Obtener el valor actual de CDF
        ldr r10, [r6, r4-1, lsl #2]! @ Obtener el valor anterior de CDF y actualizar el puntero
        add r9, r9, r10         @ Sumar el valor anterior de CDF al valor actual
        str r9, [r6, r4, lsl #2]@ Almacenar el nuevo valor de CDF
        adds r4, r4, #1         @ Incrementar el índice de CDF
        cmp r4, #256
        bne loop_calc_cdf        @ Repetir mientras no se haya calculado todo el CDF

    @ Calcular el histograma equalizado
    mov r4, #0                 @ r4 = índice del histograma equalizado
    ldr r6, =equalized_histogram @ r6 = dirección del histograma equalizado
    mov r9, #0                 @ r9 = valor de CDF[0]
    ldr r10, =cdf              @ r10 = dirección de CDF
    ldr r10, [r10]            @ r10 = CDF[0]

    loop_calc_equalized_histogram:
        ldr r11, [r6, r4, lsl #2]@ Obtener el valor actual de histograma equalizado
        sub r12, r11, r9        @ CDF[i] - CDF[0]
        mov r13, r1             @ r13 = ancho de la imagen
        mul r13, r13, r2        @ r13 = ancho de la imagen * altura de la imagen
        sub r13, r13, r9        @ (ancho de la imagen * altura de la imagen) - CDF[0]
        mul r12, r12, #255      @ (CDF[i] - CDF[0]) * 255
        sdiv r11, r12, r13      @ Redondear el resultado de la división
        str r11, [r6, r4, lsl #2]@ Almacenar el nuevo valor de histograma equalizado
        adds r4, r4, #1         @ Incrementar el índice del histograma equalizado
        cmp r4, #256
        bne loop_calc_equalized_histogram @ Repetir mientras no se haya calculado todo el histograma equalizado

    @ Aplicar la ecualización al imagen
    mov r4, #0                 @ r4 = índice de la fila de la imagen
    mov r7, #0                 @ r7 = índice de la columna de la imagen
    mov r9, #0                 @ r9 = valor del píxel original
    ldr r6, =equalized_histogram @ r6 = dirección del histograma equalizado
    ldr r10, =equalized_image  @ r10 = dirección de la imagen equalizada

    loop_apply_equalization:
        ldr r8, [r0, r4, lsl #2]@ Obtener la dirección de la fila actual de la imagen
        ldr r11, [r10, r4, lsl #2] @ Obtener la dirección de la fila actual de la imagen equalizada
        mov r7, #0             @ Reiniciar el contador de columnas

        loop_inner_apply_equalization:
            ldrb r9, [r8, r7]   @ Obtener el valor del píxel original
            ldr r11, [r6, r9, lsl #2]@ Obtener el valor equalizado para el píxel
            strb r11, [r11, r7] @ Almacenar el nuevo valor del píxel en la imagen equalizada
            adds r7, r7, #1     @ Incrementar el índice de columna
            cmp r7, r1
            bne loop_inner_apply_equalization @ Repetir mientras no se haya procesado toda la fila

        adds r4, r4, #1         @ Incrementar el índice de fila
        cmp r4, r2
        bne loop_apply_equalization @ Repetir mientras no se haya procesado toda la imagen

    bx lr                     @ Volver de la función
