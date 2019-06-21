---------------------------------------------------------------------------------------------------
-- func: !reloadquest <questLog> <questID>
-- desc: Attempt to reload specified quest without a restart.
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg .. "\nUsage: !reloadquest <logID> <questID>")
end

function onTrigger(player, logId, quest_string)
    -- validate logId
    if type(logId) == "string" then
        logId = dsp.quest.log[string.upper(logId)]
    end
    local area = dsp.quest.area[logId]
    if logId == nil or area == nil then
        error(player, "Invalid logID.")
        return
    end

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
        [dsp.quest.log.SANDORIA]    = 'sandoria',
        [dsp.quest.log.BASTOK]      = 'bastok',
        [dsp.quest.log.WINDURST]    = 'windurst',
        [dsp.quest.log.JEUNO]       = 'jeuno',
        [dsp.quest.log.OTHER_AREAS] = 'other_areas',
        [dsp.quest.log.OUTLANDS]    = 'outlands',
        [dsp.quest.log.AHT_URHGAN]  = 'aht_urhgan',
        [dsp.quest.log.CRYSTAL_WAR] = 'crystal_war',
        [dsp.quest.log.ABYSSEA]     = 'abyssea',
        [dsp.quest.log.ADOULIN]     = 'adoulin',
        [dsp.quest.log.COALITION]   = 'coalition'
    }
    local quest_filename = quest_filename .. area_dirs[logId] .. '/' .. string.lower(quest_string)

    package.loaded[quest_filename] = nil
    dsp.quest.object[area][questId] = nil
    local quest = require(quest_filename)
    dsp.quest.object[area][questId] = quest

    player:PrintToPlayer(string.format("Quest '".. quest.name .. "' has been reloaded.",String))
end
