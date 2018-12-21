require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

-- [TODO] Stage 0: Talk to Chalvava, Rala Waterways, to begin the quest
-- Stage 1: Talk to Shipilolo, Western Adoulin, to get Bottle of Fertilizer X KI
-- [TODO] Stage 2: Talk to Chalvava again, quest complete

local this_quest = {}

this_quest.name = "Fertile Ground"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quests.enums.log_ids.ADOULIN
this_quest.quest_id = dsp.quests.enums.quest_ids.adoulin.FERTILE_GROUND

this_quest.repeatable = false
this_quest.vars =
{
    stage = "[Q]".."["..this_quest.log_id.."]".."["..this_quest.quest_id.."]",
    preserve_main_on_complete = false,
    additional = {}
}

this_quest.requirements =
{
    quests =
    {
        {
            ['area'] = ADOULIN,
            ['quest_id'] = dsp.quests.enums.quest_ids.adoulin.THE_OLD_MAN_AND_THE_HARPOON
        }
        -- [1] = { ['quest'] = require("scripts/globals/quests/adoulin/the_old_man_and_the_harpoon") }
    },
    fame =
    {
        ['area'] = this_quest.area,
        ['level'] = 2
    }
}

this_quest.rewards =
{
    sets =
    {
        [1] =
        {
            exp = 500,
            bayld = 300,
            fame_area = dsp.quests.enums.fame_areas.ADOULIN
        }
    }
}

this_quest.temporary =
{
    items = {},
    key_items = {dsp.ki.BOTTLE_OF_FERTILIZER_X}
}

this_quest.npcs =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        ["Shipilolo"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 1 then
                    player:startEvent(2850) -- Progresses Quest: 'Fertile Ground'
                    return true
                end
            end
        }
    },
    [dsp.zone.RALA_WATERWAYS] =
    {
        ["Chalvava"] =
        {
            onTrigger = function(player, npc)
                -- TODO: Implement Chalvava's portions of the quest
            end
        }
    }
}

this_quest.events =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        [2850] =
        {
            onEventFinish = function(player, option)
                -- Shipilolo, progresses Quest: 'Fertile Ground'
                if npcUtil.giveKeyItem(player, dsp.ki.BOTTLE_OF_FERTILIZER_X) then
                    dsp.quests.setStage(player, this_quest, 2)
                    return true
                end
            end
        }
    },
    [dsp.zone.RALA_WATERWAYS] =
    {
        -- TODO: find Chalvava's eventses and implement their onFinishes
    }
}

return this_quest