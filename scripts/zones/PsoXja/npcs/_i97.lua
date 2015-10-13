-----------------------------------
-- Area: Pso'Xja
-- NPC:  Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 
	local posZ=player:getZPos();
	if (player:hasKeyItem(PSOXJA_PASS)==true and posZ >= 25) then
		player:startEvent(0x000E);
	elseif (posZ < 25) then
		player:startEvent(0x0011);
	else
		player:messageSpecial(DOOR_LOCKED);
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
end;