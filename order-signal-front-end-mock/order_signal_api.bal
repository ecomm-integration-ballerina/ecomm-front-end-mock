import ballerina/http;
import ballerina/log;
import ballerina/mime;

endpoint http:Listener notificationListener {
    port: 8280
};

@http:ServiceConfig {
    basePath: "/ecomm-frontend/v2/notification/backend"
}
service NotificationAPI bind notificationListener {

    @http:ResourceConfig { 
        methods:["POST"],
        path:"/",
        body:"orderSignal"
    }
    addOrderSignal (endpoint outboundEp, http:Request req, OrderSignal orderSignal) {
        http:Response res = addOrderSignal(req, orderSignal);
        outboundEp->respond(res) but { error e => log:printError("Error while responding", err = e) };
    }  
}
