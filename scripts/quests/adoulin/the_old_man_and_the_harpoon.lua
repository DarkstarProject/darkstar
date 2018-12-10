require("scripts/globals/missions");
require("scripts/globals/quests")
require("scripts/globals/zone")

local this_quest = {}

this_quest.name = "The Old Man and the Harpoon"
this_quest.area = ADOULIN
this_quest.logid = dsp.quests.enums.log_ids.ADOULIN
this_quest.questid = dsp.quests.enums.quest_ids.adoulin.THE_OLD_MAN_AND_THE_HARPOON

this_quest.messageIDs =
{
    [dsp.zone.WESTERN_ADOULIN] = require("scripts/zones/Western_Adoulin/IDs")
}

this_quest.repeatable = false
this_quest.vars =
{
    main = "[Q]".."["..this_quest.logid.."]".."["..this_quest.questid.."]",
    preserve_main_on_complete = false, -- do we keep main var on quest completion
    additional =
    {
        --["name"] = { id = 1, type = dsp.quests.enums.var_types.LOCAL_VAR, repeatable = false, preserve_on_complete = false },
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

this_quest.npcs =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        ["Jorin"] =
        {
            onTrade = function(player, npc, trade)
            end,
            onTrigger = function(player, npc)
                local SOA_Mission = player:getCurrentMission(SOA)
                local questStatus = player:getQuestStatus(this_quest.logid, this_quest.questid)
                if questStatus == QUEST_ACCEPTED then
                    if player:hasKeyItem(dsp.ki.EXTRAVAGANT_HARPOON) then
                        player:startEvent(2542) -- Finishing Quest: 'The Old Man and the Harpoon'
                    else
                        player:startEvent(2541) -- Dialogue during Quest: 'The Old Man and the Harpoon'
                    end
                elseif (SOA_Mission >= LIFE_ON_THE_FRONTIER) and (questStatus == QUEST_AVAILABLE) then
                    player:startEvent(2540) -- Starts Quest: 'The Old Man and the Harpoon'
                end
            end
        },
        ["Shipilolo"] =
        {
            onTrade = function(player, npc, trade)
            end,
            onTrigger = function(player, npc)
                if player:hasKeyItem(dsp.ki.BROKEN_HARPOON) then
                    player:startEvent(2543) -- Progresses Quest: 'The Old Man and the Harpoon'
                end
            end
        }
    }
}

this_quest.events = {
    [dsp.zone.WESTERN_ADOULIN] =
    {
        [2540] =
        {
            onEventUpdate = function(player, csid, option)
            end,
            onEventFinish = function(player, option)
                -- Jorin, starting Quest: 'The Old Man and the Harpoon'
                if npcUtil.giveKeyItem(player, dsp.ki.BROKEN_HARPOON) then
                    player:addQuest(this_quest.logid, this_quest.questid)
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
                end
            end
        }
    }
}

return this_quest