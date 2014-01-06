-----------------------------------
-- Area: Zeruhn Mines
-- NPC:  Drake Fang
-- Involved in Mission: Bastok 6-1
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
	
	if(player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") >= 1) then
		if(player:getVar("MissionStatus") == 1) then
			player:startEvent(0x00ca);
		else
			player:startEvent(0x00cb);
		end
		
	elseif(player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x00ca);
	elseif(player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER) then
		if(player:getVar("MissionStatus") == 4) then
			player:startEvent(0x00cc);
		end
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
	
	if(csid == 0x00c8) then
		player:setVar("MissionStatus",2);
	elseif(csid == 0x00ca) then
		player:setVar("Missionstatus",2);
	elseif(csid == 0x00cc) then
		player:setVar("Missionstatus",5);
		player:delKeyItem(OLD_PIECE_OF_WOOD);
	end
end;