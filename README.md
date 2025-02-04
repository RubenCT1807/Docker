# Proyecto: Imagen de Docker basada en Ubuntu

Este proyecto proporciona una imagen de Docker basada en Ubuntu. La imagen permite acceder a una terminal interactiva y listar los usuarios del sistema.

## Requisitos previos
Antes de comenzar, asegúrate de tener instalado en tu sistema:
- [Docker](https://docs.docker.com/get-docker/)
- [Git](https://git-scm.com/downloads) (opcional, si deseas subirlo a un repositorio en GitHub)

## Pasos para crear y ejecutar la imagen

### 1. Clonar el repositorio (opcional)
Si deseas gestionar este proyecto con GitHub, clona el repositorio con el siguiente comando:
```sh
  git clone https://github.com/tu-usuario/tu-repositorio.git
  cd tu-repositorio
```

### 2. Crear un archivo `Dockerfile`
Dentro del directorio del proyecto, crea un archivo llamado `Dockerfile` y agrega el siguiente contenido:

```dockerfile
# Usar Ubuntu como imagen base
FROM ubuntu:latest

# Establecer el usuario root
USER root

# Actualizar el sistema y agregar herramientas necesarias
RUN apt-get update && apt-get install -y \
    sudo \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /root

# Comando por defecto al iniciar el contenedor
CMD ["/bin/bash"]
```

### 3. Construir la imagen de Docker
Ejecuta el siguiente comando para construir la imagen:
```sh
  docker build -t mi-ubuntu .
```
Esto creará una imagen llamada `mi-ubuntu` basada en Ubuntu.

### 4. Ejecutar un contenedor basado en la imagen
Para iniciar un contenedor con la imagen creada, ejecuta:
```sh
  docker run -it --name mi-contenedor mi-ubuntu
```
Esto abrirá una terminal dentro del contenedor.

### 5. Listar los usuarios del sistema dentro del contenedor
Una vez dentro del contenedor, puedes ejecutar el siguiente comando para ver los usuarios del sistema:
```sh
  cat /etc/passwd
```
Esto mostrará una lista de usuarios junto con sus detalles.

### 6. Salir del contenedor
Para salir del contenedor, usa el siguiente comando:
```sh
  exit
```

### 7. (Opcional) Subir el proyecto a GitHub
Si deseas subir este proyecto a GitHub, ejecuta los siguientes comandos:
```sh
  git init
  git add .
  git commit -m "Inicializando proyecto Docker Ubuntu"
  git branch -M main
  git remote add origin https://github.com/tu-usuario/tu-repositorio.git
  git push -u origin main
```

## Notas
- Puedes cambiar el nombre de la imagen (`mi-ubuntu`) y el nombre del contenedor (`mi-contenedor`) según tus preferencias.
- Si el contenedor ya existe y deseas volver a entrar, usa:
```sh
  docker start -ai mi-contenedor
```

