# Pull blue ocean image
FROM jenkinsci/blueocean

# Build the container
USER root

# installed wget
RUN apt-get install -y wget

#get maven 3.2.2
RUN wget --no-verbose -o /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4

# verify checksum
# Run echo

# install maven
RUN tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -c /opt/
RUN ln -s /opt/apache-maven-3.5.4 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.5.4-bin.tar.gz
ENV MAVEN_HOME /opt/maven

RUN chown -R jenkins:jenkins /opt/maven

RUN apt-get clean

USER jenkins
