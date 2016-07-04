-----------------------------------
-- Area: Cloister of Frost
-- NPC:  Ice Protocrystal
-- Involved in Quests: Trial by Ice, Trial Size Trial by Ice
-- @pos 558 0 596 203
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Cloister_of_Frost/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Azure") == 1) then
        player:startEvent(0x0002);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    else
        player:messageSpecial(PROTOCRYSTAL);    
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
    
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);
    
    if (csid==0x0002) then
        player:delKeyItem(DOMINAS_AZURE_SEAL);
        player:addKeyItem(AZURE_COUNTERSEAL);
        player:messageSpecial(KEYITEM_OBTAINED,AZURE_COUNTERSEAL);
        player:setVar("ASA4_Azure","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;