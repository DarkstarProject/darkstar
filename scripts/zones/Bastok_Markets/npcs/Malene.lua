-----------------------------------
-- Area: Bastok Markets
-- NPC: Malene
-- Starts & Finishes Quest: The Cold Light of Day
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
  	if (trade:hasItemQty(550,1) and trade:getItemCount() == 1) then -- Trade Steam Clock
		if (player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY) ~= QUEST_AVAILABLE) then
			player:startEvent(0x68);
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0066);
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

	TheColdLightofDay = player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY);

	if (csid == 0x0066) then
		if (TheColdLightofDay == QUEST_AVAILABLE) then
			player:addQuest(BASTOK,THE_COLD_LIGHT_OF_DAY);	
		end
	elseif (csid == 0x68) then
		player:tradeComplete();
		player:addTitle(CRAB_CRUSHER);			
		player:addGil(GIL_RATE*500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*500);	
		
		if (TheColdLightofDay == QUEST_ACCEPTED) then 
			player:addFame(BASTOK,BAS_FAME*50);
			player:completeQuest(BASTOK,THE_COLD_LIGHT_OF_DAY);
		else
			player:addFame(BASTOK,BAS_FAME*8);
		end
	end
	
end;