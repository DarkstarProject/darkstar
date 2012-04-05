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
	
	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") >= 2) then
		player:startEvent(0x0190);
		
	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
		player:startEvent(0x018d);
		
	elseif(bookwormStatus == QUEST_ACCEPTED and player:hasKeyItem(10) == true) then
		player:startEvent(0x0186);
	
	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0185);
		
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
		player:completeQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
		player:addGil(1500);
		player:messageSpecial(GIL_OBTAINED,1500);
		player:setTitle(Savior_of_Knowledge);
		player:setVar("EARLY_BIRD_TRACK_BOOK",0);
		player:needToZone(true);
	end
end;



