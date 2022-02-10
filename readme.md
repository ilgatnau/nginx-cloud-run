

docker build . -t eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.1
docker push eu.gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.1

docker run -it --rm -p 8080:8080 --name web gcr.io/gft-db-dbmigration/nginx-cloud-run:1.0.1


curl "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=hello-aruznp6o4a-ew.a.run.app" -H "Metadata-Flavor: Google"

curl -Lv "https://nginx-cloud-run-aruznp6o4a-uc.a.run.app/test" -H "Authorization: Bearer ..."


