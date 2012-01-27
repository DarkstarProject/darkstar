-----------------------------------
-- Area: Yhoator Jungle
-- NPC:  Mugha Dovajaiho
-- @zone 124
-- @pos 202 0 -82
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Yhoator_Jungle/TextIDs");

NationNPC = getRegionOwner(ELSHIMOUPLANDS);
Region = "ELUP_TELE";
RequiredLvL = 35;
RequiredCP = 350;
RequiredGils = 350;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	MyGils = player:getGil();
	MyCP = 0;
	
	if(player:getNation() == NationNPC) then 
		MenuType = 1;
	else 
		MenuType = 0; RequiredGils = RequiredGils * 3; 
	end
	
	if(player:getVar(Region) == 0 or player:getMainLvl() < RequiredLvL or MyGils < RequiredGils) then 
		RequiredGils = 0; 
	end
	
	player:startEvent(0x7ff4,MenuType,RequiredGils,0,RequiredCP,0,0,0,0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
	
	if(option == 1) then
		ShowOPVendorShop(player);
	elseif(option == 2) then
		Nation = player:getNation();
		
		if(Nation ~= NationNPC) then RequiredGils = RequiredGils * 3; end
		
		toHomeNation(player);
		player:delGil(RequiredGils);
		
	end
	
end;