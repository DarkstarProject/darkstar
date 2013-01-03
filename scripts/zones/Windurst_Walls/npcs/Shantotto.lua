-----------------------------------
--	Area: Windurst Walls
--	NPC:  Shantotto
--	Working 100%
--	@zone 239
--	@pos x:122 y:-2 z:112 
--  CSID's missing in autoEventID please check the old forums under resources for all of shantotto's csid's. I found them all manually.
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
	CFA2 = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2);
	
	-- Curses Foiled Again!
	if(foiledAgain == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		if(trade:hasItemQty(928,1) and trade:hasItemQty(880,2) and count == 3) then
			player:startEvent(0xad,0,0,0,0,0,0,928,880); -- Correct items given, complete quest.
		else
			player:startEvent(0x00AC,0,0,0,0,0,0,928,880); -- Incorrect or not enough items
		end
		
	-- Curses,Foiled ... Again!?
	elseif (CFA2 == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		if(trade:hasItemQty(17316,2) and trade:hasItemQty(940,1) and trade:hasItemQty(552,1) and count == 4) then
			player:startEvent(0x00B7); -- Correct items given, complete quest.
		else
			player:startEvent(0x00B5,0,0,0,0,0,0,17316,940); -- Incorrect or not enough items
		end
	
		
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
	CFA2 = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2);
	CFAtimer = player:getVar("Curses,FoiledAgain!?");
	FoiledAGolem = player:getQuestStatus(WINDURST,CURSES_FOILED_A_GOLEM);
	golemdelivery = player:getVar("foiledagolemdeliverycomplete");
	
	-- Curses Foiled Again!
	if(foiledAgain == QUEST_AVAILABLE) then
		player:startEvent(0xab,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_ACCEPTED) then
		player:startEvent(0xac,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and CFAtimer == 0) then
	    cDay = VanadielDayOfTheYear();
		cYear = VanadielYear();
		dFinished = player:getVar("Curses,FoiledAgain!Day");
		yFinished = player:getVar("Curses,FoiledAgain!Year");
		if(cDay == dFinished and cYear == yFinished) then
		    player:startEvent(0xae);
		elseif(cDay == dFinished + 1 and cYear == yFinished) then
            player:startEvent(0xb2);
		elseif(cDay >= dFinished + 2 and cYear == yFinished) then
			player:startEvent(0xb3);
			end	
	
		
	-- Curses,Foiled...Again!?
	elseif (foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and player:getFameLevel (WINDURST) >= 2 and player:getMainLvl() >= 5 and CFAtimer == 1) then
		player:startEvent(0x00B4,0,0,0,0,928,880,17316,940);		-- Quest Start
	elseif (CFA2 == QUEST_ACCEPTED) then
		player:startEvent(0x00B5,0,0,0,0,0,0,17316,940);  -- Reminder dialog
	
		
	-- Curses,Foiled A-Golem!?
	elseif (CFA2 == QUEST_COMPLETED and FoiledAGolem == QUEST_AVAILABLE and player:getFameLevel (WINDURST) >= 4 and player:getMainLvl() >= 10) then
		player:startEvent(0x0154);  --quest start
	elseif (golemdelivery == 1) then
		player:startEvent(0x0156);  -- finish
	elseif (FoiledAGolem == QUEST_ACCEPTED) then
		player:startEvent(0x0155);  -- reminder dialog
	
	
	-- Standard dialog
	elseif (FoiledAGolem == QUEST_COMPLETED) then
		player:startEvent(0x0157);  -- new standard dialog after Curses,Foiled A-Golem!?
	
	elseif (CFA2 == QUEST_COMPLETED) then
		player:startEvent(0x00B8); 	-- New standard dialog after CFA2
	
	else
		player:startEvent(0xa4);
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
	if(csid == 0xad) then
		player:tradeComplete();
		player:setVar("Curses,FoiledAgain!Day",VanadielDayOfTheYear());
		player:setVar("Curses,FoiledAgain!Year",VanadielYear());
		player:addFame(WINDURST,WIN_FAME*80);
		player:addItem(17081);
		player:messageSpecial(ITEM_OBTAINED,17081);
		player:completeQuest(WINDURST,CURSES_FOILED_AGAIN_1);
	
	elseif(csid == 0xab and option ~= 1) then
		player:addQuest(WINDURST,CURSES_FOILED_AGAIN_1);
	
	elseif(csid == 0xb3) then
		player:setVar("Curses,FoiledAgain!DayFinished",0);
	    player:setVar("Curses,FoiledAgain!YearFinished",0);
		player:needToZone(true);
        player:setVar("Curses,FoiledAgain!?",1); -- Used to acknowledge that the two days have passed, Use this to initiate next quest 

	end
			
end;