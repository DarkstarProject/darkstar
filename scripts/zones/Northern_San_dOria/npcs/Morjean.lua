-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Morjean
-- Optional Involvement in Quest: A Squire's Test II
-- @zone 231
-- @pos 99 0 116
-------------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_ACCEPTED) then
		TheHolyCrest = player:getVar("TheHolyCrest_Event");

		if(TheHolyCrest == 2) then
			player:startEvent(0x0041);
		elseif((TheHolyCrest == 3 and player:hasItem(WYVERN_EGG)) or TheHolyCrest == 4) then
			player:startEvent(0x003e);
		end
	elseif(player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == QUEST_ACCEPTED) then
		player:startEvent(0x25a);
	else
		player:startEvent(0x259);
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

	if(csid == 0x0041) then
		player:setVar("TheHolyCrest_Event",3);
	elseif(csid == 0x003e and option == 0) then
		player:setVar("TheHolyCrest_Event",4);
	end
	
end;
