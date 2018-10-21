public type OrderSignal record {
    Orders orders;
};

public type Orders record {
    Order[] ^"order";
};

public type Order record {
    string orderNo;
    string orderDate;
    string originalOrderNo;
    string currency;
    record {
        string orderStatus;
        string shippingStatus;
    } status;
    string MFGOrderNumber;
    string MFGCustomerNumber;
    ProductLineItems productLineItems;
    Shipments shipments;
};

public type ProductLineItems record {
    ProductLineItem[] productLineItem;
};

public type ProductLineItem record {
    string lineItemText;
    string taxRate;
    string productName;
    string quantity;
    string shipmentId;
    string shipmentQuantity;
    string promiseDate;
    string lineItemPosition;
    string shippingStatus;
    string shipmentDelayReason;
};

public type Shipments record {
    Shipment[] shipment;
};

public type Shipment record {
    string shipmentId;
    record {
        string shippingStatus;
    } status;
    string shipmentDelayReason;
    string shippingMethod;
    string trackingNumber;
    string carrier;
    string shipmentDate;
};