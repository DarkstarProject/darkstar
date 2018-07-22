-----------------------------------
-- Area: Upper Jeuno
-- !pos: -90 0 169 244
----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local FellowLook = player:getFellowValue("look")
    local FellowName = player:getFellowValue("fellowNameId")

    local FellowQuest = player:getVar("[Quest]Unlisted_Qualities")
    if player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest < 7 then
        player:startEvent(10037)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest == 7 then
        player:startEvent(10171,0,0,0,0,0,0,0,FellowLook + FellowName)
    else
        player:startEvent(157)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10171 then
        player:setMaskBit(player:getVar("[Quest]Unlisted_Qualities"),"[Quest]Unlisted_Qualities",3,true)
    end
end