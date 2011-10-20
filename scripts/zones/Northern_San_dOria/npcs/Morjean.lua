-----------------------------------
--	Area: Northern San d'Oria
--	NPC: Morjean
--  Optional Involvement in Quest: A Squire's Test II
-------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
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


	if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == 1) then
		player:startEvent(0x25a);
	elseif (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 1) then
		TheHolyCrest = player:getVar("TheHolyCrest_Event");

		if (TheHolyCrest == 2) then
			player:startEvent(0x0041);
		elseif ((TheHolyCrest == 3 and player:hasItem(WYVERN_EGG)) or TheHolyCrest == 4) then
			player:startEvent(0x003e);
		end
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

	if (csid == 0x0041) then
		player:setVar("TheHolyCrest_Event",3);
	elseif (csid == 0x003e and option == 0) then
		player:setVar("TheHolyCrest_Event",4);
	end
end;
