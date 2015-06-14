---------------------------------------------------------------------------------------------------
-- func: @delquest <logID> <questID> <player>
-- desc: Deletes the given quest from the GM or target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, questId, target)
    if (questId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and quest id!" );
        player:PrintToPlayer( "@delquest <logID> <questID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:delQuest( logId, questId );
        player:PrintToPlayer( string.format( "Deleted Quest for log %u with ID %u from %s", logId, questId, target ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@delquest <logID> <questID> <player>" );
    end
end;