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
require("scripts/globals/conquest");
require("scripts/globals/conquestguards");
require("scripts/zones/Northern_San_dOria/TextIDs");

NPCNation = 0;		-- NPCs Nationality (0 = Sand, 1 = Bast, 2 = Wind)
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
	
	LvL = player:getMainLvl();
	MyGils = player:getGil();
	MyCP = 0;
	
	if(player:getNation() ~= NPCNation) then AllowTP = 1; else AllowTP = 0; end
	
	basenumber = 2145386527;
	startnumber = 32;
	
	for nb = 1,128,8 do
		if(player:getVar(SupplyRun[nb + 5]) == 0 or LvL < SupplyRun[nb + 6]) then
			basenumber = basenumber + startnumber;
		end
		startnumber = startnumber * 2;
	end
	
	player:startEvent(0x02cc,MyGils,RequiredGils,0,RequiredCP,MyCP,AllowTP,LvL,basenumber);
	
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
		
		toOutpost(player,option);
		player:delGil(RequiredGils);
		
	end
	
end;

