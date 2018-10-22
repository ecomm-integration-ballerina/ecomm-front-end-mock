ballerina build order-signal-front-end-mock
docker build -t rajkumar/order-signal-front-end-mock:0.1.0 -f order-signal-front-end-mock/docker/Dockerfile .
docker push rajkumar/order-signal-front-end-mock:0.1.0
kubectl delete -f order-signal-front-end-mock/kubernetes/order_signal_front_end_mock_deployment.yaml
kubectl create -f order-signal-front-end-mock/kubernetes/order_signal_front_end_mock_deployment.yaml
kubectl create -f order-signal-front-end-mock/kubernetes/order_signal_front_end_mock_svc.yaml