-----------------------------------
-- Area: Ru'Lude Gardens
-- !pos: 7 0 -67 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local FellowQuest = player:getVar("[Quest]Unlisted_Qualities")
    local FellowName = player:getFellowNameId()
    if player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and player:getMaskBit(FellowQuest,0) == false then
        player:startEvent(10103,0,0,0,0,0,0,0,FellowName)
    else
        player:startEvent(116)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10103 then
        player:setMaskBit(player:getVar("[Quest]Unlisted_Qualities"),"[Quest]Unlisted_Qualities",0,true)
        player:setFellowSize(option)
    end
--[[
Adventuring Fellow Size Options:
    3   Pretty tall
    2   Around average
    1   On the small side
--]]
end