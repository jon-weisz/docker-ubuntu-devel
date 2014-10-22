FROM ubuntu:12.04
MAINTAINER Jon Weisz <jon.weisz@gmail.com>
#Builds a base vanilla groovy-precise image
#
RUN apt-get -q update
ENV DEBIAN_FRONTEND noninteractive
#Sane basic functionality
RUN apt-get install -y apt-utils python-software-properties software-properties-common wget curl emacs23-nox lsb-release cmake psutils locate xorg subversion git bzr emacs nano linux-tools-common automake autoconf sudo
RUN apt-get upgrade -y 


#Add basic user
ENV USERNAME tester
ENV HOME /home/$USERNAME
RUN mkdir -p $HOME
RUN useradd $USERNAME
RUN echo "$USERNAME:$USERNAME" | chpasswd
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R $USERNAME:$USERNAME $HOME

# change user
USER tester
WORKDIR /home/tester/

RUN git clone git://git.code.sf.net/p/oprofile/oprofile
RUN cd oprofile
