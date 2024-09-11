FROM --platform=linux/amd64 apache/superset:latest

USER root

RUN apt-get update && apt-get install -y \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient \
    && pip install sqlalchemy-mongobi \
    && pip install pymysql

RUN pip install pyodbc
RUN curl -L -o /mysql-connector-java-5.1.34.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar
ENV CLASSPATH=/mysql-connector-java-5.1.34.jar:${CLASSPATH}

RUN apt-get update && apt-get install -y wget tar
RUN mkdir /odbc
RUN wget -c https://github.com/mongodb/mongo-bi-connector-odbc-driver/releases/download/v1.4.5/mongodb-connector-odbc-1.4.5-ubuntu-16.04-64.tar.gz -O - | tar -xz
RUN cp mongodb-connector-odbc-1.4.5-ubuntu-16.04-64/libmdbodbcw.so /usr/local/lib/libmdbodbcw.so
RUN cp mongodb-connector-odbc-1.4.5-ubuntu-16.04-64/libmdbodbca.so /usr/local/lib/libmdbodbca.so

RUN echo "prophet" >> requirements/base.txt
RUN echo "git+https://github.com/lenoyjacob/sqlalchemy_dremio.git" >> requirements/base.txt
RUN pip install prophet

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN apt-get update && apt-get install -y git
RUN pip install git+https://github.com/lenoyjacob/sqlalchemy_dremio.git

USER superset

ENV LIBMYSQL_ENABLE_CLEARTEXT_PLUGIN=1

ENTRYPOINT ["/entrypoint.sh"]