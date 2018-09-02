# ecomm-front-end-mock
Mock implementation of e-commerce frontend

- ballerina build ecomm-front-end-mock
- docker build -t ecomm-front-end-mock:v1 .
- docker run -d -p 7088:7088 ecomm-front-end-mock:v1
- curl -i -v http://localhost:7088/ecomm-frontend/version
