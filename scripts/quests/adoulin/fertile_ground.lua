require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local this_quest = {}

this_quest.name = "Fertile Ground"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quest.log_id.ADOULIN
this_quest.quest_id = dsp.quest.id.adoulin.FERTILE_GROUND

this_quest.repeatable = false

this_quest.requirements =
{
    quests =
    {
        {
            ['area'] = ADOULIN,
            ['quest_id'] = dsp.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON
        }
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

this_quest.vars =
{
    stage = "[Q]["..this_quest.log_id.."]["..this_quest.quest_id.."]",
    preserve_main_on_complete = false,
    additional = {}
}

this_quest.stages =
{
    -- [TODO] Stage 0: Talk to Chalvava, Rala Waterways, to begin the quest
    [dsp.quests.enums.stages.STAGE0] =
    {
        [dsp.zone.RALA_WATERWAYS] =
        {
            ['onTrigger'] =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                -- TODO: Implement Chalvava's portions of the quest
            }
        }
    },
    -- Stage 1: Talk to Shipilolo, Western Adoulin, to get Bottle of Fertilizer X KI
    [dsp.quests.enums.stages.STAGE1] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Shipilolo'] = function(player, npc)
                    player:startEvent(2850) -- Gives Bottle of Fertilizer X to player
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2850] = function(player, option)
                    -- Shipilolo, giving Bottle of Fertilizer X
                    if npcUtil.giveKeyItem(player, dsp.ki.BOTTLE_OF_FERTILIZER_X) then
                        dsp.quests.advanceStage(player, this_quest)
                        return true
                    end
                end
            }
        },
        [dsp.zone.RALA_WATERWAYS] =
        {
            ['onTrigger'] =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            }
        }
    },
    -- [TODO] Stage 2: Talk to Chalvava again, quest complete
    [dsp.quests.enums.stages.STAGE2] =
    {
        [dsp.zone.RALA_WATERWAYS] =
        {
            ['onTrigger'] =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                -- TODO: Implement Chalvava's portions of the quest
            }
        }
    }
}

return this_quest