-----------------------------------
-- Area: Selbina
-- NPC:  Thunder Hawk
-- Starts and Finishes Quest: The Rescue
-- @pos -58 -10 6 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
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
	local TheRescue = player:getQuestStatus(OTHER_AREAS,THE_RESCUE);
	local SelbiFame = math.floor((player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2); -- Selbina Fame
	
	if (TheRescue == QUEST_AVAILABLE and SelbiFame >= 1) then
		player:startEvent(0x0050); -- Start quest "The rescue"
	elseif (TheRescue == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
		player:startEvent(0x0053); -- During quest "The rescue"
	elseif (TheRescue == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == true) then
		player:startEvent(0x0051); -- Finish quest "The rescue"
	elseif (TheRescue == QUEST_COMPLETED) then
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
	if (csid == 0x0050 and option == 70) then
		player:addQuest(OTHER_AREAS,THE_RESCUE);
	elseif (csid == 0x0051) then
		player:completeQuest(OTHER_AREAS,THE_RESCUE);
		player:addTitle(HONORARY_CITIZEN_OF_SELBINA);
		player:delKeyItem(TRADERS_SACK);
		if (player:hasKeyItem(MAP_OF_THE_RANGUEMONT_PASS) == false) then
			player:addKeyItem(MAP_OF_THE_RANGUEMONT_PASS);
			player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_RANGUEMONT_PASS);
		end
		player:addGil(3000);
		player:messageSpecial(GIL_OBTAINED,3000);
		player:addFame(OTHER_AREAS,30);
	end
end;



