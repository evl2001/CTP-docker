FROM anapsix/alpine-java:latest

EXPOSE 1080 2104

ENV CTP_HOME /install/CTP

ENV JAVA_HOME /opt/jdk
ENV JAR_DEST ${JAVA_HOME}/jre/lib/ext
ENV CTP_LIBS ${CTP_HOME}/libraries/imageio


ADD CTP/install.bz2 /

RUN chmod -R 777 ${CTP_HOME}

#USER CTP
WORKDIR ${CTP_HOME}

RUN cp ${CTP_LIBS}/*.jar ${JAR_DEST}

CMD ["java","-jar","Runner.jar"]
#RUN java -jar Runner.jar

