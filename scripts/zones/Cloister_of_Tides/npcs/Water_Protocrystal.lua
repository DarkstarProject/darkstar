-----------------------------------
-- Area: Cloister of Tides
-- NPC:  Water Protocrystal
-- Involved in Quests: Trial by Water, Trial Size Trial by Water
-- !pos 560 36 560 211
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Tides/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Cloister_of_Tides/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Cerulean") == 1) then
        player:startEvent(2);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    else
        player:messageSpecial(PROTOCRYSTAL);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);

    if (csid==2) then
        player:delKeyItem(dsp.ki.DOMINAS_CERULEAN_SEAL);
        player:addKeyItem(dsp.ki.CERULEAN_COUNTERSEAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CERULEAN_COUNTERSEAL);
        player:setVar("ASA4_Cerulean","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;