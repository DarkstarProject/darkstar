-----------------------------------
-- Area: Garlaige Citadel
-- NPC:  Banishing Gate #1
-- @pos -201.000 -2.994 220 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(POUCH_OF_WEIGHTED_STONES) == false or player:getXPos() > -201) then
		player:messageSpecial(A_GATE_OF_STURDY_STEEL);
		return 1;
	else
		local DoorID = npc:getID();
		
		for i = DoorID,DoorID+4,1 do
			GetNPCByID(i):openDoor(30);
		end
		player:messageSpecial(BANISHING_GATES); -- First Banishing gate opening
		return 1;
	end
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