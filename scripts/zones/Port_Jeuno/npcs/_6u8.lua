-----------------------------------
-- Area: Port Jeuno
-- NPC:  Door: Departures Exit (for Kahzam)
-- @zone 246
-- @pos -12 8 54
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	KazhPass = player:hasKeyItem(AIRSHIP_PASS_FOR_KAZHAM);
	Gil = player:getGil();
	
	if (KazhPass == false) then 
		player:startEvent(0x0023); -- without pass
	elseif (KazhPass == true and Gil < 200) then
		player:startEvent(0x002d); -- Pass without money
	elseif (KazhPass == true) then
		player:startEvent(0x0025); -- Pass with money
	end
	
	return 1;
	
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
	
	if (csid == 0x0025) then 
		Z = player:getZPos();
		
		if (Z >= 58 and Z <= 61) then
			player:delGil(200);
		end
	end
	
end;