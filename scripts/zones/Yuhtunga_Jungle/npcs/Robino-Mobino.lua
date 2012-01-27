-----------------------------------
-- Area: Yuhtunga Jungle
-- NPC:  Robino-Mobino
-- @zone 123
-- @pos -244 0 -401
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Yuhtunga_Jungle/TextIDs");

NationNPC = getRegionOwner(ELSHIMOLOWLANDS);
Region = "ELLO_TELE";
RequiredLvL = 25;
RequiredCP = 250;
RequiredGils = 250;

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