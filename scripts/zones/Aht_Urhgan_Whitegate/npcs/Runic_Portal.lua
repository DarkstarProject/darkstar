-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
package.loaded["scripts/globals/besieged"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	hasAssault = hasAssaultOrders(player);
	if(hasAssault > 0) then
		player:startEvent(hasAssault);
	else
		if(player:hasKeyItem(RUNIC_PORTAL_USE_PERMIT)) then
			player:messageSpecial(RUNIC_PORTAL + 2,RUNIC_PORTAL_USE_PERMIT);
			player:startEvent(0x0065,0,player:getNationTeleport(AHTURHGAN));
		else
			player:messageSpecial(RUNIC_PORTAL);
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
	
	if(csid == 0x0065) then
		if(option == 101) then
			AzouphIsleStagingPoint(player)
		elseif(option == 102) then
			DvuccaIsleStagingPoint(player);
		elseif(option == 103) then
			MamoolJaStagingPoint(player);
		elseif(option == 104) then
			HalvungStagingPoint(player);
		elseif(option == 105) then
			IlrusiAtollStagingPoint(player);
		elseif(option == 106) then
			NzyulIsleStagingPoint(player);
		end
	end
	
end;