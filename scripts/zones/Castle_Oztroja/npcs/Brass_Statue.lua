-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Brass Statue
-- Type: Passageway Machine
-- @pos -60.061 -4.348 -61.538 151	(1)
-- @pos -18.599 -19.307 20.024 151	(2)
-- @pos -60 22 -100	151 			(3)
-- @pos -100 -72 -19 151			(4)
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local Z = npc:getZPos();
	
	if (Z < -15 and Z > -19) then
				
		local DoorID = npc:getID() - 1;		
		local DoorA = GetNPCByID(DoorID):getAnimation();		
		
		if (DoorA == 9) then
			GetNPCByID(DoorID):openDoor(6);
		end 
	end	
end;

	--player:startEvent(0x000d); -- Password event

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

