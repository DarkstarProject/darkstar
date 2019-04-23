---------------------------------------------------------------------------------------------------
-- func: !setquestvar <logID> <questID> {player}
-- desc: Sets a quest var for the provided quest for the target player
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests")

cmdprops =
{
    permission = 1,
    parameters = "ssssi"
}

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setquestvar <logID> <questID> <var> <value> {player}");
end;

function onTrigger(player, logId, questId, var, value, target)

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

    -- validate quest
    local quest = quests.getQuest(logId, questId)
    if not quest then
        error(player, "Unable to load quest file!")
        return
    end

    -- validate var
    local db_name = false
    if var == 'stage' then
        db_name = quest.vars.stage
    else
        if quest.vars[var] then
            db_name = quest.vars[var]['db_name']
        end
    end
    if not db_name then
        error(player, "Specified quest var not defined in quest file!")
        return
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isPC()) then
            targ = player;
        end
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return;
        end
    end
    
    -- validate value
    if (value == nil) then
        error(player, "You must provide a value.")
        return
    end

    targ:setVar(db_name, value);
    player:PrintToPlayer( string.format( "Set %s's quest variable '%s' for '%s' to %i.", targ:getName(), var, quest.name, value ) );
end