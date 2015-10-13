-----------------------------------
-- Area: Metalworks
-- NPC:  Mighty Fist
-- Starts & Finishes Quest: The Darksmith (R)
-- Involved in Quest: Dark Legacy
-- @pos -47 2 -30 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(BASTOK,THE_DARKSMITH) ~= QUEST_AVAILABLE) then
		if (trade:hasItemQty(645,2) and trade:getItemCount() == 2) then
			player:startEvent(0x0236);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("darkLegacyCS") == 1) then
		player:startEvent(0x02f0);
	elseif (player:hasKeyItem(DARKSTEEL_FORMULA)) then
		player:startEvent(0x02f2);
	elseif (player:getQuestStatus(BASTOK,THE_DARKSMITH) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 3) then
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
		
		player:tradeComplete();
		player:addGil(GIL_RATE*8000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*8000);
		
		if (TheDarksmith == QUEST_ACCEPTED) then
			player:addFame(BASTOK,BAS_FAME*30);
			player:completeQuest(BASTOK,THE_DARKSMITH);
		else
			player:addFame(BASTOK,BAS_FAME*5);
		end
	elseif (csid == 0x02f0) then
		player:setVar("darkLegacyCS",2);
		player:addKeyItem(LETTER_FROM_THE_DARKSTEEL_FORGE);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_THE_DARKSTEEL_FORGE);
	end
	
end;