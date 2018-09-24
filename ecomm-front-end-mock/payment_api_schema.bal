public type Invoice record {
    string amount,
    string totalAmount,
    string currency,
    string invoiceId,
    string settlementId,
    string itemIds,
    json additionalProperties,
};

public type Refund record {
    string requestId,
    string creditMemoId,
    string invoiceId,
    string settlementId,
    string kind,
    string currency,
    string countryCode,
    string comments, 
    string amount,
    string totalAmount,
    string itemIds,
};