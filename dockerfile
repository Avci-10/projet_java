# ---- Build ----
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Étape 1 : télécharger les dépendances
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

# Étape 2 : copier le code source et builder
COPY src ./src
RUN mvn -q -DskipTests clean package

# ---- Runtime ----
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copier le JAR depuis l'étape build
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
