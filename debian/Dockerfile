FROM idealctp/java_imageio:beta

#Dockerfile for internally-contained CTP installation.

#Put CTP install.bz2 from repository, install of http://mirc.rsna.org/download/CTPClient.zip
#http://mircwiki.rsna.org/index.php?title=Java_Advanced_Imaging_ImageIO_Tools
#CTP Server is on container port 1080; CTP pipeline is on container port 2104

RUN apt-get update && apt-get install -y openssh-server xorg openbox

#RUN service ssh start
#RUN useradd -ms /bin/bash CTP -p CTP

#ENV CTP_USER_HOME /home/CTP
#ENV CTP_HOME ${CTP_USER_HOME}/install/CTP
ENV CTP_HOME /install/CTP

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ADD CTP/install.bz2 /

EXPOSE 1080 2104 22

#RUN chown -R CTP:CTP ${CTP_USER_HOME}
RUN chmod -R 777 ${CTP_HOME}

#USER CTP
WORKDIR ${CTP_HOME}

#CMD ["java","-jar","Runner.jar"]
#RUN java -jar Runner.jar

#RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
