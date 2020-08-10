FROM tomcat:7-jre8

ENV CATALINA_OPTS="$CATALINA_OPTS -Xms64m -Xmx2048m -XX:MaxPermSize=2048m"

WORKDIR /usr/local/tomcat

RUN rm -rf ./webapps/*

COPY ./build/libs/*.war ./webapps/ROOT.war

EXPOSE 8080

CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
