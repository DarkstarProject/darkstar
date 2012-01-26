-----------------------------------
-- Area: West Ronfaure
-- NPC:  Harvetour
-- @zone 100
-- @pos -448 -19 -214
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquestguards");
require("scripts/zones/West_Ronfaure/TextIDs");

NationNPC = 0; -- 0: San d'oria, 1: Bastok, 2: Windurst
Region = "RONF_TELE";
RequiredCP = 100;
RequiredGils = 100;

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
	
	if(player:getVar(Region) == 0 or player:getMainLvl() < 10 or MyGils < RequiredGils) then 
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
	
	if(option == 2) then
		Nation = player:getNation();
		
		if(Nation ~= NationNPC) then RequiredGils = RequiredGils * 3; end
		
		for nb = 113,133,7 do
			if(OPWARP[nb] == Nation) then
				player:setPos(OPWARP[nb+3],OPWARP[nb+4],OPWARP[nb+5],OPWARP[nb+6],OPWARP[nb+2]);
				player:delGil(RequiredGils);
				break
			end
		end
	end
	
end;