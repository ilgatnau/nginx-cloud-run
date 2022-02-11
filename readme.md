
IMAGE=eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.1


docker build . -t $IMAGE
docker push $IMAGE

docker run -it --rm -p 8080:8080 --name web $IMAGE


gcloud run deploy nginx-cloud-run \
--image=eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.1 \
--allow-unauthenticated \
--min-instances=1 \
--max-instances=3 \
--no-use-http2 \
--platform=managed \
--region=europe-west2 \
--project=gft-db-dbmigration

gcloud run deploy nginx-cloud-run \
--image=eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.2 \
--concurrency=80 \
--platform=managed \
--region=europe-west2 \
--project=gft-db-dbmigration


gcloud run deploy hello \
--image=us-docker.pkg.dev/cloudrun/container/hello \
--no-allow-unauthenticated \
--max-instances=3 \
--no-use-http2 \
--platform=managed \
--region=europe-west2 \
--project=gft-db-dbmigration

curl "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=hello-aruznp6o4a-ew.a.run.app" -H "Metadata-Flavor: Google"

curl -Lv "https://nginx-cloud-run-aruznp6o4a-uc.a.run.app/test" -H "Authorization: Bearer ..."


