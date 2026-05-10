#!/bin/bash

# Configuración de variables
URL="https://www.kaggle.com/api/v1/datasets/download/saeedehkamjoo/standard-test-images"
ZIP_NAME="standard-test-images.zip"
TARGET_DIR="raw"
TEMP_EXTRACT="temp_extraction_$(date +%s)" # Sufijo único para evitar colisiones

# Detener el script si ocurre algún error
set -e

# Moverse al directorio donde reside el script
cd "$(dirname "$0")"

echo "-----------------------------------------------------------"
echo "Iniciando adquisicion de datos en: $(pwd)"
echo "-----------------------------------------------------------"

# 1. Validar herramientas necesarias
for cmd in curl unzip; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: El comando '$cmd' no esta instalado."
        exit 1
    fi
done

# 2. Preparar directorios
if [ -d "$TARGET_DIR" ]; then
    echo "Limpiando directorio '$TARGET_DIR' existente..."
    rm -rf "$TARGET_DIR"
fi
mkdir -p "$TARGET_DIR"

# 3. Descargar el archivo
echo "Descargando dataset desde Kaggle..."
# Se añade -f para fallar en errores HTTP y -A para el User-Agent
curl -f -L -A "Mozilla/5.0" -o "$TARGET_DIR/$ZIP_NAME" "$URL"

# 4. Extraer y reorganizar
echo "Extrayendo y reorganizando archivos..."
mkdir -p "$TEMP_EXTRACT"
unzip -q "$TARGET_DIR/$ZIP_NAME" -d "$TEMP_EXTRACT"

if [ -d "$TEMP_EXTRACT/STI" ]; then
    echo "Moviendo contenido de STI a $TARGET_DIR..."
    mv "$TEMP_EXTRACT/STI/"* "$TARGET_DIR/"
else
    mv "$TEMP_EXTRACT/"* "$TARGET_DIR/"
fi

# 5. Limpieza final
echo "Eliminando archivos temporales..."
rm -rf "$TEMP_EXTRACT"
rm -f "$TARGET_DIR/$ZIP_NAME"

echo "-----------------------------------------------------------"
echo "Proceso finalizado. Estructura en '$TARGET_DIR/':"
ls -F "$TARGET_DIR"
echo "-----------------------------------------------------------"