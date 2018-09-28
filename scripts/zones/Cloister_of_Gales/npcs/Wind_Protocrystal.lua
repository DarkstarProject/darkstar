-----------------------------------
-- Area: Cloister of Gales
-- NPC:  Wind Protocrystal
-- Involved in Quests: Trial by Wind, Trial Size Trial By Wind
-- !pos -361 1 -381 201
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Gales/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cloister_of_Gales/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
-------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end

function onTrigger(player,npc)
    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Emerald") == 1) then
        player:startEvent(2)
    elseif (EventTriggerBCNM(player,npc)) then
        return
    else
        player:messageSpecial(PROTOCRYSTAL)
    end
end

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras)
end

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid)
    -- printf("onFinish RESULT: %u",option)

    if (csid==2) then
        player:delKeyItem(dsp.ki.DOMINAS_EMERALD_SEAL)
        player:addKeyItem(dsp.ki.EMERALD_COUNTERSEAL)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.EMERALD_COUNTERSEAL)
        player:setVar("ASA4_Emerald","2")
    elseif (EventFinishBCNM(player,csid,option)) then
        return
    end

end