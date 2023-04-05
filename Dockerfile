FROM ubuntu:latest

# Update the System
RUN apt-get update

# Install openjdk
RUN apt-get install -y openjdk-17-jdk

# Set the work directory
WORKDIR /minecraft

# Copy the Forge installer
COPY fabric-1.19.4.jar /minecraft/

# Run Forge
RUN java -jar fabric-1.19.4.jar

# Agree to the Minecraft EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Start the server
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "fabric-1.19.4.jar", "nogui"]

