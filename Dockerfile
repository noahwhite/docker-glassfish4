# Glassfish4 + Oracle JDK 1.7.0_40 
#
# VERSION               0.0.1

FROM      base
MAINTAINER Noah White "noah@noahwhite.net"

RUN apt-get update

RUN apt-get -y install wget

RUN apt-get -y install unzip

RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz"

RUN mv /jdk-7u40-linux-x64.tar.gz /usr/local; cd /usr/local; tar zxvf jdk-7u40-linux-x64.tar.gz ; rm -f jdk-7u40-linux-x64.tar.gz

RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/promoted/glassfish-4.0.1-b03.zip"

RUN mv /glassfish-4.0.1-b03.zip /usr/local; cd /usr/local; unzip glassfish-4.0.1-b03.zip ; rm -f glassfish-4.0.1-b03.zip

# ADD glassfish4 /usr/local/glassfish4

# ADD jdk1.7.0_40 /usr/local/jdk1.7.0_40

# ADD gf_support/admin_pwdfile /usr/local/glassfish4/glassfish/domains/domain1/config/admin_pwdfile

# ADD gf_support/change_master_pwdfile /usr/local/var/tmp/gf_support/change_master_pwdfile

# ADD gf_support/domain_pwdfile /usr/local/glassfish4/glassfish/domains/domain1/config/domain_pwdfile

# ADD gf_support/change_admin_pwdfile /usr/local/var/tmp/gf_support/change_admin_pwdfile

ENV JAVA_HOME /usr/local/jdk1.7.0_40
 
ENV GF_HOME /usr/local/glassfish4

ENV PATH $PATH:$JAVA_HOME/bin:$GF_HOME/bin

EXPOSE 4848 8080 8181 8686 7676 3700 3820 3920

# CHANGE MASTER PASSWORD
# asadmin --interactive=false --passwordfile change_master_pwdfile change-master-password

# START DOMAIN
# asadmin --passwordfile=domain_pwdfile start-domain

# CHANGE ADMIN PASSWORD
# asadmin --user admin --interactive=false --passwordfile change_admin_pwdfile change-admin-password

# ENABLE SECURE ADMIN
# asadmin -u admin --passwordfile admin_pwdfile --host localhost --port 4848 enable-secure-admin

# RESTART DOMAIN
# asadmin -u admin --passwordfile admin_pwdfile restart-domain

# CMD ["-u", "admin", "--passwordfile", "/usr/local/glassfish4/glassfish/domains/domain1/config/admin_pwdfile", "start-domain"]
# ENTRYPOINT ["/usr/local/glassfish4/bin/asadmin"]
