-----------------------------------
--	Area: Windurst Waters
--	NPC:  Furakku-Norakku
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");

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
	chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
	if(bookwormStatus == QUEST_COMPLETED and chasingStatus ~= QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x0191);

	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") >= 2) then
		player:startEvent(0x0190);

	elseif(bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
		player:startEvent(0x018d);

	elseif(bookwormStatus == QUEST_ACCEPTED and player:hasKeyItem(10) == true) then
		player:startEvent(0x0186);

	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0185);
    
	end

	if(chasingStatus == QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x019b);
	elseif(player:hasKeyItem(126)) then
		player:startEvent(0x019a);
	
	elseif(player:getVar("CHASING_TALES_TRACK_BOOK") == 1) then
	    player:startEvent(0x0199);
		
	elseif(player:hasKeyItem(149) ==true) then
		player:startEvent(0x0195);
		
	elseif(chasingStatus == QUEST_ACCEPTED) then
	    player:startEvent(0x0194,0,126); --  Add initial cutscene
	
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
		player:setTitle(SAVIOR_OF_KNOWLEDGE);
		player:setVar("EARLY_BIRD_TRACK_BOOK",0);
		player:needToZone(true);
	
	elseif(csid == 0x0194) then 
		player:addKeyItem(149);
		player:messageSpecial(KEYITEM_OBTAINED,OVERDUE_BOOK_NOTIFICATION);
	elseif(csid == 0x019a) then
		player:addGil(GIL_RATE*2800);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*2800);
		player:setTitle(SAVIOR_OF_KNOWLEDGE);
		player:addFame(WINDURST,WIN_FAME*120);
		player:delKeyItem(149);
		player:delKeyItem(126);
		player:setVar("CHASING_TALES_TRACK_BOOK",0);
		player:completeQuest(WINDURST,CHASING_TALES);
		player:needToZone(true);
		
	end
end;