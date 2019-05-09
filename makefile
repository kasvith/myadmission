cert:
	./gen_certs.sh

store-cert:
	kubectl create secret generic myadmission -n default --from-file=key.pem=certs/myadmission-key.pem --from-file=cert.pem=certs/myadmission-crt.pem

apply:
	kubectl apply -f manifest.yaml

build-image:
	docker build . -t kasvith/myadmission:v1.0.0
