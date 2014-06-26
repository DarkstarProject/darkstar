-----------------------------------
-- Area: Outer Ra'Kaznar
-- NPC: Liseran Door Exit
-- Zones out to Kamihr Drifts (zone 267)
-- @zone 274
-- @pos -34.549 -181.334 -20.031
-----------------------------------
package.loaded["scripts/zones/Outer_Ra_Kaznar/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Outer_Ra_Kaznar/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--Temporary! Need cs ID.
	player:setPos(-280,20,60,0,267);
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
end;