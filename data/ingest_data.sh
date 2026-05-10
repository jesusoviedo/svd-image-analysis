#!/bin/bash

# Configuración de variables (Relativas a la ubicación del script)
URL="https://www.kaggle.com/api/v1/datasets/download/saeedehkamjoo/standard-test-images"
ZIP_NAME="standard-test-images.zip"
TARGET_DIR="raw"

# Moverse al directorio donde reside el script
cd "$(dirname "$0")"

echo "==========================================================="
echo "📥 Iniciando adquisición de datos en: $(pwd)"
echo "==========================================================="

# 1. Preparar directorios
if [ -d "$TARGET_DIR" ]; then
    echo "🧹 Limpiando directorio 'raw' existente..."
    rm -rf "$TARGET_DIR"
fi
mkdir -p "$TARGET_DIR"

# 2. Descargar el archivo
echo "🚀 Descargando ZIP desde Kaggle..."
curl -L -o "$TARGET_DIR/$ZIP_NAME" "$URL"

# 3. Verificar descarga
if [ $? -eq 0 ]; then
    echo "✅ Archivo descargado correctamente en $TARGET_DIR/$ZIP_NAME."
else
    echo "❌ Error en la descarga. Verifica tu conexión o el enlace."
    exit 1
fi

# 4. Descomprimir en una carpeta temporal para reorganizar
echo "📦 Extrayendo archivos..."
mkdir -p "$TEMP_EXTRACT"
unzip -q "$ZIP_NAME" -d "$TEMP_EXTRACT"

# 5. Mover contenido de STI a raw (evitando el nivel extra)
if [ -d "$TEMP_EXTRACT/STI" ]; then
    echo "📂 Reorganizando carpetas: moviendo contenido de STI a $TARGET_DIR..."
    mv "$TEMP_EXTRACT/STI/"* "$TARGET_DIR/"
else
    # Por si el ZIP no tuviera la carpeta STI en alguna versión
    mv "$TEMP_EXTRACT/"* "$TARGET_DIR/"
fi

# 5. Limpieza final
echo "🗑️  Eliminando archivos temporales..."
rm -rf "$TEMP_EXTRACT"
rm "$ZIP_NAME"

echo "✨ Proceso finalizado. Subdirectorios listos en '$TARGET_DIR/':"
ls -F "$TARGET_DIR"
echo "==========================================================="













