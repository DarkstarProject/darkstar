----------------------------------
-- Area: Ifrit's Cauldron
-- NPC: Altar of Ashes
-- Involved in Quest: Greetings to the Guardian
-- @pos 16 .1 -58 205
-----------------------------------

require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Guardian = player:getQuestStatus(OUTLANDS,GREETINGS_TO_THE_GUARDIAN);
	
	if (Guardian == QUEST_ACCEPTED and trade:hasItemQty(4596,1)) then
		player:messageSpecial(ALTAR_OFFERING,0,4596);
		player:setVar("PamamaVar",1); --Set variable to reflect first completion of quest
		player:tradeComplete();
	elseif (Guardian == QUEST_COMPLETED and trade:hasItemQty(4596,1)) then
		player:messageSpecial(ALTAR_OFFERING,0,4596);
		player:setVar("PamamaVar",2); --Set variable to reflect repeat of quest, not first time
		player:tradeComplete();
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local Guardian = player:getQuestStatus(OUTLANDS,GREETINGS_TO_THE_GUARDIAN);
	
	if (Guardian == QUEST_ACCEPTED and player:getVar("PamamaVar") == 1 or player:getVar("PamamaVar") == 2) then
		player:messageSpecial(ALTAR_COMPLETED);
	elseif (Guardian == QUEST_ACCEPTED and player:getVar("PamamaVar") == 0) then
		player:messageSpecial(ALTAR_INSPECT);
	else
		player:messageSpecial(ALTAR_STANDARD);
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
end;



