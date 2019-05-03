require("scripts/globals/missions")
require("scripts/globals/quests")

local thisQuest = dsp.quest.newQuest()

thisQuest.name = "Fertile Ground"
thisQuest.log_id = dsp.quest.log_id.ADOULIN
thisQuest.quest_id = dsp.quest.id.adoulin.FERTILE_GROUND
thisQuest.string_key = dsp.quest.string.adoulin[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.var_prefix = "[Q]["..thisQuest.log_id.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.var_prefix,
    additional = {}
}

thisQuest.requirements =
{
    quests =
    {
        {
            log_id = dsp.quest.log_id.ADOULIN,
            quest_id = dsp.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON
        }
    },
    fame =
    {
        area = dsp.quest.fame.ADOULIN,
        level = 2
    }
}

thisQuest.rewards =
{
    exp = 500,
    bayld = 300,
    fame_area = dsp.quest.fame.ADOULIN
}

thisQuest.temporary =
{
    items = {},
    key_items = {dsp.ki.BOTTLE_OF_FERTILIZER_X}
}

-----------------------------------
-- QUEST STAGES
-----------------------------------
thisQuest.stages =
{
    -- [TODO] Stage 0: Talk to Chalvava, Rala Waterways, to begin the quest
    [dsp.quest.stage.STAGE0] =
    {
        [dsp.zone.RALA_WATERWAYS] =
        {
            onTrigger =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            },
            onEventFinish =
            {
                -- TODO: Implement Chalvava's portions of the quest
            }
        }
    },
    -- Stage 1: Talk to Shipilolo, Western Adoulin, to get Bottle of Fertilizer X KI
    [dsp.quest.stage.STAGE1] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            onTrigger =
            {
                ['Shipilolo'] = function(player, npc)
                    return thisQuest.startEvent(player, 2850) -- Gives Bottle of Fertilizer X to player
                end
            },
            onEventFinish =
            {
                [2850] = function(player, option)
                    -- Shipilolo, giving Bottle of Fertilizer X
                    if thisQuest.giveKeyItem(player, dsp.ki.BOTTLE_OF_FERTILIZER_X) then
                        return thisQuest.advanceStage(player)
                    end
                end
            }
        },
        [dsp.zone.RALA_WATERWAYS] =
        {
            onTrigger =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            }
        }
    },
    -- [TODO] Stage 2: Talk to Chalvava again, quest complete
    [dsp.quest.stage.STAGE2] =
    {
        [dsp.zone.RALA_WATERWAYS] =
        {
            onTrigger =
            {
                ['Chalvava'] = function(player, npc)
                    -- TODO: Implement Chalvava's portions of the quest
                    return true
                end
            },
            onEventFinish =
            {
                -- TODO: Implement Chalvava's portions of the quest
            }
        }
    }
}

return thisQuest
