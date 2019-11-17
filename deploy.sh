set -xe

DEPLOYMENT_PATH=$(dirname $(realpath $(echo $0)))
APPLICATION_PATH=$(pwd)
VERSION=$(cat ${APPLICATION_PATH}/.docker-image-version)
APP_NAME=$(cat ${APPLICATION_PATH}/.docker-image-name)
PROJECT_ID=$(gcloud config get-value project)

docker tag ${APP_NAME}:${VERSION} eu.gcr.io/${PROJECT_ID}/${APP_NAME}:${VERSION}
docker push eu.gcr.io/${PROJECT_ID}/${APP_NAME}:${VERSION}
kustomize build ${DEPLOYMENT_PATH}/prod | kubectl apply -f -

