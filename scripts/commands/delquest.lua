---------------------------------------------------------------------------------------------------
-- func: delquest <logID> <questID> <player>
-- desc: Deletes the given quest from the GM or target player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function onTrigger(player, logId, questId, target)
    if (questId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and quest id!" );
        player:PrintToPlayer( "@delquest <logID> <questID> <player>" );
        return;
    end

    local logName;
    logId = tonumber(logId) or _G[string.upper(logId)];
    if ((type(logId) == "table")) then
        logName = logId.full_name;
        logId = logId.quest_log;
    end

    questId = tonumber(questId) or _G[string.upper(questId)];

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        targ:delQuest( logId, questId );
        if (logName) then
            player:PrintToPlayer( string.format( "Deleted %s Quest with ID %u for %s", logName, questId, target ) );
        else
            player:PrintToPlayer( string.format( "Deleted Quest for log %u with ID %u from %s", logId, questId, target ) );
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@delquest <logID> <questID> <player>" );
    end
end;