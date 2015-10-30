-----------------------------------
--	Area: Mhaura
--	NPC:  Take
--  Involved In Quest: RYCHARDE_THE_CHEF
--  Starts and finishes quest: Expertice
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Mhaura/TextIDs");

-- player:startEvent(0x3b); -- standar dialog
-- player:startEvent(0x3c); -- tell to look for ricarde
--player:startEvent(0x44); -- not talked to rycharde yet
--player:startEvent(0x3d);-- accept expertice quest
--player:startEvent(0x3e);-- expertice completed
--player:startEvent(0x3f);-- expertice not done yet
--player:startEvent(0x40); -- after expertice quest
--player:startEvent(0x41); -- good luck
--player:startEvent(0x42);-- Valgeir cook was delicious
--player:startEvent(0x43);-- after back to basics i think
		
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

		
if (player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF)==QUEST_AVAILABLE) then -- if available and allready talked to mayor assistant
	if (player:getVar("QuestRychardetheChef_var") == 1) then
		player:startEvent(0x3c); -- tell to look for ricarde
	elseif (player:getVar("QuestRychardetheChef_var") == 2) then
		player:startEvent(0x44); -- not talked to rycharde yet
	else
		player:startEvent(0x3b); -- talk abaout something else	
	end

	
elseif (player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_AVAILABLE and player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR )==QUEST_COMPLETED) then --
	player:startEvent(0x3d);-- accept expertice quest
	
	
elseif (player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_ACCEPTED) then --
	if (player:hasKeyItem(LAND_CRAB_BISQUE)) then -- if have the Land Crab Bisque from Valgeir
		player:startEvent(0x3e,132);-- expertice completed		
	else
		player:startEvent(0x3f);-- expertice not done yet
	end
	
elseif (player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_COMPLETED and player:getQuestStatus(OTHER_AREAS,THE_CLUE)==QUEST_AVAILABLE) then --
	player:startEvent(0x40); -- after expertice quest	
elseif (player:getQuestStatus(OTHER_AREAS,THE_CLUE)==QUEST_ACCEPTED) then--
	player:startEvent(0x41); -- good luck
elseif (player:getQuestStatus(OTHER_AREAS,THE_CLUE)==QUEST_COMPLETED and player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_AVAILABLE) then --
	player:startEvent(0x42);-- Valgeir cook was delicious
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_COMPLETED) then--
	player:startEvent(0x43);-- after back to basics i think
else
	player:startEvent(0x3b); -- talk abaout something else	
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
	if (csid == 0x3c) then  
		player:setVar("QuestRychardetheChef_var",2); -- second stage on quest
	elseif (csid == 0x3d) then  -- accept quest EXPERTICE
		player:addQuest(OTHER_AREAS,EXPERTISE);	
	elseif (csid == 0x3e) then   -- end quest expertice
		player:addFame(WINDURST,WIN_FAME*120);
		if (player:getFreeSlotsCount() < 1) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,132);
		else
			player:addItem(132);
			player:messageSpecial(ITEM_OBTAINED,132);
			player:addTitle(THREESTAR_PURVEYOR);
			player:setVar("QUEST_EXPERTISE_STATE_var",0); --done cooking
			player:setVar("QuestHNIVCCompDay_var",0); -- completition day of unending chase
			player:setVar("QuestHNIVCCompYear_var",0);
			player:setVar("QuestExpertiseCompDay_var",VanadielDayOfTheYear()); -- completition day of expertise quest
			player:setVar("QuestExpertiseCompYear_var",VanadielYear());
			player:delKeyItem(LAND_CRAB_BISQUE); --give Land Crab Bisque from Valgeir
			player:completeQuest(OTHER_AREAS,EXPERTISE);
		end
	end
end;



