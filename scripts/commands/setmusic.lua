---------------------------------------------------------------------------------------------------
-- func: @setmusic <typeID> <songID>
-- auth: forgottenandlost
-- desc: Temporarily changes music played by users client
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player,typeID,songID)

    if (typeID == nil or songID == nil) then
        player:PrintToPlayer("Both a music type and a music track must be specified.");
        player:PrintToPlayer("@setmusic <typeID> <songID>");
        player:PrintToPlayer("Types: 1 = Background, 2 = SoloBattle, 3 = Party Battle, 4 = Chocobo");
        return
    end

    player:ChangeMusic(typeID,songID);

end;