FROM centos:7
MAINTAINER prsn-devops

RUN yum install -y java-1.8.0-openjdk-devel.x86_64

RUN useradd -m -d /home/cds -s /bin/bash cds

COPY core-data-service-Pearson_0.1-exec.jar /home/cds/cds-app/core-data-service-Pearson_0.1-exec.jar

COPY config.tar /home/cds/cds-app/config.tar

RUN tar -xf /home/cds/cds-app/config.tar -C /home/cds/cds-app/

EXPOSE 9020

ENTRYPOINT ["java","-Dconfig.home=/home/cds/cds-app/config","-Dcomponent.name=CDS","-Denv=dev","-jar","/home/cds/cds-app/core-data-service-Pearson_0.1-exec.jar"]

