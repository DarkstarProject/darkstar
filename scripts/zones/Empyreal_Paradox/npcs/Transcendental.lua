-----------------------------------
-- Area: Empyreal_Paradox
-- NPC:  Transcendental
-----------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");

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
    --player:addMission(COP, DAWN);
    --player:setVar("PromathiaStatus",3);
   if (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")==1) then
      player:startEvent(0x0002);            
    elseif (EventTriggerBCNM(player,npc)) then
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
    
    EventUpdateBCNM(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    if ( csid == 0x0002) then
     player:setVar("PromathiaStatus",2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

    end;