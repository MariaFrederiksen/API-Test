pageextension 50100 "DIR Item Card" extends "Item Card"
{
    actions
    {
        addfirst(Functions)
        {
            action("DIR Download Picture")
            {
                Caption = 'Download Picture';
                Image = ImportCodes;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    httpclient: HttpClient;
                    HttpResponse: HttpResponseMessage;
                    InStr: InStream;
                    Url: Label 'http://ba-consult.dk/downloads/bicycle.jpg';
                begin
                    httpclient.Get(Url, HttpResponse);
                    HttpResponse.Content.ReadAs(InStr);
                    Picture.ImportStream(InStr, 'Default image');
                    CurrPage.Update(true);
                end;

            }
        }
    }

}