-----------------------------------
-- Area: Metalworks
-- NPC: Mighty Fist
-- Starts & Finishes Repeatable Quest: The Darksmith
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

TheDarksmith = player:getQuestStatus(BASTOK,THE_DARKSMITH);

	if (TheDarksmith >= QUEST_ACCEPTED) then
		count = trade:getItemCount();
		DarksteelOre = trade:hasItemQty(645,2);

		if (DarksteelOre == true and count == 2) then
			player:startEvent(0x0236);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TheDarksmith = player:getQuestStatus(BASTOK,THE_DARKSMITH);
Fame = player:getFameLevel(BASTOK);

	if (TheDarksmith == QUEST_AVAILABLE and Fame >= 3) then
		player:startEvent(0x0235);
	else
		Message = math.random(0,1);
		
		if (Message == 1) then
			player:startEvent(0x0230);
		else
			player:startEvent(0x0231);
		end
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

	if (csid == 0x0235) then
		player:addQuest(BASTOK,THE_DARKSMITH);			
	elseif (csid == 0x0236) then
		TheDarksmith = player:getQuestStatus(BASTOK,THE_DARKSMITH);
		
		if (TheDarksmith == QUEST_ACCEPTED) then
			player:completeQuest(BASTOK,THE_DARKSMITH);
			player:addFame(BASTOK,BAS_FAME*75);
		else
			player:addFame(BASTOK,BAS_FAME*8);
		end
		
		player:tradeComplete();
		player:addGil(GIL_RATE*8000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*8000);
	end

end;



