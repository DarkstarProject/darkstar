-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Vestal Chamber (chamber of the Star Sibyl)
-- @pos 0 -49 37 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
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
	
	CurrentMission = player:getCurrentMission(WINDURST);
	
	if(player:getCurrentMission(WINDURST) == A_NEW_JOURNEY and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x0099);
	elseif(player:hasKeyItem(MESSAGE_TO_JEUNO_WINDURST)) then
		player:startEvent(0x00A6);
	elseif(player:getRank() == 5 and CurrentMission == 255 and player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false) then
		player:startEvent(0x00BE);
	elseif(player:hasKeyItem(BURNT_SEAL)) then
		player:startEvent(0x00C0);
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
printf("RESULT: %u",option);
	
	if(csid == 0x0099) then
		player:setVar("MissionStatus",1);
		player:delKeyItem(STAR_CRESTED_SUMMONS);
		player:addKeyItem(LETTER_TO_THE_AMBASSADOR);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_AMBASSADOR);
	elseif(csid == 0x00A6 or csid == 0x00BE) then
		if(option == 0) then
			player:addMission(WINDURST,THE_FINAL_SEAL);
			player:addKeyItem(NEW_FEIYIN_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,NEW_FEIYIN_SEAL);
			player:setVar("MissionStatus",10);
		end
		player:delKeyItem(MESSAGE_TO_JEUNO_WINDURST);
	elseif(csid == 0x00C0) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;