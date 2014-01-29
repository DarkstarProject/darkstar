-----------------------------------
-- Area:  Ship_bound_for_Mhaura
-- NPC:   Sahn
-- Notes: Tells ship ETA time
-- @pos 0.278 -14.707 -1.411 221
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Ship_bound_for_Mhaura/TextIDs");

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



