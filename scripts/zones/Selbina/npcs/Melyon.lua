-----------------------------------
-- Area: Selbina
-- NPC:  Melyon
-- Starts and Finishes Quest: Only the Best (R)
-- @zone 248
-- @pos 25 -6 6
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(OTHER_AREAS,ONLY_THE_BEST) ~= QUEST_AVAILABLE) then
		if(trade:hasItemQty(4366,5) == true and trade:getGil() == 0 and trade:getItemCount() == 5) then 
			player:startEvent(0x003e); -- La Theine Cabbage x5
			
		elseif(trade:hasItemQty(629,3) == true and trade:getGil() == 0 and trade:getItemCount() == 3) then 
			player:startEvent(0x003f); -- Millioncorn x3
			
		elseif(trade:hasItemQty(919,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x0040); -- Boyahda Moss x1 
			
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	OnlyTheBest = player:getQuestStatus(OTHER_AREAS,ONLY_THE_BEST);
	
	if(OnlyTheBest == QUEST_AVAILABLE) then
		player:startEvent(0x003c,4366,629,919); -- Start quest "Only the Best"
	elseif(OnlyTheBest ~= QUEST_AVAILABLE) then
		player:startEvent(0x003d,4366,629,919); -- During & after completed quest "Only the Best"
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
	if(csid == 0x003c and option == 10) then
		player:addQuest(OTHER_AREAS,ONLY_THE_BEST);
	elseif(csid == 0x003e) then
		player:addGil(100);
		player:messageSpecial(GIL_OBTAINED,100);
		player:tradeComplete();
	elseif(csid == 0x003f) then
		player:addGil(120);
		player:messageSpecial(GIL_OBTAINED,120);
		player:tradeComplete();
	elseif(csid == 0x0040) then
		player:addGil(600);
		player:messageSpecial(GIL_OBTAINED,600);
		player:tradeComplete();
	end
	if(player:getQuestStatus(OTHER_AREAS,ONLY_THE_BEST) == QUEST_ACCEPTED) then
		player:completeQuest(OTHER_AREAS,ONLY_THE_BEST);
		player:addFame(BASTOK,BAS_FAME*15);
		player:addFame(SANDORIA,SAN_FAME*15);
		player:addFame(OTHER_AREAS,30);
	else
		player:addFame(BASTOK,BAS_FAME*15);
		player:addFame(SANDORIA,SAN_FAME*15);
		player:addFame(JEUNO,10);
	end
end;



