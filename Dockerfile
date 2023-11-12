FROM cesarbm/microsoft_net_7

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Ejecuta el comando 'dotnet new webapi' para crear el proyecto TodoApi
RUN dotnet new webapi -o TodoApi

# Cambia al directorio del proyecto
WORKDIR /app/TodoApi

# Agrega el paquete NuGet Microsoft.EntityFrameworkCore.InMemory al proyecto
RUN dotnet add package Microsoft.EntityFrameworkCore.InMemory

# Confía en los certificados HTTPS de desarrollo
RUN dotnet dev-certs https --trust

# Expone el puerto 80 para que la aplicación sea accesible desde fuera del contenedor
EXPOSE 80

# Inicia la aplicación cuando se ejecute el contenedor
CMD ["dotnet", "run", "--urls", "http://0.0.0.0:80"]
