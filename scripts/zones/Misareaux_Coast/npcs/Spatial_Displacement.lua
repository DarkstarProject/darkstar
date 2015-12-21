-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Spacial Displacement
--  Entrance to Riverne Site #A01 and #B01
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasCompletedMission(COP,SHELTERING_DOUBT)) then      
        player:startEvent(0x0227); -- Access to Sites A & B
    elseif (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(0x0008); 
    else
        player:startEvent(0x0226); -- Access to Site A Only
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x0008) then
        player:setVar("PromathiaStatus",2);
        player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
    elseif ((csid == 0x0227 or csid == 0x0226) and option == 1) then
        player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
    elseif (csid == 0x0227 and option == 2) then
        player:setPos(729.749,-20.319,407.153,90,29); -- Go to Riverne #B01 {R}
    end;
    
end;