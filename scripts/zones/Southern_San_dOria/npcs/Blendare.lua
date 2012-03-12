-----------------------------------
--  Area: Southern San d'Oria
--   NPC: Blendare
--  Type: Standard NPC
--  @zone: 230
--  @pos: 33.033 0.999 -30.119
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x025e)  -- my brother always takes my sweets
--	player:startEvent(0x0256)   --did nothing no speech or text
--	player:startEvent(0x03b1)	--black screen and hang
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
	if (csid == 0x025e) then
		player:setVar("BrothersCS", 1)
	end
end;

