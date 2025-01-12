apply: # Will app all the files using Kubectl
	kubectl apply \
	-f artifacts/grafana-deployment.yaml -f artifacts/grafana-pvc.yaml \
	-f artifacts/prometheus-deployment.yaml -f artifacts/prometheus-pvc.yaml -f artifacts/prometheus-configmap.yaml \
	-f artifacts/prometheus-sa.yaml -f artifacts/prometheus-rbac.yaml -f artifacts/prometheus-crb.yaml -f artifacts/prometheus-service.yaml

forward:
	kubectl port-forward svc/grafana -n monitoring 3000:3000 & \
	kubectl port-forward svc/prometheus -n monitoring 9090:9090
get-svc:
	kubectl -n monitoring get svc
	minikube ip
delete:
	kubectl delete -f artifacts/grafana-deployment.yaml -f artifacts/prometheus-deployment.yaml -f artifacts/prometheus-service.yaml -f artifacts/grafana-service.yaml
delete-all:
	kubectl delete -f artifacts/grafana-deployment.yaml -f artifacts/prometheus-deployment.yaml -f artifacts/grafana-pvc.yaml -f artifacts/prometheus-pvc.yaml
	kubectl delete -n artifacts/monitoring
restart:
	kubectl rollout restart deployment prometheus grafana -n monitoring