codeunit 50130 "Company Info Assisted Setup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', true, true)]
    local procedure OnRegisterAssistedSetup()
    var
        AssistedSetup: Codeunit "Assisted Setup";
    begin
        if not AssistedSetup.Exists(Page::"Company Info Wizard") then
            AssistedSetup.Add(CreateGuid(),
                                Page::"Company Info Wizard",
                                'Set up your company in class',
                                "Assisted Setup Group"::Extensions);
    end;
}