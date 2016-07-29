-----------------------------------
-- Area:  Silver_Sea_route_to_Nashmau
-- NPC:   Qudamahf
-- Notes: Tells ship ETA time
-- @pos 0.340 -12.232 -4.120 58
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(ON_WAY_TO_NASHMAU,0,0); -- Earth Time, Vana Hours. Needs a get-time function for boat?
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



