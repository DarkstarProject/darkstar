-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Vestal Chamber (chamber of the Star Sibyl)
-- @pos 0.1 -49 37 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
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
	
	local CurrentMission = player:getCurrentMission(WINDURST);
	local MissionStatus = player:getVar("MissionStatus");
	
	if(CurrentMission == A_NEW_JOURNEY and MissionStatus == 0) then
		player:startEvent(0x0099);
	elseif(player:hasKeyItem(MESSAGE_TO_JEUNO_WINDURST)) then
		player:startEvent(0x00A6);
	elseif(player:getRank() == 5 and CurrentMission == 255 and player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false) then
		player:startEvent(0x00BE);
	elseif(player:hasKeyItem(BURNT_SEAL)) then
		player:startEvent(0x00C0);
	elseif(CurrentMission == THE_SHADOW_AWAITS and MissionStatus == 0) then
		player:startEvent(0x00D6);
	elseif(CurrentMission == THE_SHADOW_AWAITS and player:hasKeyItem(SHADOW_FRAGMENT)) then
		player:startEvent(0x00D8);
	elseif(CurrentMission == SAINTLY_INVITATION and MissionStatus == 0) then
		player:startEvent(0x0136);
	elseif(CurrentMission == SAINTLY_INVITATION and MissionStatus == 3) then
		player:startEvent(0x0138);
	elseif(CurrentMission == DOLL_OF_THE_DEAD and MissionStatus == 2) then
		player:startEvent(0x016A);
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
	elseif(csid == 0x00A6 or csid == 0x00BE) then
		if(option == 0) then
			player:addMission(WINDURST,THE_FINAL_SEAL);
			player:addKeyItem(NEW_FEIYIN_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,NEW_FEIYIN_SEAL);
			player:setVar("MissionStatus",10);
		end
		player:delKeyItem(MESSAGE_TO_JEUNO_WINDURST);
	elseif(csid == 0x00D6) then
		player:setVar("MissionStatus",2);
		player:delKeyItem(STAR_CRESTED_SUMMONS);
		player:addTitle(STARORDAINED_WARRIOR);
	elseif(csid == 0x0136) then
		player:setVar("MissionStatus",1);
		player:addTitle(HERO_ON_BEHALF_OF_WINDURST);
		player:addKeyItem(HOLY_ONES_INVITATION);
		player:messageSpecial(KEYITEM_OBTAINED,HOLY_ONES_INVITATION);
	elseif(csid == 0x0138) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x00C0 or csid == 0x00D8) then
		finishMissionTimeline(player,1,csid,option);
	elseif(csid == 0x016A) then
		player:setVar("MissionStatus",3);
	end
	
end;