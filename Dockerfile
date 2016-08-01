FROM idealctp/java_imageio:beta

#Dockerfile for internally-contained CTP installation.

#Put CTP install.bz2 from repository, install of http://mirc.rsna.org/download/CTPClient.zip
#http://mircwiki.rsna.org/index.php?title=Java_Advanced_Imaging_ImageIO_Tools
#CTP Server is on container port 1080; CTP pipeline is on container port 2104

RUN useradd -ms /bin/bash CTP

USER CTP
ENV CTPHOME /home/CTP

ADD CTP/install.bz2 ${CTPHOME}
WORKDIR ${CTPHOME}
RUN tar xf install.bz2

#RUN java -jar ${CTPHOME}/install/CTP/Runner.jar
