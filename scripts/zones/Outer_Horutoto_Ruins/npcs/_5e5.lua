-----------------------------------
-- Area: Outer Horutoto Ruins
-- NPC:  Cracked Wall
-- Involved In Mission: The Jester Who'd Be King
-- @pos -424.255 -1.909 619.995
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 4 and GetMobAction(17572201) == 0 and GetMobAction(17572202) == 0) then
		SpawnMob(17572201):updateEnmity(player);
		SpawnMob(17572202):updateEnmity(player);
	elseif (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x0047);
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
	if (csid == 0x0047) then
		player:addKeyItem(ORASTERY_RING);
		player:messageSpecial(KEYITEM_OBTAINED,ORASTERY_RING);
		player:setVar("MissionStatus",6)
	end
end;