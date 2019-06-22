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

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!completequest <logID> <questID> {player}");
end;

function onTrigger(player, logId, questId, target)

    -- validate logId
    local questLog = GetQuestLogInfo(logId);
    if (questLog == nil) then
        error(player, "Invalid logID.");
        return;
    end
    local logName = questLog.full_name;
    logId = questLog.quest_log;

    -- validate questId
    local areaQuestIds = dsp.quest.id[dsp.quest.area[logId]];
    if (questId ~= nil) then
        questId = tonumber(questId) or areaQuestIds[string.upper(questId)];
    end
    if (questId == nil or questId < 0) then
        error(player, "Invalid questID.");
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

    -- complete quest
    targ:completeQuest( logId, questId );
    player:PrintToPlayer( string.format( "Completed %s Quest with ID %u for %s", logName, questId, targ:getName() ) );
end;
