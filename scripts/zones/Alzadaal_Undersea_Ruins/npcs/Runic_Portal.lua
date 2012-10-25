-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- NPC:  Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- @pos 15 -7 627 54
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasRunicPortal(player,6) == 1) then
		if(npc:getID() == 17072225) then
			player:startEvent(0x0075);
		else
			player:startEvent(0x0076);
		end
	else
		if(npc:getID() == 17072225) then
			player:startEvent(0x0079);
		else
			player:startEvent(0x007a);
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
		if(csid == 0x0079 or csid == 0x007a) then
			player:addNationTeleport(AHTURHGAN,64);
		end
		toChamberOfPassage(player);
	end
	
end;