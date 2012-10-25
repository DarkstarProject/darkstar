-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Runic Portal
-- Caedarva Mire Teleporter Back to Aht Urgan Whitegate
-- @pos 524 -28 -503 79 (Azouph)
-- @pos -264 -6 -28 79 (Dvucca)
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/zones/Caedarva_Mire/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(npc:getID() == 17101261) then -- Azouph
		if(hasRunicPortal(player,1) == 1) then
			player:startEvent(0x0083);
		else
			player:startEvent(0x007c);
		end
	else -- Dvucca
		if(hasRunicPortal(player,2) == 1) then
			player:startEvent(0x0086);
		else
			player:startEvent(0x007d);
		end
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
	
	if(option == 1) then
		if(csid == 0x007c) then
			player:addNationTeleport(AHTURHGAN,2);
		elseif(csid == 0x007d) then
			player:addNationTeleport(AHTURHGAN,4);
		end
		toChamberOfPassage(player);
	end
	
end;