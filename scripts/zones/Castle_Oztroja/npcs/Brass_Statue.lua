-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Brass Statue
-- Type: Passageway Machine
-- @zone 151
-- @pos -60.061 -4.348 -61.538	(1)
-- @pos -60 22 -100				(2)
-- @pos -100 -72 -19			(3)
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
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
	
	Z = npc:getZPos();
	
	if(Z < -15 and Z > -19) then
		GetNPCByID(17396188):openDoor();
	end
	--player:startEvent(0x000d);
	
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

