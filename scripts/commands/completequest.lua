---------------------------------------------------------------------------------------------------
-- func: completequest <logID> <questID> <player>
-- desc: Completes the given quest for the GM or target player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests")

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function onTrigger(player, logId, questId, target)

    local logName;
    logId = tonumber(logId) or _G[logId];
    if ((type(logId) == "table")) then
        logName = logId.full_name;
        logId = logId.quest_log;
    end

    questId = tonumber(questId) or _G[questId];
    
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
        if (logName) then
            player:PrintToPlayer( string.format( "Completed %s Quest with ID %u for %s", logName, questId, target ) );
        else
            player:PrintToPlayer( string.format( "Completed Quest for log %u with ID %u for %s", logId, questId, target ) );
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@completequest <logID> <questID> <player>" );
    end
end;