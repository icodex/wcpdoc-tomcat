#docker image of wcpdoc tomcat
# Author: iCodex

FROM tomcat:8
MAINTAINER Shing.L <icodex@msn.com>

ENV WORK_PATH /usr/local/tomcat/webapps
ENV INIT_DB_CONN init_jdbc.sh
ENV DATA webapps

COPY ./$INIT_DB_CONN $WORK_PATH/
COPY ./$DATA $WORK_PATH/

RUN chmod a+x $WORK_PATH/$INIT_DB_CONN

CMD ["sh", "/usr/local/tomcat/webapps/init_jdbc.sh"]
