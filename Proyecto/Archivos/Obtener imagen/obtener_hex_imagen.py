from PIL import Image

# Obtener la información de la imagen en formato hexadecimal
def obtener_datos_hex(imagen):
    # Convertir la imagen a modo RGB si no está en ese modo
    imagen = imagen.convert('RGB')

    datos_pixeles = list(imagen.getdata())
    datos_hex = [f'{r:02x}{g:02x}{b:02x}' for r, g, b in datos_pixeles]
    return datos_hex

# Reconstruir la imagen a partir de los datos hexadecimales
def reconstruir_imagen(datos_hex, ancho, alto):
    datos_pixeles = [(int(dato_hex[0:2], 16), int(dato_hex[2:4], 16), int(dato_hex[4:6], 16)) for dato_hex in datos_hex]
    imagen = Image.new('RGB', (ancho, alto))
    imagen.putdata(datos_pixeles)
    return imagen

# Abrir la imagen
imagen_original = Image.open('C:/Users/Esteban/Downloads/lapa.jpg')

# Obtener los datos hexadecimales de la imagen original
datos_hex = obtener_datos_hex(imagen_original)

# Imprimir los datos hexadecimales
#for dato_hex in datos_hex:
#    print(dato_hex)

# Guardar los datos hexadecimales en un archivo de texto
with open('datos_imagen_hex.txt', 'w') as archivo:
    for dato_hex in datos_hex:
        archivo.write(dato_hex + '\n')


# Reconstruir la imagen a partir de los datos hexadecimales
imagen_reconstruida = reconstruir_imagen(datos_hex, imagen_original.width, imagen_original.height)

# Guardar la imagen reconstruida
imagen_reconstruida.save('imagen_reconstruida.jpg')
