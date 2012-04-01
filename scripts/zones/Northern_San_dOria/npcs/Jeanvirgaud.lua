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

NPCNation = 0;		-- NPCs Nationality (0 = Sand, 1 = Bast, 2 = Wind)
RequiredCP = 100;
RequiredGils = 100;

guardnation = SANDORIA;
csid 		= 0x02cc;

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
	control = getTeleAvailable(guardnation);
	
	if(guardnation == player:getNation()) then
		player:startEvent(csid,1,2,3,4,0,0,player:getMainLvl(),1073741823 - player:getVar("supplyQuest_SANDORIA"));
	else
		player:startEvent(csid,control,0,0,0,0,1,player:getMainLvl(),1073741823 - player:getVar("supplyQuest_SANDORIA"));
	end
	
end;
--[[	
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
	]]--
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	loca = option - 1073741824;
	player:updateEvent(player:getGil(),OP_TeleFee(player,loca),getCP(player),OP_TeleFee(player,loca));
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
	
	if(option >= 5 and option <= 23) then
		player:delGil(OP_TeleFee(player,option));
		toOutpost(player,option);
	end
	
end;