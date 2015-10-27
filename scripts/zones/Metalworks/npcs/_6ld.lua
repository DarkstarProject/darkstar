-----------------------------------
-- Area: Metalworks
-- Door: _6ld (President's Office)
-- @pos 92 -19 0.1 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(BASTOK) == XARCABARD_LAND_OF_TRUTHS and player:hasKeyItem(SHADOW_FRAGMENT)) then
		player:startEvent(0x025b);
	else
		player:startEvent(0x025c);
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
	
	if (csid == 0x025b) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;