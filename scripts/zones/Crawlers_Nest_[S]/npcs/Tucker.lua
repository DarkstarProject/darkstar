----------------------------------
--  Area: Crawlers' Nest [S]
--  NPC: Tucker
-----------------------------------

package.loaded["scripts/zones/Crawlers_Nest_[S]/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
	local ALittleKnowledgeProgress = player:getVar("ALittleKnowledgeProgress");
	local TuckerProgress = player:getVar("Tucker");
	
	if(ALittleKnowledge == QUEST_ACCEPTED and ALittleKnowledgeProgress == 1 and TuckerProgress > 0 and TuckerProgress < 4) then
		if(trade:hasItemQty(4365, 48) and trade:getGil() == 0 and trade:getItemCount() == 48) then
			if(TuckerProgress == 1) then
				player:startEvent(8);
			elseif(TuckerProgress == 2) then
				player:startEvent(10);
			elseif(TuckerProgress == 3) then
				player:startEvent(11);
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
	local ALittleKnowledgeProgress = player:getVar("ALittleKnowledge");
	local TuckerProgress = player:getVar("Tucker");
	
	if(ALittleKnowledge == QUEST_ACCEPTED and ALittleKnowledgeProgress == 1) then
		if(TuckerProgress == 1) then
			player:startEvent(7);
		elseif(TuckerProgress == 2 or TuckerProgress == 3) then
			player:startEvent(9);
		elseif(TuckerProgress == 0) then
			player:startEvent(12);
		else
			player:startEvent(6);
		end
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	local TuckerProgress = player:getVar("Tucker");
	
	if(csid == 6) then
		player:setVar("Tucker", 1);
	elseif(csid == 8) then
		if(player:getFreeSlotsCount() > 0) then
			player:tradeComplete();
			player:addItem(2550, 4);
			player:messageSpecial(ITEM_OBTAINED + 9, 2550, 4);
			player:setVar("Tucker", 2);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 2550);
		end
	elseif(csid == 10) then
		if(player:getFreeSlotsCount() > 0) then
			player:tradeComplete();
			player:addItem(2550, 4);
			player:messageSpecial(ITEM_OBTAINED + 9, 2550, 4);
			player:setVar("Tucker", 3);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 2550);
		end
	elseif(csid == 11) then
		if(player:getFreeSlotsCount() > 0) then
			player:tradeComplete();
			player:addItem(2550, 4);
			player:messageSpecial(ITEM_OBTAINED + 9, 2550, 4);
			player:setVar("Tucker", 0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 2550);
		end
	end
end;