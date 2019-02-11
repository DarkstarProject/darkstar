require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local this_quest = {}

this_quest.name = "The Old Man and the Harpoon"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quests.enums.log_ids.ADOULIN
this_quest.quest_id = dsp.quests.enums.quest_ids.adoulin.THE_OLD_MAN_AND_THE_HARPOON

this_quest.repeatable = false
this_quest.vars =
{
    stage = "[Q]["..this_quest.log_id.."]["..this_quest.quest_id.."]",
    preserve_main_on_complete = false, -- do we keep main var on quest completion
    additional =
    {
        --['name'] = { id = 1, type = dsp.quests.enums.var_types.LOCAL_VAR, repeatable = false, preserve_on_complete = false },
    }
}

this_quest.requirements =
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
        ['area'] = this_quest.area,
        ['level'] = 1
    }
    -- trade = { {item, qty} },
    -- keyitems = {...},
    -- etc..
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
    key_items = {dsp.ki.BROKEN_HARPOON, dsp.ki.EXTRAVAGANT_HARPOON}
}

this_quest.stages =
{
    -- Stage 0: Talk to Jorin, Western Adoulin, to get Broken Harpoon KI and start quest
    [dsp.quests.enums.stages.STAGE0] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Jorin'] = function(player, npc)
                    if dsp.quests.checkRequirements(player, this_quest) then
                        player:startEvent(2540) -- Starting quest
                        return true
                    end
                end
            },
            ['onEventFinish'] =
            {
                [2540] = function(player, option)
                    -- Jorin, starting quest
                    if npcUtil.giveKeyItem(player, dsp.ki.BROKEN_HARPOON) then
                        player:addQuest(this_quest.log_id, this_quest.quest_id)
                        dsp.quests.advanceStage(player, this_quest)
                        return true
                    end
                end
            }
        }
    },
    -- Stage 1: Talk to Shipilolo, Western Adoulin, to exchange Broken Harpoon KI for Extravagant Harpoon KI
    [dsp.quests.enums.stages.STAGE1] =
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
                    player:startEvent(2543) -- Upgrading Broken Hapoon to Extravagant Harpoon
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2543] = function(player, option)
                    -- Shipilolo, fixes Broken Harpoon and advances quest
                    if npcUtil.giveKeyItem(player, dsp.ki.EXTRAVAGANT_HARPOON) then
                        player:delKeyItem(dsp.ki.BROKEN_HARPOON)
                        dsp.quests.advanceStage(player, this_quest)
                        return true
                    end
                end
            }
        }
    },
    -- Stage 2: Talk to Jorin, quest complete
    [dsp.quests.enums.stages.STAGE2] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Jorin'] = function(player, npc)
                    player:startEvent(2542) -- Finishes quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2542] = function(player, option)
                    -- Jorin, finishing quest
                    if dsp.quests.complete(player, this_quest) then
                        player:delKeyItem(dsp.ki.EXTRAVAGANT_HARPOON)
                        return true
                    end
                end
            }
        }
    }
}

return this_quest