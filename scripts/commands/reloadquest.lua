---------------------------------------------------------------------------------------------------
-- func: !reloadglobal <questLog> <questID>
-- desc: Attempt to reload specified quest without a restart.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!reloadquest <logID> <questID>")
end

function onTrigger(player, logId, quest_string)
    -- validate logId
    if type(logId) == "string" then
        logId = dsp.quest.log_id[logId]
    end
    local area = dsp.quest.area[logId]
    if logId == nil or area == nil then
        error(player, "Invalid logID.")
        return
    end
    
    local logName = questLog.full_name;
    logId = questLog.quest_log;

    -- validate questId
    local areaQuestIds = dsp.quest.id[area]
    local questId = nil
    if (quest_string ~= nil) then
        questId = areaQuestIds[string.upper(quest_string)];
    end
    if (questId == nil or questId < 0) then
        error(player, "Unable to find quest file for ".. quest_string)
        return
    end

    -- build filepath
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
    local quest_filename = quest_filename .. area_dirs[logId] .. '/' .. string.lower(quest_string)

    package.loaded[quest_filename] = nil
    dsp.quest.object[logId][questId] = nil
    local quest = require(quest_filename)
    dsp.quest.object[logId][questId] = quest

    player:PrintToPlayer(string.format("Quest '".. quest.name .. "' has been reloaded.",String))
end
