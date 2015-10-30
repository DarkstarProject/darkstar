-----------------------------------
-- Area: Kazham
-- NPC:  Jakoh Wahcondalo
-- @pos 101 -16 -115 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(ZILART) == KAZAMS_CHIEFTAINESS) then
		player:startEvent(0x0072);
	elseif (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
		player:startEvent(0x0073);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x0109);
	else
		player:startEvent(0x0071);
	end
	
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
	
	if (csid == 0x0072) then
		player:addKeyItem(SACRIFICIAL_CHAMBER_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,SACRIFICIAL_CHAMBER_KEY);
		player:completeMission(ZILART,KAZAMS_CHIEFTAINESS);
		player:addMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
	elseif (csid == 0x0109) then
		player:setVar("MissionStatus",3);
	end
	
end;
