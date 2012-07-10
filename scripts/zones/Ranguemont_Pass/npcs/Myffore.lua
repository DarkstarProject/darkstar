-----------------------------------
--  Area: Ranguemont Pass
--   NPC: Myffore
--  Type: NPC
-- @zone: 166
--  @pos: -179.951 4 -172.234
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
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
	player:startEvent(0x0001);
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
	printf("CSID: %u",csid);
	printf("RESULT: %u",option);
	if(csid == 0x0001 and option == 0) then
		GetNPCByID(17457333):openDoor()
	end
end;

