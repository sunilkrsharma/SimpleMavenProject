FROM  phusion/baseimage:0.9.17
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV MAVEN_VERSION 3.3.9

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
EXPOSE 8000

VOLUME /root/.m2

CMD ["mvn"] 
