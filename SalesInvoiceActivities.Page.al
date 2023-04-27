page 50130 "Sales Invoice Activities"
{
    PageType = CardPart;
    SourceTable = "Sales Invoice Cue";
    Caption = 'Sales Invoice Activities';

    layout
    {
        area(Content)
        {
            cuegroup("Sales Invoice")
            {
                Caption = 'Sales Invoice';
                field("Sales Invoice - Open"; Rec."Sales Invoice - Open")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is Sales Invoice - Open cue.';
                }
                field("Sales Invoice - Released"; Rec."Sales Invoice - Released")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is Sales Invoice - Released cue.';
                }
                field("Sales This Month"; Rec."Sales This Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is Sales This Month cue.';
                    DrillDownPageID = "Customer Ledger Entries";
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec."Sales This Month" := Rec.CalcSalesThisMonthAmount();
    end;
}