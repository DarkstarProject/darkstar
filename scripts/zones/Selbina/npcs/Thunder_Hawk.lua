-----------------------------------
-- Area: Selbina
-- NPC:  Thunder Hawk
-- Starts and Finishes Quest: The Rescue
-- @zone 248
-- @pos -58 -10 6
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheRescue = player:getQuestStatus(OTHER_AREAS,THE_RESCUE);
	SelbiFame = math.floor((player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2); -- Selbina Fame
	
	if(TheRescue == QUEST_AVAILABLE and SelbiFame >= 1) then
		player:startEvent(0x0050); -- Start quest "The rescue"
	elseif(TheRescue == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
		player:startEvent(0x0053); -- During quest "The rescue"
	elseif(TheRescue == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == true) then
		player:startEvent(0x0051); -- Finish quest "The rescue"
	elseif(TheRescue == QUEST_COMPLETED) then
		player:startEvent(0x0052); -- New standard dialog
	else
		player:startEvent(0x0054); -- Standard dialog
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
	if(csid == 0x0050 and option == 70) then
		player:addQuest(OTHER_AREAS,THE_RESCUE);
	elseif(csid == 0x0051) then
		player:completeQuest(OTHER_AREAS,THE_RESCUE);
		player:addTitle(HONORARY_CITIZEN_OFTextID_Selbina);
		player:delKeyItem(TRADERS_SACK);
		player:addKeyItem(MAP_OF_THE_RANGUEMONT_PASS);
		player:messageSpecial(TextID_Selbina.KEYITEM_OBTAINED,MAP_OF_THE_RANGUEMONT_PASS);
		player:addGil(3000);
		player:messageSpecial(TextID_Selbina.GIL_OBTAINED,3000);
		player:addFame(OTHER_AREAS,30);
	end
end;



