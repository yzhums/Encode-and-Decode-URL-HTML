page 50111 DecoderEncoder
{
    Caption = 'Decoder/Encoder';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(InputString; InputString)
                {
                    Caption = 'Input String';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if InputString = '' then
                            ClearResults();
                    end;
                }
            }
            group(Results)
            {
                field(URLDescoderEncoder; URLDescoderEncoder)
                {
                    Caption = 'URL Decoder/Encoder';
                    Editable = false;
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field(HTMLDescoderEncoder; HTMLDescoderEncoder)
                {
                    Caption = 'HTML Decoder/Encoder';
                    Editable = false;
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(URLEncode)
            {
                Caption = 'URL Encode';
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TypeHelper: Codeunit "Type Helper";
                begin
                    ClearResults();
                    ConvertedString := InputString;
                    URLDescoderEncoder := TypeHelper.UrlEncode(ConvertedString);
                end;
            }
            action(URLDescoder)
            {
                Caption = 'URL Decode';
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TypeHelper: Codeunit "Type Helper";
                begin
                    ClearResults();
                    ConvertedString := InputString;
                    URLDescoderEncoder := TypeHelper.UrlDecode(ConvertedString);
                end;
            }
            action(HTMLEncode)
            {
                Caption = 'HTML Encode';
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TypeHelper: Codeunit "Type Helper";
                begin
                    ClearResults();
                    ConvertedString := InputString;
                    HTMLDescoderEncoder := TypeHelper.HtmlEncode(ConvertedString);
                end;
            }
            action(HTMLDescoder)
            {
                Caption = 'HTML Decode';
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TypeHelper: Codeunit "Type Helper";
                begin
                    ClearResults();
                    ConvertedString := InputString;
                    HTMLDescoderEncoder := TypeHelper.HtmlDecode(ConvertedString);
                end;
            }
        }
    }

    var
        InputString: Text;
        ConvertedString: Text;
        URLDescoderEncoder: Text;
        HTMLDescoderEncoder: Text;

    local procedure ClearResults()
    begin
        ConvertedString := '';
        URLDescoderEncoder := '';
        HTMLDescoderEncoder := '';
    end;
}
