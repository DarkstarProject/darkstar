-----------------------------------
--	Area: Windurst Waters
--	NPC:  Furakku-Norakku
--	Working 100%
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	if(bookwormStatus == QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x0191);
	
	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") >= 2 and player:hasKeyItem(ART_FOR_EVERYONE)) then
		player:startEvent(0x0190);
		
	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
		player:startEvent(0x018d,0,27);
		
	elseif(bookwormStatus == QUEST_ACCEPTED and player:hasKeyItem(10) == true) then
		player:startEvent(0x0186,0,27);
	
	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0185,0,27);
		
	else
		player:startEvent(0x173);
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
	if(csid == 0x0185) then
		player:addKeyItem(OVERDUE_BOOK_NOTIFICATIONS);
		player:messageSpecial(KEYITEM_OBTAINED,OVERDUE_BOOK_NOTIFICATIONS);
	elseif(csid == 0x0190) then
		player:addGil(GIL_RATE*1500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
		player:addFame(WINDURST,WIN_FAME*120);
		player:setTitle(SAVIOR_OF_KNOWLEDGE);
		player:setVar("EARLY_BIRD_TRACK_BOOK",0);
		player:delKeyItem(10);
		player:delKeyItem(27);
		player:completeQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
		player:needToZone(true);
	end
end;



