-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Ratihb
-- Standard Info NPC
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	LuckOfTheDraw = player:getQuestStatus(AHT_URHGAN,LUCK_OF_THE_DRAW);
	

	if(LuckOfTheDraw == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL) then		-- corsair job quest
		player:startEvent(0x0223);	
		player:setVar("LuckOfTheDraw",1);
		player:addQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
	else
		player:startEvent(0x025B);	-- standard dialog
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



