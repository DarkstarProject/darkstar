-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Jeanvirgaud
-- Type: Outpost Teleporter NPC
-- @zone 231
-- @pos 45.559 -0.199 26.300
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquestguards");
require("scripts/zones/Northern_San_dOria/TextIDs");

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
	
	Nation = player:getNation();
	LvL = player:getMainLvl();
	MyGils = player:getGil();
	MyCP = 0;
	
	basenumber = 2145386527;
	startnumber = 32;
	
	for nb = 1,96,6 do
		if(player:getVar(SupplyRun[nb + 5]) == 0) then
			basenumber = basenumber + startnumber;
		end
		startnumber = startnumber * 2;
	end
	
	player:startEvent(0x02cc,MyGils,RequiredGils,0,RequiredCP,MyCP,Nation,LvL,basenumber);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	if(csid == 0x02cc) then
		
		for nb = 1,112,7 do
			if(OPWARP[nb] == option) then
				player:setPos(OPWARP[nb+3],OPWARP[nb+4],OPWARP[nb+5],OPWARP[nb+6],OPWARP[nb+2]);
				player:delGil(RequiredGils);
				break
			end
		end
		
	end
	
end;

