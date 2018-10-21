import ballerina/http;
import ballerina/log;

endpoint http:Listener paymentListener {
    port: 8280
};

@http:ServiceConfig {
    basePath: "/bq"
}
service bqAPI bind paymentListener {

    @http:ResourceConfig { 
        methods:["POST"],
        path:"/"
    }
    process (endpoint outboundEp, http:Request req) {
        http:Response res = process(req);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }  
}
