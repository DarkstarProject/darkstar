-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Runic Portal
-- Mount Zhayolm Teleporter Back to Aht Urgan Whitegate
-- @pos 688 -23 349 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/zones/Mount_Zhayolm/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(hasRunicPortal(player,4) == 1) then
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
			player:addNationTeleport(AHTURHGAN,16);
		end
		toChamberOfPassage(player);
	end
	
end;