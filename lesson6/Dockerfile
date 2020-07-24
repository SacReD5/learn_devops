FROM ubuntu:18.04

ENV WF_VERSION 20.0.1.Final

LABEL maitainer="SacReD5"

RUN apt-get update \
    && apt-get install default-jdk git maven wget unzip -y \
    # NEVER DO THAT IN THE FUTURE! Forgive me God...
    && mkdir /opt/project \
    && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /opt/project \
    && mvn -f /opt/project/pom.xml clean package \
    && wget -P /opt/ https://download.jboss.org/wildfly/$WF_VERSION/wildfly-$WF_VERSION.zip \
    && unzip /opt/wildfly-$WF_VERSION.zip -d /opt/ \
    && cp /opt/project/target/hello-1.0.war /opt/wildfly-$WF_VERSION/standalone/deployments \
    && rm -rf /opt/project \
    && rm -f /opt/wildfly-$WF_VERSION.zip \
    && apt-get remove git maven wget unzip -y \
    && apt-get autoremove -y \
    && apt-get clean

EXPOSE 8080

CMD ["/opt/wildfly-20.0.1.Final/bin/standalone.sh", "-b", "0.0.0.0"]