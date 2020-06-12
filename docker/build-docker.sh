cd ../
mvn -Pdistribution -pl distribution/server-dist -am -Dmaven.test.skip clean install

export VERSION=0.0.1
export IMAGE_NAME=bigconnect-idm

docker login registry.cloud.bigconnect.io
docker build -t $IMAGE_NAME:$VERSION -f docker/Dockerfile .
docker tag $IMAGE_NAME:$VERSION registry.cloud.bigconnect.io/$IMAGE_NAME:$VERSION
docker push registry.cloud.bigconnect.io/$IMAGE_NAME:$VERSION
