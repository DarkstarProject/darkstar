---------------------------------------------------------------------------------------------------
-- func: @addquest <logID> <questID> <player>
-- desc: Adds a quest to the given targets log.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, questId, target)
    if (questId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log ID and quest ID!" );
        player:PrintToPlayer( "@addquest <logID> <questID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:addQuest( logId, questId );
        player:PrintToPlayer( string.format( "Added Quest for log %u with ID %u to %s", logId, questId, target ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@addquest <logID> <questID> <player>" );
    end
end;