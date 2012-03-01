-----------------------------------
-- Area: Davoi
-- NPC:  !
-- Involved in Mission: The Davoi Report
-- @zone 149
-- @pos 164 0 -21
-----------------------------------

require("scripts/globals/missions");
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
	
	CurrentMission = player:getCurrentMission(SANDORIA)
	
	if(CurrentMission == THE_DAVOI_REPORT and player:getVar("MissionStatus") == 2) then
		player:setVar("MissionStatus",3);
		player:addKeyItem(LOST_DOCUMENT);
		player:messageSpecial(KEYITEM_OBTAINED,LOST_DOCUMENT);
	elseif(CurrentMission == INFILTRATE_DAVOI and player:getVar("MissionStatus") >= 6 and player:getVar("MissionStatus") <= 9) then
		X = npc:getXPos();
		Z = npc:getZPos();
		
		if(X >= 292 and X <= 296 and Z >= -30 and Z <= -26 and player:hasKeyItem(EAST_BLOCK_CODE) == false) then
			player:setVar("MissionStatus",player:getVar("MissionStatus") + 1);
			player:addKeyItem(EAST_BLOCK_CODE);
			player:messageSpecial(KEYITEM_OBTAINED,EAST_BLOCK_CODE);
		elseif(X >= 333 and X <= 337 and Z >= -138 and Z <= -134 and player:hasKeyItem(SOUTH_BLOCK_CODE) == false) then
			player:setVar("MissionStatus",player:getVar("MissionStatus") + 1);
			player:addKeyItem(SOUTH_BLOCK_CODE);
			player:messageSpecial(KEYITEM_OBTAINED,SOUTH_BLOCK_CODE);
		elseif(X >= 161 and X <= 165 and Z >= -20 and Z <= -16 and player:hasKeyItem(NORTH_BLOCK_CODE) == false) then
			player:setVar("MissionStatus",player:getVar("MissionStatus") + 1);
			player:addKeyItem(NORTH_BLOCK_CODE);
			player:messageSpecial(KEYITEM_OBTAINED,NORTH_BLOCK_CODE);
		else
			player:messageSpecial(YOU_SEE_NOTHING);
		end
	else
		player:messageSpecial(YOU_SEE_NOTHING);
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
end;