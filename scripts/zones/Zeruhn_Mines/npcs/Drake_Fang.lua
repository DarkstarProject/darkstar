-----------------------------------
-- Area: Zeruhn Mines
-- NPC:  Drake Fang
-- Involved in Mission: Bastok 6-1, 8-2
-- @pos -74 0.1 58 172
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Zeruhn_Mines/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local currentMission = player:getCurrentMission(BASTOK);
	local MissionStatus = player:getVar("MissionStatus");
	
	-- Enter the Talekeeper 8-2	
	if (currentMission == ENTER_THE_TALEKEEPER and MissionStatus == 4 ) then
		player:startEvent(0x00cc);
	elseif (currentMission == ENTER_THE_TALEKEEPER and MissionStatus > 1 and MissionStatus < 4 ) then
		player:startEvent(0x00cb);
	elseif (currentMission == ENTER_THE_TALEKEEPER and MissionStatus == 0) then
		player:startEvent(0x00ca);	
	-- Return of the Talekeeper 6-1
	elseif (currentMission == RETURN_OF_THE_TALEKEEPER and MissionStatus > 1) then
		player:startEvent(0x00c9);
	elseif (currentMission == RETURN_OF_THE_TALEKEEPER and MissionStatus == 1) then
		player:startEvent(0x00c8);			
	else
		player:startEvent(0x006c);
	end
end;
-- 0x006c  0x00c8  0x00c9  0x00ca  0x00cb  0x00cc

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
	
	if (csid == 0x00c8) then
		player:setVar("MissionStatus",2);
	elseif (csid == 0x00ca) then
		player:setVar("Missionstatus",1);
	elseif (csid == 0x00cc) then
		player:setVar("Missionstatus",5);
		player:delKeyItem(OLD_PIECE_OF_WOOD);
	end
end;