FROM jenkins

MAINTAINER gradle (wanghao187@gmail.com https://github.com/orangesdk/jenkins.git)

# Grant root access
USER root

# update dpkg repositories
RUN apt-get update

# install wget
RUN apt-get install -y wget

# get maven 3.3.3
RUN wget -O /tmp/apache-maven-3.3.3.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz

# verify checksum
RUN echo "794b3b7961200c542a7292682d21ba36 /tmp/apache-maven-3.3.3.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.3.3.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.3 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.3.tar.gz
ENV MAVEN_HOME /opt/maven

# Script that adds jenkins to the docker group
COPY configure_docker_sock_permissions.sh /
RUN chmod +x /configure_docker_sock_permissions.sh

ENTRYPOINT ["/configure_docker_sock_permissions.sh"]
