FROM tomcat:8.0

MAINTAINER hemanth.sai01@gmail.com

USER root

COPY ["jenkins.war","/usr/local/tomcat/webapps/"]
COPY ["context.xml","/usr/local/tomcat/webapps/manager/META-INF"]
COPY ["tomcat-users.xml","/usr/local/tomcat/conf/"]

CMD ["catalina.sh","run"]
