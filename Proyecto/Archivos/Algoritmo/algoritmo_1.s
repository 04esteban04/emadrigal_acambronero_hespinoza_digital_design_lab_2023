@ Entrada:
@ r0: Dirección de memoria de la imagen en escala de grises
@ r1: Ancho de la imagen
@ r2: Alto de la imagen

@ Calcular histograma
mov r3, #256               @ Tamaño del histograma
mov r4, #0                 @ Inicializar contador
loop_histogram:
    ldrb r5, [r0], #1       @ Cargar el valor de píxel
    add r6, r5, r4, lsl #2  @ Calcular la dirección del contador del histograma
    ldr r6, [r6]           @ Cargar el valor del contador del histograma
    add r6, r6, #1         @ Incrementar el contador
    str r6, [r4, lsl #2]   @ Guardar el valor actualizado del contador del histograma
    subs r3, r3, #1
    bne loop_histogram

@ Calcular CDF (Distribución de Frecuencia Acumulativa)
mov r3, #0                @ Inicializar la suma acumulativa
mov r4, #0                @ Inicializar el valor mínimo no cero del histograma
mov r5, #0                @ Inicializar el índice
loop_cdf:
    ldr r6, [r5, lsl #2]   @ Cargar el valor del contador del histograma
    add r3, r3, r6         @ Sumar el valor al acumulador
    add r6, r3, r4, lsl #2 @ Calcular la dirección del CDF
    str r6, [r5, lsl #2]   @ Guardar el valor actualizado del CDF
    cmp r6, #0             @ Comprobar si el valor mínimo no cero del histograma se ha encontrado
    it gt
    movgt r4, r6           @ Actualizar el valor mínimo no cero del histograma
    adds r5, r5, #1
    cmp r5, #256
    bne loop_cdf

@ Calcular histograma ecualizado
mov r3, #0                @ Inicializar el valor mínimo no cero del histograma
loop_equalized_histogram:
    ldr r6, [r4, lsl #2]   @ Cargar el valor del CDF
    sub r6, r6, r3         @ Restar el valor mínimo no cero del histograma
    mul r6, r6, #255       @ Multiplicar por 255
    sdiv r6, r6, r7        @ Dividir por el tamaño de la imagen
    strb r6, [r4, lsl #2]  @ Guardar el valor actualizado del histograma ecualizado
    cmp r4, #255
    addgt r4, r4, #1
    blt loop_equalized_histogram

@ Aplicar ecualización a la imagen
mov r0, #0                @ Índice de fila
loop_rows:
    mov r1, #0            @ Índice de columna
loop_columns:
    ldrb r2, [r0, r1]     @ Cargar el valor de píxel original
    mov r3, r2, lsl #2    @ Calcular la dirección del valor ecualizado
    ldrb r3, [r3]         @ Cargar el valor ecualizado
    strb r3, [r0, r1]     @ Guardar el valor ecualizado en la imagen
    adds r1, r1, #1
    cmp r1, r6
    blt loop_columns
    adds r0, r0, #1
    cmp r0, r7
    blt loop_rows

@ Escala de grises y de 8 bits xD