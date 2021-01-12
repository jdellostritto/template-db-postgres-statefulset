.PHONY: image delete kube-apply kube-delete kube-apply-cron kube-delete-cron

IMAGE ?= acme.io/postgres

DOCKER_COMPOSE ?= docker-compose
RUN_CONFIG ?= -f docker-compose.yml

COMPOSE ?= $(DOCKER_COMPOSE) $(RUN_CONFIG)

image:
	$(COMPOSE) build

delete:
	docker image rm $(IMAGE)

kube-apply:
	kubectl apply -f ./kubernetes/kubernetes-postgres.yml
	
kube-delete:
	kubectl delete -f ./kubernetes/kubernetes-postgres.yml

kube-apply-cron:
	kubectl apply -f ./kubernetes/kubernetes-postgres-cronjob.yml

kube-delete-cron:
	kubectl delete -f ./kubernetes/kubernetes-postgres-cronjob.yml
