---------------------------------------------------------------------------------------------------
-- func: !reloadglobal <logID> <questID>
-- desc: Attempt to reload specified quest without a restart.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!reloadquest <logID> <questID>");
end;

function onTrigger(player, logId, quest_string)
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
    local questId = nil;
    if (quest_string ~= nil) then
        questId = areaQuestIds[string.upper(quest_string)];
    end
    if (questId == nil or questId < 0) then
        error(player, "Invalid questID.");
        return;
    end

    local quest_filename = 'scripts/quests/'
    local area_dirs =
    {
        [dsp.quest.log_id.SANDORIA]    = 'sandoria',
        [dsp.quest.log_id.BASTOK]      = 'bastok',
        [dsp.quest.log_id.WINDURST]    = 'windurst',
        [dsp.quest.log_id.JEUNO]       = 'jeuno',
        [dsp.quest.log_id.OTHER_AREAS] = 'other_areas',
        [dsp.quest.log_id.OUTLANDS]    = 'outlands',
        [dsp.quest.log_id.AHT_URHGAN]  = 'aht_urhgan',
        [dsp.quest.log_id.CRYSTAL_WAR] = 'crystal_war',
        [dsp.quest.log_id.ABYSSEA]     = 'abyssea',
        [dsp.quest.log_id.ADOULIN]     = 'adoulin',
        [dsp.quest.log_id.COALITION]   = 'coalition'
    }
    local quest_file = dsp.quest.string[dsp.quest.area[logId]][questId]
    if quest_file then
        quest_filename = quest_filename .. area_dirs[logId] .. '/' .. string.lower(quest_file)
        package.loaded[quest_filename] = nil;
        local quest = require(quest_filename);
        player:PrintToPlayer(string.format("Quest '".. quest.name .. "' has been reloaded.",String));
    else
        error(player, "Unable to find quest file for ".. quest_string)
    end
end;
