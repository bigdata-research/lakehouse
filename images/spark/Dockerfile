#+-----------------------------------------+
#|           Imagem Spark 3.5.0            | 
#|                                         |
#| O que decide se é Driver ou Worker      |
#| é o comando de inicialização no compose |
#+-----------------------------------------+

FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

RUN apt-get update --fix-missing

#+-----------------+
#| Install cURL |
#+-----------------+

RUN apt-get install curl -y

#+--------------------+
#| Install Java 11 |
#+--------------------+

RUN apt-get install openjdk-11-jdk -y                                           && \
    echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc     && \
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH "${JAVA_HOME}/bin:$PATH"

 #+------------------------+
 #| Install Spark 3.4.3 |
 #+------------------------+

RUN curl -O https://dlcdn.apache.org/spark/spark-3.4.3/spark-3.4.3-bin-hadoop3.tgz &&\
    tar zxvf spark-3.4.3-bin-hadoop3.tgz -C /usr/local &&\
    rm spark-3.4.3-bin-hadoop3.tgz &&\
    cd /usr/local &&\
    ln -sT spark-3.4.3-bin-hadoop3 spark

RUN echo "export SPARK_HOME=/usr/local/spark" >> ~/.bashrc
RUN echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> ~/.bashrc

ENV SPARK_HOME /usr/local/spark
ENV PATH "${SPARK_HOME}/bin:$PATH" 



#+----------------------------------+
#| Installing S3/MinIO dependencies |
#+----------------------------------+

RUN curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar \
    --output ${SPARK_HOME}/jars/hadoop-aws-3.3.4.jar

RUN curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar \
    --output ${SPARK_HOME}/jars/aws-java-sdk-bundle-1.12.262.jar

RUN curl https://jdbc.postgresql.org/download/postgresql-42.5.0.jar \
    --output ${SPARK_HOME}/jars/postgresql-42.5.0.jar

#RUN curl https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.2_2.13/1.3.0/iceberg-spark-runtime-3.2_2.13-1.3.0.jar \
#    --output ${SPARK_HOME}/jars/iceberg-spark-runtime-3.2_2.13-1.3.0.jar



#+-------------------------------------+
#| Installing Apache HUDI dependencies |
#+-------------------------------------+

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3.4-bundle_2.12/0.14.0/hudi-spark3.4-bundle_2.12-0.14.0.jar \
    --output ${SPARK_HOME}/jars/hudi-spark3.4-bundle_2.12-0.14.0.jar

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-utilities-bundle_2.12/0.14.1/hudi-utilities-bundle_2.12-0.14.1.jar \
    --output ${SPARK_HOME}/jars/hudi-utilities-bundle_2.12-0.14.1.jar

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark-common_2.12/0.14.1/hudi-spark-common_2.12-0.14.1.jar \
    --output ${SPARK_HOME}/jars/hudi-spark-common_2.12-0.14.1.jar

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark_2.12/0.14.1/hudi-spark_2.12-0.14.1.jar \
    --output ${SPARK_HOME}/jars/hudi-spark_2.12-0.14.1.jar 

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-common/0.14.1/hudi-common-0.14.1.jar \
    --output ${SPARK_HOME}/jars/hudi-common-0.14.1.jar

RUN curl https://repo1.maven.org/maven2/org/apache/hudi/hudi-hive-sync/0.14.1/hudi-hive-sync-0.14.1.jar \
    --output ${SPARK_HOME}/jars/hudi-hive-sync-0.14.1.jar 

# RUN curl link \
#     --output ${SPARK_HOME}/jars/test 


# COPY hadoop-metrics2-s3a-file-system.properties ${SPARK_HOME}/conf/hadoop-metrics2-s3a-file-system.properties

USER root