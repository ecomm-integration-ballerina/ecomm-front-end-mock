import ballerina/math;
import ballerina/io;

public function process (http:Request req) returns http:Response {

    http:Response res = new;
    if (math:randomInRange(1,5) == 1) {
        res.statusCode = 500;
        res.setTextPayload("Error queuing the request");
    } else {
        res.statusCode = 201;
        res.setTextPayload("Request queued successfully ");
    }

	return res;
}