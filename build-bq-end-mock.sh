ballerina build bq.mock
docker build -t rajkumar/bq-mock:0.1.0 -f bq.mock/docker/Dockerfile .
docker push rajkumar/bq-mock:0.1.0
kubectl delete -f bq.mock/kubernetes/bq_mock_deployment.yaml
kubectl create -f bq.mock/kubernetes/bq_mock_deployment.yaml
kubectl create -f bq.mock/kubernetes/bq_mock_svc.yaml