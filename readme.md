
IMAGE=eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.15

docker build . -t $IMAGE

docker push $IMAGE

gcloud run deploy nginx-cloud-run \
--image=$IMAGE \
--concurrency=80 \
--platform=managed \
--region=europe-west2 \
--project=gft-db-dbmigration

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

gcloud run services add-iam-policy-binding nginx-cloud-run \
  --member='serviceAccount:276901701528-compute@developer.gserviceaccount.com' \
  --role='roles/run.invoker'



## httpbin test workload

gcloud run deploy httpbin-private \
--image=eu.gcr.io/gft-db-dbmigration/httpbin:latest \
--no-allow-unauthenticated \
--port=80 \
--max-instances=2 \
--no-use-http2 \
--platform=managed \
--region=europe-west1 \
--project=gft-db-dbmigration

curl "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=hello-aruznp6o4a-ew.a.run.app" -H "Metadata-Flavor: Google"

curl -Lv "https://nginx-cloud-run-aruznp6o4a-uc.a.run.app/test" -H "Authorization: Bearer ..."


