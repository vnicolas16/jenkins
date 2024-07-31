FROM jenkins/jenkins:latest

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add Jenkins to Docker group if it does not already exist
RUN groupmod -g 999 docker || groupadd -g 999 docker && usermod -aG docker jenkins
