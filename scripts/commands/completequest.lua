---------------------------------------------------------------------------------------------------
-- func: @completequest <logID> <questID> <player>
-- desc: Completes the given quest for the GM or target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, questId, target)
    if (questId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log ID and quest ID!" );
        player:PrintToPlayer( "@completequest <logID> <questID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:completeQuest( logId, questId );
        player:PrintToPlayer( string.format( "Completed Quest for log %u with ID %u for %s", logId, questId, target ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@completequest <logID> <questID> <player>" );
    end
end;