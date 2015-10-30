-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
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
	
	local hasAssault, keyitem = hasAssaultOrders(player);
	
	if (hasAssault > 0) then
        player:messageSpecial(RUNIC_PORTAL + 9, keyitem);
		player:startEvent(hasAssault);
	else
		if (player:hasKeyItem(RUNIC_PORTAL_USE_PERMIT)) then
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
	
	if (csid == 0x0065) then
		if (option == 101) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);
			AzouphIsleStagingPoint(player)
		elseif (option == 102) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);		
			DvuccaIsleStagingPoint(player);
		elseif (option == 103) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);		
			MamoolJaStagingPoint(player);		
		elseif (option == 104) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);		
			HalvungStagingPoint(player);		
		elseif (option == 105) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);		
			IlrusiAtollStagingPoint(player);		
		elseif (option == 106) then
			player:delKeyItem(RUNIC_PORTAL_USE_PERMIT);		
			NzyulIsleStagingPoint(player);	
		end		
	elseif (csid == 0x0078 and option == 1 ) then--LEUJAOAM_ASSAULT_ORDERS
	   AzouphIsleStagingPoint(player)
	elseif (csid == 0x0079 and option == 1 ) then--MAMMOOL_JA_ASSAULT_ORDERS
	   MamoolJaStagingPoint(player);
	elseif (csid == 0x007A and option == 1 ) then--LEBROS_ASSAULT_ORDERS
	   HalvungStagingPoint(player);
	elseif (csid == 0x007B and option == 1 ) then--PERIQIA_ASSAULT_ORDERS
       DvuccaIsleStagingPoint(player);
    elseif (csid == 0x007C and option == 1 ) then--ILRUSI_ASSAULT_ORDERS
	   IlrusiAtollStagingPoint(player);
    elseif (csid == 0x007D and option == 1 ) then--NYZUL_ISLE_ASSAULT_ORDERS	
	   NzyulIsleStagingPoint(player);
	end	
end;