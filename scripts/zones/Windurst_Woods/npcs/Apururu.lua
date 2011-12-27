-----------------------------------
-- Area: Windurst Woods
-- NPC:  Apururu
-- Involved in Quests: The kind cardian
-- @zone 241
-- @pos -11 -2 13
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,THE_KIND_CARDIAN) == QUEST_ACCEPTED) then 
		if(trade:hasItemQty(969,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x018d);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheKindCardian = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
	
	if(TheKindCardian == QUEST_ACCEPTED) then 
		if(player:getVar("theKindCardianVar") == 0) then 
			player:startEvent(0x0188);
		elseif(player:getVar("theKindCardianVar") == 1) then 
			player:startEvent(0x0189);
		elseif(player:getVar("theKindCardianVar") == 2) then 
			player:startEvent(0x018e);
		end
	else
		player:startEvent(0x0112);
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
	if(csid == 0x0188 and option == 1) then 
		player:setVar("theKindCardianVar",1);
	elseif(csid == 0x018d) then 
		player:delKeyItem(TWO_OF_SWORDS);
		player:setVar("theKindCardianVar",2);
		player:addFame(WINDURST,WIN_FAME*30);
		player:tradeComplete();
	end
end;



