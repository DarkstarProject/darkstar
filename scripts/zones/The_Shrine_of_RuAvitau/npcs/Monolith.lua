-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Monolith
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");

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
	local Door_Offset = 17506718; -- _4y0
	
	if (npcID == Door_Offset+31 or npcID == Door_Offset+33 or npcID == Door_Offset+35 or npcID == Door_Offset+37 or npcID == Door_Offset+43 or 
	   npcID == Door_Offset+45 or npcID == Door_Offset+51 or npcID == Door_Offset+53 or npcID == Door_Offset+61) then
		GetNPCByID(Door_Offset+4):setAnimation(8); --blue door
		GetNPCByID(Door_Offset+5):setAnimation(8);
		GetNPCByID(Door_Offset+6):setAnimation(8);
		GetNPCByID(Door_Offset+7):setAnimation(8);
		GetNPCByID(Door_Offset+10):setAnimation(8);
		GetNPCByID(Door_Offset+11):setAnimation(8);
		GetNPCByID(Door_Offset+16):setAnimation(8);
		GetNPCByID(Door_Offset+17):setAnimation(8);
		GetNPCByID(Door_Offset+18):setAnimation(8);
		GetNPCByID(Door_Offset+20):setAnimation(8);
		GetNPCByID(Door_Offset+3):setAnimation(9); --yellow door
		GetNPCByID(Door_Offset+2):setAnimation(9);
		GetNPCByID(Door_Offset+1):setAnimation(9);
		GetNPCByID(Door_Offset):setAnimation(9);
		GetNPCByID(Door_Offset+12):setAnimation(9);
		GetNPCByID(Door_Offset+13):setAnimation(9);
		GetNPCByID(Door_Offset+14):setAnimation(9);
		GetNPCByID(Door_Offset+15):setAnimation(9);
		GetNPCByID(Door_Offset+19):setAnimation(9);
		GetNPCByID(Door_Offset+21):setAnimation(9);
		GetNPCByID(Door_Offset+30):setAnimation(8); --blue monolith
		GetNPCByID(Door_Offset+32):setAnimation(8);
		GetNPCByID(Door_Offset+34):setAnimation(8);
		GetNPCByID(Door_Offset+36):setAnimation(8);
		GetNPCByID(Door_Offset+42):setAnimation(8);
		GetNPCByID(Door_Offset+44):setAnimation(8);
		GetNPCByID(Door_Offset+50):setAnimation(8);
		GetNPCByID(Door_Offset+52):setAnimation(8);
		GetNPCByID(Door_Offset+60):setAnimation(8);
		GetNPCByID(Door_Offset+22):setAnimation(9); --yellow monolith
		GetNPCByID(Door_Offset+24):setAnimation(9);
		GetNPCByID(Door_Offset+26):setAnimation(9);
		GetNPCByID(Door_Offset+28):setAnimation(9);
		GetNPCByID(Door_Offset+46):setAnimation(9);
		GetNPCByID(Door_Offset+48):setAnimation(9);
		GetNPCByID(Door_Offset+54):setAnimation(9);
		GetNPCByID(Door_Offset+56):setAnimation(9);
		GetNPCByID(Door_Offset+58):setAnimation(9);
	else
		GetNPCByID(Door_Offset+4):setAnimation(9); -- blue door
		GetNPCByID(Door_Offset+5):setAnimation(9);
		GetNPCByID(Door_Offset+6):setAnimation(9);
		GetNPCByID(Door_Offset+7):setAnimation(9);
		GetNPCByID(Door_Offset+10):setAnimation(9);
		GetNPCByID(Door_Offset+11):setAnimation(9);
		GetNPCByID(Door_Offset+16):setAnimation(9);
		GetNPCByID(Door_Offset+17):setAnimation(9);
		GetNPCByID(Door_Offset+18):setAnimation(9);
		GetNPCByID(Door_Offset+20):setAnimation(9);
		GetNPCByID(Door_Offset+3):setAnimation(8); -- yellow door
		GetNPCByID(Door_Offset+2):setAnimation(8);
		GetNPCByID(Door_Offset+1):setAnimation(8);
		GetNPCByID(Door_Offset):setAnimation(8);
		GetNPCByID(Door_Offset+12):setAnimation(8);
		GetNPCByID(Door_Offset+13):setAnimation(8);
		GetNPCByID(Door_Offset+14):setAnimation(8);
		GetNPCByID(Door_Offset+15):setAnimation(8);
		GetNPCByID(Door_Offset+19):setAnimation(8);
		GetNPCByID(Door_Offset+21):setAnimation(8);
		GetNPCByID(Door_Offset+30):setAnimation(9); --blue monolith
		GetNPCByID(Door_Offset+32):setAnimation(9);
		GetNPCByID(Door_Offset+34):setAnimation(9);
		GetNPCByID(Door_Offset+36):setAnimation(9);
		GetNPCByID(Door_Offset+42):setAnimation(9);
		GetNPCByID(Door_Offset+44):setAnimation(9);
		GetNPCByID(Door_Offset+50):setAnimation(9);
		GetNPCByID(Door_Offset+52):setAnimation(9);
		GetNPCByID(Door_Offset+60):setAnimation(9);
		GetNPCByID(Door_Offset+22):setAnimation(8); --yellow monolith
		GetNPCByID(Door_Offset+24):setAnimation(8);
		GetNPCByID(Door_Offset+26):setAnimation(8);
		GetNPCByID(Door_Offset+28):setAnimation(8);
		GetNPCByID(Door_Offset+46):setAnimation(8);
		GetNPCByID(Door_Offset+48):setAnimation(8);
		GetNPCByID(Door_Offset+54):setAnimation(8);
		GetNPCByID(Door_Offset+56):setAnimation(8);
		GetNPCByID(Door_Offset+58):setAnimation(8);
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