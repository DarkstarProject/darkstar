-----------------------------------
-- Area: Bastok Mines
-- NPC: Virnage
-- Starts Quest: Altana's Sorrow
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

AltanaSorrow = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
Fame  = player:getFameLevel(BASTOK);
Level = player:getMainLvl();

	if (AltanaSorrow == QUEST_COMPLETED) then
		player:startEvent(0x0091);
	elseif (AltanaSorrow == QUEST_ACCEPTED) then
		DivinePaint   = player:hasKeyItem(173);
		VirnageLetter = player:hasKeyItem(174);
		
		if (DivinePaint == true) then
			player:startEvent(0x008f);
		elseif (VirnageLetter == true) then
			player:showText(npc,VIRNAGE_DIALOG_2);
		else
			player:showText(npc,VIRNAGE_DIALOG_1);
		end
	elseif (AltanaSorrow == QUEST_AVAILABLE and Fame >= 4 and Level >= 10) then
		player:startEvent(0x008d);
	else
		player:startEvent(0x008c);
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

	if (csid == 0x008d) then
		player:addQuest(BASTOK,ALTANA_S_SORROW);
	elseif (csid == 0x008f) then
		player:delKeyItem(173);
		player:addKeyItem(174);
		player:messageSpecial(KEYITEM_OBTAINED,174);
	end
	
end;