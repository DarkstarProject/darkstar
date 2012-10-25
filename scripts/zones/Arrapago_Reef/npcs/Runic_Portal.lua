-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- @pos 15 -7 627 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasRunicPortal(player,5) == 1) then
		player:startEvent(0x006d);
	else
		player:startEvent(0x006f);
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
		if(csid == 0x006f) then
			player:addNationTeleport(AHTURHGAN,32);
		end
		toChamberOfPassage(player);
	end
	
end;