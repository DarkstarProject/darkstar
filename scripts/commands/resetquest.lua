---------------------------------------------------------------------------------------------------
-- func: !resetquest <logID> <questID> {player}
-- desc: Resets the target's progress in a quest (log status, quest vars, and temporary key items)
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!resetquest <logID> <questID> {player}");
end;

function onTrigger(player,logId,questId,target)

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
        targ = player:getCursorTarget();
        if (targ == nil or not targ:isPC()) then
            targ = player;
        end
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- fetch the quest table
    local quest = dsp.quests.getQuestTable(logId, questId)

    if quest then
        -- Begin resetting all quest progress to the best of our ability
        targ:delQuest(logId, questId) -- Delete quest status
        targ:setVar(quest.vars.stage, 0) -- Reset stage var
        for name, var in pairs(quest.vars.additional) do -- Purge any additional quest vars
            handleQuestVar(targ, quest, name, 0, "resetquest: ", nil)
        end
        for _, ki in pairs(quest.temporary.key_items) do -- Delete any temporary key items
            player:delKeyItem(ki)
        end
        player:PrintToPlayer( string.format("%s's progress for %s quest '%s' has been reset.", targ:getName(), logName, quest.name) )
    else
        -- Quest table not defined for the given ID
        player:PrintToPlayer( string.format("Unable to reset %s quest ID %i. No quest table found.", logName, questId) )
    end
end;
