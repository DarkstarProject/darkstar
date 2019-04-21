require("scripts/globals/missions")
require("scripts/globals/quests")

local thisQuest = quests.newQuest()

thisQuest.name = "The Old Man and the Harpoon"
thisQuest.log_id = dsp.quest.log_id.ADOULIN
thisQuest.quest_id = dsp.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON
thisQuest.string_key = dsp.quest.string.adoulin[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.varPrefix = "[Q]["..thisQuest.log_id.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.varPrefix,
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
            ['mission_log'] = ADOULIN,
            ['mission_id'] = LIFE_ON_THE_FRONTIER
        }
        -- [1] = { ['quest'] = require("scripts/globals/missions/adoulin/life_on_the_frontier"), ['stage'] = x }
    },
    fame =
    {
        ['area'] = dsp.quest.fame.ADOULIN,
        ['level'] = 1
    }
    -- trade = { {item, qty} },
    -- key_items = {...},
    -- etc..
}

thisQuest.rewards =
{
    sets =
    {
        [1] =
        {
            exp = 500,
            bayld = 300,
            fame_area = dsp.quest.fame.ADOULIN
        }
    }
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
                        player:startEvent(2540) -- Starting quest, his harpoon is broken
                        return true
                    end
                end
            },
            ['onEventFinish'] =
            {
                [2540] = function(player, option)
                    -- Jorin, starting quest
                    if npcUtil.giveKeyItem(player, dsp.ki.BROKEN_HARPOON) then
                        thisQuest.start(player)
                        return true
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
                    player:startEvent(2541) -- Begs player to hurry up
                    return true
                end,
                ['Shipilolo'] = function(player, npc)
                    player:startEvent(2543) -- Upgrading Broken Harpoon to Extravagant Harpoon
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2543] = function(player, option)
                    -- Shipilolo, fixes Broken Harpoon and advances quest
                    if npcUtil.giveKeyItem(player, dsp.ki.EXTRAVAGANT_HARPOON) then
                        player:delKeyItem(dsp.ki.BROKEN_HARPOON)
                        thisQuest.advanceStage(player)
                        return true
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
                    player:startEvent(2542) -- Giving Jorin the Extravagant Harpoon
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2542] = function(player, option)
                    -- Jorin, finishing quest
                    if thisQuest.complete(player, thisQuest) then
                        player:delKeyItem(dsp.ki.EXTRAVAGANT_HARPOON)
                        return true
                    end
                end
            }
        }
    }
}

return thisQuest