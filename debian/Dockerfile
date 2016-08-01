FROM idealctp/java_imageio:beta

#Dockerfile for internally-contained CTP installation.

#Put CTP install.bz2 from repository, install of http://mirc.rsna.org/download/CTPClient.zip
#http://mircwiki.rsna.org/index.php?title=Java_Advanced_Imaging_ImageIO_Tools
#CTP Server is on container port 1080; CTP pipeline is on container port 2104

RUN apt-get update && apt-get install -y openssh-server xorg openbox

RUN useradd -ms /bin/bash CTP -p CTP

ENV CTP_USER_HOME /home/CTP
ENV CTP_HOME ${CTP_USER_HOME}/install/CTP

ADD CTP/install.bz2 ${CTP_USER_HOME}
WORKDIR ${CTP_HOME}

EXPOSE 1080
EXPOSE 2104
EXPOSE 22

RUN chown -R CTP:CTP ${CTP_USER_HOME}

USER CTP

RUN java -jar Runner.jar
