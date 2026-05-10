import os
import requests
import zipfile
import shutil
from pathlib import Path
from tqdm import tqdm

def download_dataset():
    # Configuración de rutas y URL
    url = "https://www.kaggle.com/api/v1/datasets/download/saeedehkamjoo/standard-test-images"
    base_path = Path(__file__).parent
    target_dir = base_path / "raw"
    zip_path = target_dir / "standard-test-images.zip"
    temp_extract = base_path / "temp_extraction"

    print("-" * 60)
    print(f"Iniciando adquisicion de datos en: {base_path}")
    print("-" * 60)

    # 1. Preparar directorios
    if target_dir.exists():
        print(f"Limpiando directorio '{target_dir.name}' existente...")
        shutil.rmtree(target_dir)
    target_dir.mkdir(parents=True, exist_ok=True)

    # 2. Descargar con barra de progreso
    print("Descargando dataset desde Kaggle...")
    response = requests.get(url, stream=True)
    response.raise_for_status() # Lanza error si la descarga falla
    
    total_size = int(response.headers.get('content-length', 0))
    
    with open(zip_path, 'wb') as file, tqdm(
        desc="Progreso",
        total=total_size,
        unit='iB',
        unit_scale=True,
        unit_divisor=1024,
    ) as bar:
        for data in response.iter_content(chunk_size=1024):
            size = file.write(data)
            bar.update(size)

    # 3. Descomprimir
    print("Extrayendo archivos...")
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        zip_ref.extractall(temp_extract)

    # 4. Reorganizar (Eliminar el nivel STI)
    sti_folder = temp_extract / "STI"
    if sti_folder.exists():
        print(f"Moviendo contenido de STI a {target_dir.name}...")
        for item in sti_folder.iterdir():
            shutil.move(str(item), str(target_dir))
    else:
        for item in temp_extract.iterdir():
            shutil.move(str(item), str(target_dir))

    # 5. Limpieza final
    print("Eliminando archivos temporales...")
    shutil.rmtree(temp_extract)
    zip_path.unlink()

    print("-" * 60)
    print(f"Proceso finalizado. Estructura en '{target_dir.name}/':")
    for folder in sorted(target_dir.iterdir()):
        if folder.is_dir():
            print(f"  {folder.name}/")
    print("-" * 60)

if __name__ == "__main__":
    download_dataset()