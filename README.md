# Project README

This README provides instructions for setting up and running the Java application locally using Gradle (version 8.4) and JDK (version 17). Additionally, it includes guidance on configuring Jenkins to automate the build process using a Jenkinsfile. The Jenkins pipeline will automatically build the Java application using Gradle, create a Docker image based on the provided Dockerfile, and push the image to Docker Hub.

## Local Setup
### Prerequisites

    -Gradle 8.4
    -JDK 17
    -Docker

----------------------

### Steps


#### Clone the Repository:

```bash

git clone <repository-url>
cd <repository-directory>
```

#### Build the Java Application Locally:

```bash

./gradlew build
```

This command will build the Java application using Gradle.

#### Run the Java Application Locally:

```bash

    java -jar build/libs/your-java-app.jar
```

    Replace your-java-app.jar with the actual JAR file name generated by the build.

## Jenkins Automation
### Prerequisites

Jenkins server with necessary plugins installed.
Docker installed on the Jenkins server.

-----------------

### Steps

#### Configure Jenkins:
Install necessary plugins, including the "Gradle" plugin.
Set up Jenkins global tools for Gradle 8.4 and JDK 17.

#### Create Jenkins Pipeline Job:
Create a new Jenkins Pipeline job.
Configure the job to use the ./Jenkinsfile in your repository.

#### Run Jenkins Pipeline Job:
Trigger the Jenkins Pipeline job manually or set up webhook for automatic triggering.

--------------------

Upon successful execution, the Jenkins pipeline will automatically build the Java application using Gradle, create a Docker image based on the ./Dockerfile, and push the image to Docker Hub.

