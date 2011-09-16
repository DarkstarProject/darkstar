-----------------------------------
-- Area: Garlaige Citadel
-- NPC: qm1 (???)
-- Involved In Quest: Altana's Sorrow
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

AltanaSorrow  = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
VirnageLetter = player:hasKeyItem(174);

	if (AltanaSorrow == QUEST_ACCEPTED and VirnageLetter == false) then
		player:addKeyItem(173);
		player:messageSpecial(KEYITEM_OBTAINED,173);
	else
		player:messageSpecial(YOU_FIND_NOTHING);
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
end;