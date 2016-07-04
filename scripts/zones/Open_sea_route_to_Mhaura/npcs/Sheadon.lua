-----------------------------------
-- Area:  Open_sea_route_to_Mhaura
-- NPC:   Sheadon
-- Notes: Tells ship ETA time
-- @pos 0.340 -12.232 -4.120 47
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Open_sea_route_to_Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(ON_WAY_TO_MHAURA,0,0); -- Earth Time, Vana Hours. Needs a get-time function for boat?
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



