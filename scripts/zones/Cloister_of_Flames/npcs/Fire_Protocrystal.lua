-----------------------------------
-- Area: Cloister of Flames
-- NPC:  Fire Protocrystal
-- Involved in Quests: Trial by Fire, Trial Size Trial by Fire
-- @pos -721 0 -598 207
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Flames/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Cloister_of_Flames/TextIDs");

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
    
    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Scarlet") == 1) then
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
        player:delKeyItem(DOMINAS_SCARLET_SEAL);
        player:addKeyItem(SCARLET_COUNTERSEAL);
        player:messageSpecial(KEYITEM_OBTAINED,SCARLET_COUNTERSEAL);
        player:setVar("ASA4_Scarlet","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;