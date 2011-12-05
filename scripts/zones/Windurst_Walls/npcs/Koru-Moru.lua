-----------------------------------
--	Area: Windurst Waters
--	NPC:  Koru-Moru
--  Involved in Quest: Making the Grade
--	Working 100%
--  @zone = 239
--  @pos = -120 -6 124
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	gradestatus = player:getQuestStatus(WINDURST,MAKING_THE_GRADE);
	if (gradestatus == QUEST_ACCEPTED) then
		prog = player:getVar("QuestMakingTheGrade_prog");
		if (prog == 0 and player:hasItem(544)) then
			player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
		elseif (prog == 1) then
			player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
		elseif (prog >= 2) then
			player:startEvent(0x011e); -- MAKING THE GRADE: Reminder to go away
		else
			player:startEvent(0x00c1);
		end
	elseif (hasItemQty(544,1)) then
		player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
	else
		player:startEvent(0x00c1);
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
	if (csid == 0x011d) then  -- Giving him KI from Principle
		player:addKeyItem(TATTERED_TEST_SHEET);
		player:messageSpecial(KEYITEM_OBTAINED,TATTERED_TEST_SHEET);
		player:setVar("QuestMakingTheGrade_prog",2);
	end
end;



