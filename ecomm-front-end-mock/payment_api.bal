import ballerina/http;
import ballerina/log;
import ballerina/mime;

endpoint http:Listener paymentListener {
    port: 7088
};


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
        body:"payment"
    }
    addPayment (endpoint outboundEp, http:Request req, string referenceId, Payment payment) {
        http:Response res = addPayment(req, referenceId, payment);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }

}
