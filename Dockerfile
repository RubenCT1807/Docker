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
