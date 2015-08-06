-----------------------------------
-- Area: Kamihr Drifts
-- NPC: Liseran Door Entrance
-- Zones to Outer Ra'Kaznar (zone 274)
-- @zone 274
-- @pos -34.549 -181.334 -20.031
-----------------------------------
package.loaded["scripts/zones/Kamihr_Drifts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Kamihr_Drifts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0022);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if (csid == 0x0022 and option == 1) then
		player:setPos(-39.846,-179.334,-19.921,131,274);
	end
end;