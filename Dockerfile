# Use the Eclipse temurin alpine official image
# https://hub.docker.com/_/eclipse-temurin
FROM eclipse-temurin:17-jdk-alpine

# Instala dependencias necesarias para Gradle y Java
RUN apk add --no-cache bash curl zip unzip

WORKDIR /app

COPY . ./

RUN chmod +x gradlew

# Puedes omitir 'gradlew dependencies', no es necesario para el build
RUN ./gradlew build -x test

# Run the app by dynamically finding the JAR file in the target directory
CMD ["sh", "-c", "java -jar target/*.jar"]