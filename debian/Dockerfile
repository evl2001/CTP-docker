FROM idealctp/java_imageio:beta

#Dockerfile for internally-contained CTP installation.

#Put CTP install.bz2 from repository, install of http://mirc.rsna.org/download/CTPClient.zip
#http://mircwiki.rsna.org/index.php?title=Java_Advanced_Imaging_ImageIO_Tools
#CTP Server is on container port 1080; CTP pipeline is on container port 2104

RUN apt-get update && apt-get install -y openssh-server xorg openbox

RUN useradd -ms /bin/bash CTP -p CTP

USER CTP
ENV CTPHOME /home/CTP

ADD CTP/install.bz2 ${CTPHOME}/install.bz2
WORKDIR ${CTPHOME}
RUN echo ${PWD}
RUN ls ${CTPHOME}

EXPOSE 1080
EXPOSE 2104
EXPOSE 22

RUN tar xvf install.bz2

#RUN echo java -jar ${CTPHOME}/install/CTP/Runner.jar
