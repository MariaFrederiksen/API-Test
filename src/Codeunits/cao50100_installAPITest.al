codeunit 50100 "DIR Install API Test"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        WebServiceManagement: codeunit "Web Service Management";
        ObjectType: Option "TableData","Table",,"Report",,"Codeunit","XMLport","MenuSuite","Page","Query","System","FieldNumber";
    begin
        WebServiceManagement.CreateTenantWebService(ObjectType::Page, Page::"DIR WS Customer SOAP", 'WSCustomerSOAP', true); //True for publish
        WebServiceManagement.CreateTenantWebService(ObjectType::Page, Page::"DIR WS Customer OData", 'WSCustomerOData', true);
        WebServiceManagement.CreateTenantWebService(ObjectType::Page, Page::"DIR WS Customer API", 'WSCustomerAPI', true);
    end;
}