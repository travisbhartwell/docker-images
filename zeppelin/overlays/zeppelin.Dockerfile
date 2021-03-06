# Install Zeppelin
RUN \
  npm install -g grunt-cli phantomjs-prebuilt && \
  git clone https://github.com/apache/incubator-zeppelin.git && \
  cd /incubator-zeppelin && \
  git checkout $ZEPPELIN_TAG
WORKDIR /incubator-zeppelin
RUN mvn package -q $ZEPPELIN_BUILD_ARGS
ENV ZEPPELIN_JAVA_OPTS "-Dspark.executor.home=/opt/$SPARK_DIRNAME"

CMD ["bin/zeppelin.sh", "$ZEPPELIN_START_ARGS", "start"]
