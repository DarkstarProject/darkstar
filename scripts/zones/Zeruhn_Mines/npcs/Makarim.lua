-----------------------------------
-- Area: Zeruhn Mines
-- NPC:  Makarim
-- Involved In Mission: The Zeruhn Report
-- @pos -58 8 -333 172
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local currentMission = player:getCurrentMission(pNation);
	local MissionStatus = player:getVar("MissionStatus");
	
	if(currentMission(BASTOK) == THE_ZERUHN_REPORT and MissionStatus == 0) then
		player:startEvent(0x0079);
	elseif(currentMission(BASTOK) == THE_ZERUHN_REPORT and MissionStatus == 1) then
			player:messageSpecial(MAKARIM_DIALOG_I);
	else
		player:startEvent(0x0068);
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

	if(csid == 0x0079) then
		player:addKeyItem(ZERUHN_REPORT);
		player:messageSpecial(KEYITEM_OBTAINED,ZERUHN_REPORT);
		player:setVar("MissionStatus",1);
	end
	
end;