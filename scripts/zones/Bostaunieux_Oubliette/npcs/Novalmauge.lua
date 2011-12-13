-----------------------------------
-- Area: Bostaunieux Obliette
-- NPC: Novalmauge
-- Involved in Quest: The Holy Crest and Trouble at the Sluice
-- @zone 167
-- @pos 70 -24 21
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
FlorVar= player:getVar("QuestFlorVar")
if (FlorVar == 2 or FlorVar == 3) then
	count = trade:getItemCount();
		florecita = trade:hasItemQty(959, 1);
		gil = trade:getGil();
		if (florecita and count == 1 and gil == 0) then
			player:startEvent(0x0011);
			end
			end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 1 or Flor == 1) then
		TheHolyCrest = player:getVar("TheHolyCrest_Event");
        FlorVar= player:getVar("QuestFlorVar")
		if (TheHolyCrest == 1) then
			player:startEvent(0x0006);
		elseif (TheHolyCrest == 2) then
			player:startEvent(0x0007);
		elseif (FlorVar == 2) then
	player:startEvent(0x000f)
	NewFlorVar = FlorVar + 1;
              player:setVar("QuestFlorVar",NewFlorVar) 
		elseif (FlorVar == 3) then
		player:startEvent(0x0010)
		else
			player:startEvent(0x000a);
		end
	else
		player:startEvent(0x000a);
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
FlorVar= player:getVar("QuestFlorVar")
	if (csid == 0x0006) then
		player:setVar("TheHolyCrest_Event",2);
	end
	if (csid == 0x0011) then
	player:tradeComplete();
	player:addKeyItem(166)
	player:messageSpecial(6540,166)
	NewFlorVar = FlorVar + 1;
              player:setVar("QuestFlorVar",NewFlorVar) 
	end
end;
