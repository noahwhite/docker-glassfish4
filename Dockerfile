# Glassfish4 + Oracle JDK 1.7.0_40 
#
# VERSION               0.0.4

FROM      base
MAINTAINER Noah White "noah@noahwhite.net"

# ADD A HOSTS FILE WITH A HOSTNAME FOR 127.0.0.1 - CHANGE THIS NAME (CARGOBOX) TO MEET YOUR NEEDS
ADD etc/hosts /etc/hosts
RUN chmod 600 /etc/hosts

RUN apt-get update

RUN apt-get -y install wget

RUN apt-get -y install unzip

RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz"

RUN mv /jdk-7u40-linux-x64.tar.gz /usr/local; cd /usr/local; tar zxvf jdk-7u40-linux-x64.tar.gz ; rm -f jdk-7u40-linux-x64.tar.gz

RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/promoted/glassfish-4.0.1-b03.zip"

RUN mv /glassfish-4.0.1-b03.zip /usr/local; cd /usr/local; unzip glassfish-4.0.1-b03.zip ; rm -f glassfish-4.0.1-b03.zip

ENV JAVA_HOME /usr/local/jdk1.7.0_40
 
ENV GF_HOME /usr/local/glassfish4

ENV PATH $PATH:$JAVA_HOME/bin:$GF_HOME/bin

# PORT FORWARD THE ADMIN PORT, HTTP LISTENER-1 PORT, HTTPS LISTENER PORT, PURE JMX CLIENTS PORT, MESSAGE QUEUE PORT, IIOP PORT, IIOP/SSL PORT, IIOP/SSL PORT WITH MUTUAL AUTHENTICATION
EXPOSE 4848 8080 8181 8686 7676 3700 3820 3920

