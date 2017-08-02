---------------------------------------------------------------------------------------------------
-- func: addquest <logID> <questID> <player>
-- desc: Adds a quest to the given targets log.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("@addquest <logID> <questID> {player}");
end;

function onTrigger(player, logId, questId, target)
    local logName;

    -- validate logId
    if (logId ~= nil) then
        logId = tonumber(logId) or _G[string.upper(logId)];
    end
    if ((type(logId) == "table") and logId.quest_log ~= nil) then
        logName = logId.full_name;
        logId = logId.quest_log;
    else
        error(player, "Invalid logID.");
        return;
    end
    
    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- validate questId
    if (questId == nil) then
        error(player, "Invalid questID.");
        return;
    else
        questId = tonumber(questId) or _G[string.upper(questId)];
    end

    -- add quest
    targ:addQuest( logId, questId );
    player:PrintToPlayer( string.format( "Added %s Quest with ID %u for %s", logName, questId, targ:getName() ) );
end;