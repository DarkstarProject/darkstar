---------------------------------------------------------------------------------------------------
-- func: @setmusic <typeID> <songID>
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
        player:PrintToPlayer("Types: 0 = BGM (Day), 1 = BGM (Night), 2 = Solo-Battle, 3 = Party-Battle, 4 = Chocobo");
        return
    end

    player:ChangeMusic(typeID,songID);

end;