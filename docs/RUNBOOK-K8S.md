Deployment:
helm upgrade --install dknova-app ./helm/dknova-app

Check Pods:
kubectl get pods

Check Services:
kubectl get svc

Check HPA:
kubectl get hpa

Rollback:
helm rollback dknova-app 1

Grafana:
kubectl port-forward svc/monitoring-grafana 3001:80

Prometheus:
kubectl port-forward svc/monitoring-kube-prometheus-prometheus 9090:9090
