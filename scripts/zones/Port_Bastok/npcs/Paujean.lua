-----------------------------------
-- Area: Port Bastok
-- NPC: Paujean
-- Starts & Finishes Quest: Silence of the Rams
-----------------------------------

require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

SilenceOfTheRams = player:getQuestStatus(BASTOK,SILENCE_OF_THE_RAMS);

	if (SilenceOfTheRams == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		LumberingHorn = trade:hasItemQty(910,1);
		RampagingHorn = trade:hasItemQty(911,1);
		
		if (LumberingHorn == true and RampagingHorn == true and count == 2) then
			player:startEvent(0x00c4);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

SilenceOfTheRams = player:getQuestStatus(BASTOK,SILENCE_OF_THE_RAMS);
Fame = player:getFameLevel(3);

	if (SilenceOfTheRams == QUEST_AVAILABLE and Fame >= 2) then
		player:startEvent(0x00c3);
	elseif (SilenceOfTheRams == QUEST_ACCEPTED) then
		player:showText(npc,PAUJEAN_DIALOG_1);
	else
		player:startEvent(0x0019);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x00c3) then
		player:addQuest(BASTOK,SILENCE_OF_THE_RAMS);
	elseif (csid == 0x00c4) then
		player:tradeComplete();
		player:completeQuest(BASTOK,SILENCE_OF_THE_RAMS);
		player:addFame(3,NORG_FAME*125);
		player:addItem(13201);
		player:messageSpecial(ITEM_OBTAINED,13201);
		player:setTitle(PURPLE_BELT);
	end
	
end;




