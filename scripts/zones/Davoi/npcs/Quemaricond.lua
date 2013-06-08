-----------------------------------
-- Area: Davoi
-- NPC:  Quemaricond
-- Involved in Mission: Infiltrate Davoi
-- @zone 149
-- @pos 23 0 -23
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == INFILTRATE_DAVOI and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x0075);
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

	if(csid == 0x0075) then
		player:setVar("MissionStatus",4);
		player:addKeyItem(ROYAL_KNIGHTS_DAVOI_REPORT);
		player:messageSpecial(KEYITEM_OBTAINED,ROYAL_KNIGHTS_DAVOI_REPORT);
	end

end;