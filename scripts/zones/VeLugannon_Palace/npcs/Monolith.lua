-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Monolith
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/VeLugannon_Palace/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/VeLugannon_Palace/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local npcID = npc:getID();
	local Door_Offset = 17502608; -- _4x0
	
	if (npcID == Door_Offset+34 or npcID == Door_Offset+32 or npcID == Door_Offset+30 or npcID == Door_Offset+28 or npcID == Door_Offset+26) then
		GetNPCByID(Door_Offset+14):setAnimation(8);--blue door
		GetNPCByID(Door_Offset+13):setAnimation(8);
		GetNPCByID(Door_Offset+12):setAnimation(8);
		GetNPCByID(Door_Offset+11):setAnimation(8);
		GetNPCByID(Door_Offset+10):setAnimation(8);
		GetNPCByID(Door_Offset+9):setAnimation(8);
		GetNPCByID(Door_Offset+8):setAnimation(8);
		GetNPCByID(Door_Offset):setAnimation(9);--yellow door
		GetNPCByID(Door_Offset+1):setAnimation(9);
		GetNPCByID(Door_Offset+2):setAnimation(9);
		GetNPCByID(Door_Offset+3):setAnimation(9);
		GetNPCByID(Door_Offset+4):setAnimation(9);
		GetNPCByID(Door_Offset+5):setAnimation(9);
		GetNPCByID(Door_Offset+6):setAnimation(9);
		GetNPCByID(Door_Offset+7):setAnimation(9);
		GetNPCByID(Door_Offset+33):setAnimation(8);--blue monolith
		GetNPCByID(Door_Offset+31):setAnimation(8);
		GetNPCByID(Door_Offset+29):setAnimation(8);
		GetNPCByID(Door_Offset+27):setAnimation(8);
		GetNPCByID(Door_Offset+25):setAnimation(8);
		GetNPCByID(Door_Offset+23):setAnimation(9);--yellow monolith
		GetNPCByID(Door_Offset+21):setAnimation(9);
		GetNPCByID(Door_Offset+19):setAnimation(9);
		GetNPCByID(Door_Offset+17):setAnimation(9);
		GetNPCByID(Door_Offset+15):setAnimation(9);
	else
		GetNPCByID(Door_Offset+14):setAnimation(9);--blue door
		GetNPCByID(Door_Offset+13):setAnimation(9);
		GetNPCByID(Door_Offset+12):setAnimation(9);
		GetNPCByID(Door_Offset+11):setAnimation(9);
		GetNPCByID(Door_Offset+10):setAnimation(9);
		GetNPCByID(Door_Offset+9):setAnimation(9);
		GetNPCByID(Door_Offset+8):setAnimation(9);
		GetNPCByID(Door_Offset):setAnimation(8);--yellow door
		GetNPCByID(Door_Offset+1):setAnimation(8);
		GetNPCByID(Door_Offset+2):setAnimation(8);
		GetNPCByID(Door_Offset+3):setAnimation(8);
		GetNPCByID(Door_Offset+4):setAnimation(8);
		GetNPCByID(Door_Offset+5):setAnimation(8);
		GetNPCByID(Door_Offset+6):setAnimation(8);
		GetNPCByID(Door_Offset+7):setAnimation(8);
		GetNPCByID(Door_Offset+33):setAnimation(9);--blue monolith
		GetNPCByID(Door_Offset+31):setAnimation(9);
		GetNPCByID(Door_Offset+29):setAnimation(9);
		GetNPCByID(Door_Offset+27):setAnimation(9);
		GetNPCByID(Door_Offset+25):setAnimation(9);
		GetNPCByID(Door_Offset+23):setAnimation(8);--yellow monolith
		GetNPCByID(Door_Offset+21):setAnimation(8);
		GetNPCByID(Door_Offset+19):setAnimation(8);
		GetNPCByID(Door_Offset+17):setAnimation(8);
		GetNPCByID(Door_Offset+15):setAnimation(8);
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