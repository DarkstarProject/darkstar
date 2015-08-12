-----------------------------------
-- Area: Rabao
-- NPC: Edigey
-- Starts and Ends Quest: Don't Forget the Antidote
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	ForgetTheAntidote = player:getQuestStatus(OUTLANDS,DONT_FORGET_THE_ANTIDOTE);
	
	if ((ForgetTheAntidote == QUEST_ACCEPTED or ForgetTheAntidote == QUEST_COMPLETED) and trade:hasItemQty(1209,1) and trade:getItemCount() == 1) then
		player:startEvent(0x0004,0,1209); 
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	ForgetTheAntidote = player:getQuestStatus(OUTLANDS,DONT_FORGET_THE_ANTIDOTE);
	
	if (ForgetTheAntidote == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 4) then
		player:startEvent(0x0002,0,1209);
	elseif (ForgetTheAntidote == QUEST_ACCEPTED) then
		player:startEvent(0x0003,0,1209);
	elseif (ForgetTheAntidote == QUEST_COMPLETED) then
		player:startEvent(0x0005,0,1209);
	else
		player:startEvent(0x0032);
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
	if (csid == 0x0002 and option == 1) then
		player:addQuest(OUTLANDS,DONT_FORGET_THE_ANTIDOTE);
		player:setVar("DontForgetAntidoteVar",1);
	elseif (csid == 0x0004 and player:getVar("DontForgetAntidoteVar") == 1) then --If completing for the first time
		player:setVar("DontForgetAntidoteVar",0);
		player:tradeComplete();
		player:addTitle(262);
		player:addItem(16974); -- Dotanuki
		player:messageSpecial(ITEM_OBTAINED, 16974); 
		player:completeQuest(OUTLANDS,DONT_FORGET_THE_ANTIDOTE);
		player:addFame(OUTLANDS,60);  
	elseif (csid == 0x0004) then --Subsequent completions
		player:tradeComplete();
		player:addGil(GIL_RATE*1800);
		player:messageSpecial(GIL_OBTAINED, 1800);
		player:addFame(OUTLANDS,30); 
	end

end;



