-----------------------------------
--  Area: Mhaura
--   NPC: Koh Lenbalalako
--  Type: Standard NPC
-- @zone: 249
--  @pos: -64.412 -17 29.213
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
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

	local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");		

	if (FireAndBrimstoneCS == 1) then
		player:startEvent(0x2717);
	else
		player:startEvent(0x271d);
	end
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
	if (csid == 0x2717) then
		player:startEvent(0x2730);
		player:setVar("fireAndBrimstone",2);
	end
end;

