helm:
	helm upgrade --install dagster dagster/dagster -f kubernetes/helm/dagster.yaml

dagit:
	echo "Visit http://127.0.0.1:8080 to open Dagit"
	kubectl port-forward \
		$$(kubectl get pods -l "app.kubernetes.io/name=dagster,app.kubernetes.io/instance=dagster,component=dagit" -o jsonpath="{.items[0].metadata.name}") \
		8080:80