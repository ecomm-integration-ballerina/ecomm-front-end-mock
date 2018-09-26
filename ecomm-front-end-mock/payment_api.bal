import ballerina/http;
import ballerina/log;
import ballerina/mime;
import ballerinax/kubernetes;

@kubernetes:Service {
    serviceType: "LoadBalancer",
    name: "ecomm-front-end-mock-service" 
}
endpoint http:Listener paymentListener {
    port: 8280
};

@kubernetes:Deployment {
    name: "ecomm-front-end-mock-deployment",    
    image: "index.docker.io/rajkumar/ecomm-front-end-mock:0.1.0",
    buildImage: false,
    push: false,
    imagePullPolicy: "Always"
}
@http:ServiceConfig {
    basePath: "/ecomm-frontend/v2"
}
service PaymentAPI bind paymentListener {

    @http:ResourceConfig { 
        methods:["GET"],
        path:"/version"
    }
    getVersion (endpoint outboundEp, http:Request req) {
        http:Response res = getVersion(req);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }

    @http:ResourceConfig { 
        methods:["POST"],
        path:"/payments/ref/{referenceId}/capture/async",
        body:"invoice"
    }
    addInvoice (endpoint outboundEp, http:Request req, string referenceId, Invoice invoice) {
        http:Response res = addInvoice(req, referenceId, invoice);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }

    @http:ResourceConfig { 
        methods:["POST"],
        path:"/payments/ref/{referenceId}/cancel/async",
        body:"refund"
    }
    addRefund (endpoint outboundEp, http:Request req, string referenceId, Refund refund) {
        http:Response res = addRefund(req, referenceId, refund);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }    
}
