-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Vestal Chamber (chamber of the Star Sibyl)
-- @pos 0 -49 37 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(WINDURST) == A_NEW_JOURNEY and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x0099);
	else
		player:startEvent(0x009A);
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
	
	if(csid == 0x0099) then
		player:setVar("MissionStatus",1);
		player:delKeyItem(STAR_CRESTED_SUMMONS);
		player:addKeyItem(LETTER_TO_THE_AMBASSADOR);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_AMBASSADOR);
	end
	
end;