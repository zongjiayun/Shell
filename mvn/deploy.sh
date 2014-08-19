
./apache-maven-3.0.5/bin/mvn -X deploy:deploy-file -DgroupId=com.tuan800.common \
  -DartifactId=hadoop-lzo \
  -Dversion=5.0.1 \
  -Dpackaging=jar \
  -Dfile=./hadoop-lzo-5.0.1.jar \
  -DrepositoryId=nexus-deploy \
  -Durl=http://xxxxxx/nexus/content/repositories/releases/    ## 此目录下需为 Java 包名目录
