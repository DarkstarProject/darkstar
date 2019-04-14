-----------------------------------
-- Area: Sealion's Den
--  NPC: Iron Gate
-- !pos 612 132 774 32
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/missions")
require("scripts/globals/titles")
require("scripts/globals/bcnm")
-----------------------------------

function onTrade(player, npc, trade)
    if TradeBCNM(player, player:getZoneID(), trade, npc) then
        return
    end
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) == SLANDEROUS_UTTERINGS and player:getVar("PromathiaStatus") == 1 then
        player:startEvent(13)
    elseif EventTriggerBCNM(player, npc) then
        return
    end
end

function onEventUpdate(player, csid, option)
    EventUpdateBCNM(player, csid, option)
end

function onEventFinish(player, csid, option)
    if EventFinishBCNM(player, csid, option) then
        return
    end

    if csid == 13 then
        player:setVar("PromathiaStatus", 0)
        player:completeMission(COP, SLANDEROUS_UTTERINGS)
        player:addMission(COP, THE_ENDURING_TUMULT_OF_WAR)
        player:addTitle(dsp.title.THE_LOST_ONE)
    end
end
