-----------------------------------
--  Area: Northern San d'Oria
--  NPC:  Papal Chambers
--  Finish Mission: The Davoi Report
--  @zone 231
--  @pos 131 -11 122
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_DAVOI_REPORT and player:hasKeyItem(TEMPLE_KNIGHTS_DAVOI_REPORT)) then
		player:startEvent(0x02b7); -- Finish Mission "The Davoi Report"
	end
	
	return 1;
	
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
	
	if(csid == 0x02b7) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;