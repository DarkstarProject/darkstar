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
	
	if(CurrentMission == THE_DAVOI_REPORT and player:getVar("theDavoiReportMissionCS") == 2) then
		player:setVar("theDavoiReportMissionCS",3);
		player:addKeyItem(LOST_DOCUMENT);
		player:messageSpecial(KEYITEM_OBTAINED,LOST_DOCUMENT);
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