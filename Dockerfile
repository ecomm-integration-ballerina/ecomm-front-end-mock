FROM ballerina/ballerina:0.981.1
LABEL maintainer="dev@ballerina.io"

COPY target/ecomm-front-end-mock.balx /home/ballerina 

EXPOSE  7088

CMD ballerina run ecomm-front-end-mock.balx
