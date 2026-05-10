# Compresión y Procesamiento de Imágenes mediante SVD 🖼️🔢

Este repositorio contiene el desarrollo del **Proyecto 3** para la cátedra de Álgebra Lineal y Ciencia de Datos. El objetivo principal es aplicar la **Descomposición en Valores Singulares (SVD)** para analizar el equilibrio entre la calidad visual, el error de reconstrucción y el ahorro de almacenamiento en imágenes digitales.

## 📋 Descripción del Proyecto
Dada una imagen representada como una matriz $A$, el proyecto busca responder:
> ¿Qué cantidad de valores singulares permite reconstruir una imagen con calidad aceptable y menor costo de almacenamiento?

## 🚀 Objetivos
* Representar imágenes en escala de grises y RGB mediante matrices[cite: 9].
* Aplicar SVD a cada matriz y reconstruir imágenes con distintos rangos $k$[cite: 10, 11].
* Medir el error relativo mediante la norma de Frobenius ($E_k$)[cite: 12, 42].
* Analizar el ahorro de almacenamiento comparando $k(m+n+1)$ frente a $m \times n$.

## 🧪 Metodología y Herramientas
* **Lenguaje:** Python 3.13
* **Librerías principales:** `NumPy` (Álgebra lineal), `Matplotlib` (Visualización), `Pillow` (Procesamiento de imagen).
* **Dataset:** Imágenes estándar del USC-SIPI Image Database.

## 📊 Entregables
1. **Reconstrucciones:** Visualización de la imagen con diferentes valores de $k$.
2. **Gráfico de Valores Singulares:** Visualización del decaimiento de la importancia de los datos.
3. **Análisis de Error:** Curva de error relativo vs. rango $k$.
4. **Informe Técnico:** Documentación detallada de los fundamentos y resultados.

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