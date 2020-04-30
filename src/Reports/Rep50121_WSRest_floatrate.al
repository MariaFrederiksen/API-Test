report 50121 "DIR WS REST Floatrate"
{
    Caption = 'WS REST Floatrate';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    trigger OnInitReport()
    var
        httpclient: HttpClient;
        httpResponse: HttpResponseMessage;
        Url: Text;
        xmltext: Text;

    begin
        url := 'http://www.floatrates.com/daily/dkk.json';
        httpclient.Get(url, httpResponse);
        httpResponse.Content.ReadAs(xmltext);
        with httpResponse do begin
            if not IsSuccessStatusCode then
                error('Not working - the error was \\statis code: %1\\ Error %2',
                HttpStatusCode,
                ReasonPhrase);
            content.ReadAs(xmltext)
        end;
        Error('Resolved %1', xmltext);
    end;
}