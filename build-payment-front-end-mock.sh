ballerina build payment-front-end-mock
docker build -t rajkumar/payment-front-end-mock:0.1.0 -f payment-front-end-mock/docker/Dockerfile .
docker push rajkumar/payment-front-end-mock:0.1.0
kubectl delete -f payment-front-end-mock/kubernetes/payment_front_end_mock_deployment.yaml
kubectl create -f payment-front-end-mock/kubernetes/payment_front_end_mock_deployment.yaml
kubectl create -f payment-front-end-mock/kubernetes/payment_front_end_mock_svc.yaml