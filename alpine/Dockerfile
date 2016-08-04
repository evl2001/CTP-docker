FROM anapsix/alpine-java:latest

EXPOSE 1080 2104 7104

ENV CTP_HOME /install/CTP

ENV JAVA_HOME /opt/jdk
ENV JAR_DEST ${JAVA_HOME}/jre/lib/ext
ENV CTP_LIBS ${CTP_HOME}/libraries/imageio
RUN mkdir ${JAVA_HOME}/jre/amd64

RUN mkdir ${JAVA_HOME}/jre/i386
ADD CTP/install.bz2 /
ADD CTP/libclib_jiio.so ${JAVA_HOME}/jre/i386
#ADD CTP/Krishna.script ${CTP_HOME}/scripts
ADD CTP/libclib_jiio.so ${JAVA_HOME}/jre/amd64


RUN chmod -R 777 ${CTP_HOME}

#USER CTP
WORKDIR ${CTP_HOME}

RUN cp ${CTP_LIBS}/*.jar ${JAR_DEST}

CMD ["java","-jar","Runner.jar"]
#RUN java -jar Runner.jar

