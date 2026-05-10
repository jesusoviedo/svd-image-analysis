# Compresión y Procesamiento de Imágenes mediante SVD 🖼️🔢

Este repositorio contiene el desarrollo del **Proyecto 3** para la cátedra de Álgebra Lineal y Ciencia de Datos. El objetivo principal es aplicar la **Descomposición en Valores Singulares (SVD)** para analizar el equilibrio entre la calidad visual, el error de reconstrucción y el ahorro de almacenamiento en imágenes digitales.

## 📋 Descripción del Proyecto
Dada una imagen representada como una matriz $A$, el proyecto busca responder:
> ¿Qué cantidad de valores singulares permite reconstruir una imagen con calidad aceptable y menor costo de almacenamiento?

## 🚀 Objetivos
* Representar imágenes en escala de grises y RGB mediante matrices.
* Aplicar SVD a cada matriz y reconstruir imágenes con distintos rangos $k$.
* Medir el error relativo mediante la norma de Frobenius ($E_k$).
* Analizar el ahorro de almacenamiento comparando $k(m+n+1)$ frente a $m \times n$.

## 🧪 Metodología y Herramientas
* **Lenguaje:** Python 3.13
* **Librerías principales:** `NumPy` (Álgebra lineal), `Matplotlib` (Visualización), `Pillow` (Procesamiento de imagen).

## 📊 Entregables
1. **Reconstrucciones:** visualización de la imagen con diferentes valores de $k$.
2. **Gráfico de Valores Singulares:** visualización del decaimiento de la importancia de los datos.
3. **Análisis de Error:** curva de error relativo vs. rango $k$.
4. **Informe Técnico:** documentación detallada de los fundamentos y resultados.

## 📂 Dataset
Las imágenes utilizadas en este proyecto para las pruebas de compresión y análisis de error provienen del conjunto de datos:
* **Standard Test Images** disponible en [Kaggle](https://www.kaggle.com/datasets/saeedehkamjoo/standard-test-images).

Este set incluye imágenes clásicas de procesamiento de señales (como *Lena*, *Baboon* y *Cameraman*) en diversos formatos, incluyendo `.pgm`, lo que permite una representación matricial directa de las intensidades de gris para el cálculo del SVD.

## 👥 Autores
| Nombre y Apellido | Correo Electrónico |
| :--- | :--- |
| **Girett Insaurralde, Félix Giovanni** | giogi7902@gmail.com |
| **Oviedo Riquelme, Jesús María Javier** | j92riquelme@gmail.com |
| **Rivas Gaona, Sofia** | sofiarivasgaona@gmail.com |
| **Torres, Liz** | kokoldtc@gmail.com |
| **Velazquez Sánchez, Gabriela Analia** | vsga17@gmail.com |
| **Vera, Miguel Angel** | miguev83@gmail.com |
| **Yampey Cristaldo, Ernesto Julian** | e.yampey@hotmail.com |

## 📚 Referencias
* Klein, P. N. *Coding the Matrix: Linear Algebra through Computer Science Applications*.
* Chartier, T. *When Life is Linear: From Computer Graphics to Bracketology*.

## 🛠️ Configuración del Entorno
Este proyecto utiliza [uv](https://docs.astral.sh/uv/) para una gestión de dependencias rápida y reproducible.

### 1. Inicialización con `uv`
Clona el repositorio y sincroniza el entorno virtual ejecutando:

```bash
uv sync
```

### 2. Preparación de los Datos (Ingesta)

Antes de ejecutar los experimentos, debes descargar y organizar el dataset. Hemos automatizado este proceso con scripts dentro de la carpeta `data/`:

* **Opción multiplataforma (Recomendada):**
```bash
uv run python data/ingest_data.py
```

* **Opción Bash (Linux/macOS):**
```bash
bash data/ingest_data.s
```

### 3. Ejecución de Notebooks

Para abrir el entorno de Jupyter con todas las dependencias configuradas:

```bash
uv run jupyter notebook
```

## 🔌 Compatibilidad e Interoperabilidad

Aunque se recomienda el uso de `uv`, el proyecto mantiene compatibilidad con herramientas estándar de Python:

* **Usuarios de `pip`:** se incluye un archivo `requirements.txt` generado automáticamente. Puedes instalar las dependencias con `pip install -r requirements.txt`.
* **Versión de Python:** el proyecto está optimizado para **Python 3.13** para aprovechar las mejoras de rendimiento en cálculos matriciales.