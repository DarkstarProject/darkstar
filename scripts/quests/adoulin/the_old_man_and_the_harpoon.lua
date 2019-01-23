require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

-- Stage 0: Talk to Jorin, Western Adoulin, to get Broken Harpoon KI and start quest
-- Stage 1: Talk to Shipilolo, Western Adoulin, to exchange Broken Harpoon KI for Extravagant Harpoon KI
-- Stage 2: Talk to Jorin, quest complete

local this_quest = {}

this_quest.name = "The Old Man and the Harpoon"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quests.enums.log_ids.ADOULIN
this_quest.quest_id = dsp.quests.enums.quest_ids.adoulin.THE_OLD_MAN_AND_THE_HARPOON

this_quest.repeatable = false
this_quest.vars =
{
    stage = "[Q]".."["..this_quest.log_id.."]".."["..this_quest.quest_id.."]",
    preserve_main_on_complete = false, -- do we keep main var on quest completion
    additional =
    {
        --["name"] = { id = 1, type = dsp.quests.enums.var_types.LOCAL_VAR, repeatable = false, preserve_on_complete = false },
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

this_quest.npcs =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        ["Jorin"] =
        {
            onTrade = function(player, npc, trade)
            end,
            onTrigger = function(player, npc)
                local questStatus = player:getQuestStatus(ADOULIN, THE_OLD_MAN_AND_THE_HARPOON)
                if dsp.quests.getStage(player, this_quest) >= 1 then
                    if dsp.quests.getStage(player, this_quest) == 2 then
                        player:startEvent(2542) -- Finishing Quest: 'The Old Man and the Harpoon'
                        return true
                    else
                        player:startEvent(2541) -- Dialogue during Quest: 'The Old Man and the Harpoon'
                        return true
                    end
                elseif dsp.quests.checkRequirements(player, this_quest) then
                    player:startEvent(2540) -- Starts Quest: 'The Old Man and the Harpoon'
                    return true
                end
            end
        },
        ["Shipilolo"] =
        {
            onTrade = function(player, npc, trade)
            end,
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 1 then
                    player:startEvent(2543) -- Progresses Quest: 'The Old Man and the Harpoon'
                    return true
                end
            end
        }
    }
}

this_quest.events =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        [2540] =
        {
            onEventUpdate = function(player, csid, option)
            end,
            onEventFinish = function(player, option)
                -- Jorin, starting Quest: 'The Old Man and the Harpoon'
                if npcUtil.giveKeyItem(player, dsp.ki.BROKEN_HARPOON) then
                    player:addQuest(this_quest.log_id, this_quest.quest_id)
                    dsp.quests.setStage(player, this_quest, 1)
                    return true
                end
            end
        },
        [2542] =
        {
            onEventUpdate = function(player, csid, option)
            end,
            onEventFinish = function(player, option)
                -- Jorin, finishing Quest: 'The Old Man and the Harpoon'
                if dsp.quests.complete(player, this_quest) then
                    player:delKeyItem(dsp.ki.EXTRAVAGANT_HARPOON)
                    return true
                end
            end
        },
        [2543] =
        {
            onEventUpdate = function(player, csid, option)
            end,
            onEventFinish = function(player, option)
                -- Shipilolo, progresses Quest: 'The Old Man and the Harpoon'
                if npcUtil.giveKeyItem(player, dsp.ki.EXTRAVAGANT_HARPOON) then
                    player:delKeyItem(dsp.ki.BROKEN_HARPOON)
                    dsp.quests.setStage(player, this_quest, 2)
                    return true
                end
            end
        }
    }
}

return this_quest