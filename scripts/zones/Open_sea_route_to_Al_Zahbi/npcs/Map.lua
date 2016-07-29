-----------------------------------
-- Area: Open_sea_route_to_Al_Zahbi
-- NPC:  Map
-- @pos 0.340 -12.232 -4.120 46
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0400); 
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
end;



