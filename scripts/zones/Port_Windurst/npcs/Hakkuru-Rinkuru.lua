-----------------------------------
--	Area: Port Windurst
--	NPC:  Hakkuru-Rinkuru
--  Involved In Quest: Making Amends
--	Working 100%
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	if (MakingAmends == QUEST_ACCEPTED and trade:getItemCount() == 1 and trade:getGil() == 0 and trade:hasItemQty(937,1) == true) then
		player:startEvent(0x0115,1500); 
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	pfame = player:getFameLevel(WINDURST);
	if (MakingAmends == QUEST_AVAILABLE and pfame >= 2) then
		player:startEvent(0x0112,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Start
	elseif (MakingAmends == QUEST_ACCEPTED) then
		player:startEvent(0x0113,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Objective Reminder
	elseif (MakingAmends == QUEST_COMPLETED and player:needToZone()) then
		player:startEvent(0x0116); -- MAKING AMENDS: After Quest
	else
		player:startEvent(0x00e0); -- Standard Conversation
	end
--========================player:delQuest(WINDURST,MAKING_AMENDS);  ---  TESTING ONLY -------
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
	if (csid == 0x0112 and option == 1) then
		player:addQuest(WINDURST,MAKING_AMENDS);
	elseif (csid == 0x0115) then
		player:addGil(GIL_RATE*1500);
		player:completeQuest(WINDURST,MAKING_AMENDS);
		player:addFame(WINDURST,WIN_FAME*75);
		player:setTitle(QUICK_FIXER);
		player:needToZone(true);
	end
end;



