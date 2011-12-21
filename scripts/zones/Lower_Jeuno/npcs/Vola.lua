-----------------------------------
-- Area: Lower Jeuno
-- NPC: Vola
-- Starts and Finishes Quest: Fistful of Fury
-- Involved in Quests: Beat Around the Bushin (before the quest)
-- @zone 245
-- @pos 43 3 -45
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	FistfulOfFury = player:getQuestStatus(JEUNO,FISTFUL_OF_FURY);
	
	if(FistfulOfFury == QUEST_ACCEPTED and trade:hasItemQty(1012,1) == true and trade:hasItemQty(1013,1) == true and trade:hasItemQty(1014,1) == true and trade:getGil() == 0 and trade:getItemCount() == 3) then 
		player:startEvent(0x00D5); -- Finish Quest "Fistful of Fury"
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	FistfulOfFury = player:getQuestStatus(JEUNO,FISTFUL_OF_FURY);
	
	if(player:getFameLevel(3) >= 3 and FistfulOfFury == QUEST_AVAILABLE and player:getQuestStatus(BASTOK,SILENCE_OF_THE_RAMS) == QUEST_COMPLETED) then 
		player:startEvent(0x00D8); -- Start Quest "Fistful of Fury" 
	elseif(FistfulOfFury == QUEST_ACCEPTED) then 
		player:startEvent(0x00D7); -- During Quest "Fistful of Fury"
	elseif(FistfulOfFury == QUEST_COMPLETED and player:getMainJob() == 2 and player:getMainLvl() >= 71 and player:getFameLevel(3) >= 6) then 
		player:startEvent(0x00D6); -- Before Quest "Beat Around the Bushin" and next dialog
	else
		player:startEvent(0x00D4); -- Standard dialog
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
	if(csid == 0x00D8 and option == 1) then
		player:addQuest(JEUNO,FISTFUL_OF_FURY);
	elseif(csid == 0x00D5) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13202);
		else 
			player:completeQuest(JEUNO,FISTFUL_OF_FURY);
			player:setTitle(BROWN_BELT);
			player:addItem(13202);
			player:messageSpecial(ITEM_OBTAINED,13202);
			player:addFame(3,NORG_FAME*125);
			player:tradeComplete();
		end		
	elseif(csid == 0x00D6 and player:getQuestStatus(JEUNO,BEAT_AROUND_THE_BUSHIN) == QUEST_AVAILABLE) then 
		player:setVar("BeatAroundTheBushin",1); -- For the next quest "Beat around the Bushin"
	end
end;



