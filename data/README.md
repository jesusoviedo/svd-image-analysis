# Módulo de Ingesta de Datos 📂

Esta carpeta contiene las herramientas necesarias para inicializar el entorno de datos del proyecto de SVD. Los scripts automatizan la descarga, extracción y organización del dataset de imágenes estándar.

## Contenido del Directorio

- **`ingest_data.sh`**: Script de automatización para entornos Unix (Linux/macOS/WSL).
- **`ingest_data.py`**: Script multiplataforma basado en Python (recomendado para Windows o usuarios de `uv`).
- **`raw/`**: Directorio (generado automáticamente) donde se almacenarán las imágenes organizadas por categorías.

## Instrucciones de Uso

### Opción 1: Bash (Linux / macOS)
Este script es la opción más directa para sistemas tipo Unix. Requiere tener instalados `curl` y `unzip`.
```bash
bash ingest_data.sh
```

### Opción 2: Python (Multiplataforma)

Ideal para Windows o para mantener la consistencia dentro del flujo de trabajo de Python. Se recomienda ejecutarlo a través de `uv` para asegurar que las dependencias (`requests`, `tqdm`) estén disponibles.

```bash
uv run python ingest_data.py
```

## Estructura de Salida Esperada

Tras ejecutar cualquiera de los scripts, se creará la carpeta `raw/` con la siguiente jerarquía de subdirectorios:

```text
raw/
├── Classic/       # Imágenes estándar (Lena, Cameraman, etc.)
├── Texture/       # Imágenes con patrones complejos y texturas
├── Medical/       # Imágenes de uso médico (Rayos X, etc.)
├── High resolution/ # Imágenes de alta resolución para pruebas de estrés
└── ...            # Otros subdirectorios del dataset
```

## Notas Técnicas

* **Fuente de Datos:** [Standard Test Images - Kaggle](https://www.kaggle.com/datasets/saeedehkamjoo/standard-test-images).
* **Limpieza:** Ambos scripts realizan una limpieza automática eliminando el archivo temporal `.zip` tras la descompresión para optimizar el espacio en disco.