-----------------------------------
-- Area: Inner Horutoto Ruins
-- NPC:  Gate: Magical Gizmo
-- Involved In Mission: Full Moon Fountain
-- @pos -291 0 -659 194
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

	local CurrentMission = player:getCurrentMission(WINDURST);
	local MissionStatus = player:getVar("MissionStatus");
	
	if (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 1 and player:hasKeyItem(SOUTHWESTERN_STAR_CHARM)) then
		SpawnMob(17572197) -- Jack of Cups
		SpawnMob(17572198) -- Jack of Batons
		SpawnMob(17572199) -- Jack of Swords
		SpawnMob(17572200) -- Jack of Coins
		
	elseif (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 2) then
		player:startEvent(0x0044)
	else
		player:messageSpecial(DOOR_FIRMLY_SHUT);
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

	if (csid == 0x0044) then
		player:setVar("MissionStatus",3);
		player:delKeyItem(SOUTHWESTERN_STAR_CHARM);
	end
	
end;