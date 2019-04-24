require("scripts/globals/missions")
require("scripts/globals/quests")

local thisQuest = dsp.quest.newQuest()

thisQuest.name = "The Old Man and the Harpoon"
thisQuest.log_id = dsp.quest.log_id.ADOULIN
thisQuest.quest_id = dsp.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON
thisQuest.string_key = dsp.quest.string.adoulin[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.var_prefix = "[Q]["..thisQuest.log_id.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.var_prefix,
    additional =
    {
        --['name'] = { type = dsp.quest.var.CHAR, preserve = false, db_name = 'some_var' },
    }
}

thisQuest.requirements =
{
    missions =
    {
        {
            mission_log = ADOULIN,
            mission_id = LIFE_ON_THE_FRONTIER
        }
    },
    fame =
    {
        area = dsp.quest.fame.ADOULIN,
        level = 1
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
    key_items = {dsp.ki.BROKEN_HARPOON, dsp.ki.EXTRAVAGANT_HARPOON}
}

-----------------------------------
-- QUEST STAGES
-----------------------------------
thisQuest.stages =
{
    -- Stage 0: Talk to Jorin, Western Adoulin, to get Broken Harpoon KI and start quest
    [dsp.quest.stage.STAGE0] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Jorin'] = function(player, npc)
                    if thisQuest.checkRequirements(player) then
                        -- Starting quest, his harpoon is broken
                        return thisQuest.startEvent(player, 2540) 
                    end
                end
            },
            ['onEventFinish'] =
            {
                [2540] = function(player, option)
                    -- Jorin, starting quest
                    if thisQuest.giveKeyItem(player, dsp.ki.BROKEN_HARPOON) then
                        return thisQuest.begin(player)
                    end
                end
            }
        }
    },
    -- Stage 1: Talk to Shipilolo, Western Adoulin, to exchange Broken Harpoon KI for Extravagant Harpoon KI
    [dsp.quest.stage.STAGE1] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Jorin'] = function(player, npc)
                    -- Begs player to hurry up
                    return thisQuest.startEvent(player, 2541) 
                end,
                ['Shipilolo'] = function(player, npc)
                    -- Upgrading Broken Harpoon to Extravagant Harpoon
                    return thisQuest.startEvent(player, 2543) 
                end
            },
            ['onEventFinish'] =
            {
                [2543] = function(player, option)
                    -- Shipilolo, fixes Broken Harpoon and advances quest
                    if npcUtil.giveKeyItem(player, dsp.ki.EXTRAVAGANT_HARPOON) then
                        thisQuest.delKeyItem(player, dsp.ki.BROKEN_HARPOON)
                        return thisQuest.advanceStage(player)
                    end
                end
            }
        }
    },
    -- Stage 2: Talk to Jorin, to give him Extravagant Harpoon and finish quest
    [dsp.quest.stage.STAGE2] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Jorin'] = function(player, npc)
                    -- Giving Jorin the Extravagant Harpoon
                    return thisQuest.startEvent(player, 2542) 
                end
            },
            ['onEventFinish'] =
            {
                [2542] = function(player, option)
                    -- Jorin, finishing quest
                    if thisQuest.complete(player, thisQuest) then
                        thisQuest.delKeyItem(player, dsp.ki.EXTRAVAGANT_HARPOON)
                        return true
                    end
                end
            }
        }
    }
}

return thisQuest
