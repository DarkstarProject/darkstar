-----------------------------------
--	Area: Windurst Walls
--	NPC:  Shantotto
--	@pos 122 -2 112 239
--  CSID's missing in autoEventID please check the old forums under resources for all of shantotto's csid's. I found them all manually.
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local count = trade:getItemCount();
	-- Curses Foiled Again!
	if(player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(928,1) and trade:hasItemQty(880,2) and count == 3) then
			player:startEvent(0xad,0,0,0,0,0,0,928,880); -- Correct items given, complete quest.
		else
			player:startEvent(0x00AC,0,0,0,0,0,0,928,880); -- Incorrect or not enough items
		end
		
	-- Curses,Foiled ... Again!?
	elseif (player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2) == QUEST_ACCEPTED) then
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

	local foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
	local CFA2 = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2);
	local CFAtimer = player:getVar("Curses,FoiledAgain!?");
	local FoiledAGolem = player:getQuestStatus(WINDURST,CURSES_FOILED_A_GOLEM);
	local golemdelivery = player:getVar("foiledagolemdeliverycomplete");

	-------------------------------------------------------
	-- Class Reunion (note: added this to top cause not a lot of ppl will want AF for smn)
	if (player:getQuestStatus(WINDURST,CLASS_REUNION) == QUEST_ACCEPTED and player:getVar("ClassReunionProgress") == 3) then
		player:startEvent(0x0199); -- she mentions that Sunny-Pabonny left for San d'Oria
	-------------------------------------------------------
	-- Curses Foiled Again!
	elseif(foiledAgain == QUEST_AVAILABLE) then
		player:startEvent(0xab,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_ACCEPTED) then
		player:startEvent(0xac,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and CFAtimer == 0) then
	    local cDay = VanadielDayOfTheYear();
		local cYear = VanadielYear();
		local dFinished = player:getVar("Curses,FoiledAgain!Day");
		local yFinished = player:getVar("Curses,FoiledAgain!Year");
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
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17081); 
		else
			player:tradeComplete();
			player:setVar("Curses,FoiledAgain!Day",VanadielDayOfTheYear());
			player:setVar("Curses,FoiledAgain!Year",VanadielYear());
			player:addFame(WINDURST,WIN_FAME*80);
			player:addItem(17081);
			player:messageSpecial(ITEM_OBTAINED,17081);
			player:completeQuest(WINDURST,CURSES_FOILED_AGAIN_1);
		end
	
	elseif(csid == 0xab and option ~= 1) then
		player:addQuest(WINDURST,CURSES_FOILED_AGAIN_1);

	elseif(csid == 0xb3) then
		player:setVar("Curses,FoiledAgain!DayFinished",0);
	    player:setVar("Curses,FoiledAgain!YearFinished",0);
		player:setVar("Curses,FoiledAgain!Day",0);
		player:setVar("Curses,FoiledAgain!Year",0);
		player:needToZone(true);
        player:setVar("Curses,FoiledAgain!?",1); -- Used to acknowledge that the two days have passed, Use this to initiate next quest 
	
	elseif(csid == 0x00B4 and option == 3) then
		player:setVar("Curses,FoiledAgain!?",0);
		player:addQuest(WINDURST,CURSES_FOILED_AGAIN_2);
		player:setTitle(TARUTARU_MURDER_SUSPECT);
	
	elseif(csid == 0x00B7) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17116); 
		else
			player:tradeComplete();
			player:setTitle(HEXER_VEXER);
			player:addItem(17116);
			player:messageSpecial(ITEM_OBTAINED,17116);
			player:completeQuest(WINDURST,CURSES_FOILED_AGAIN_2);
			player:needToZone(true);
			player:addFame(WINDURST,WIN_FAME*90);
		end
		
	elseif(csid == 0x0154) then
		if(option == 1) then
			player:addQuest(WINDURST,CURSES_FOILED_A_GOLEM);
		else
			player:setTitle(TOTAL_LOSER);
		end
		
	elseif(csid == 0x0156) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4870); 
		else
			player:completeQuest(WINDURST,CURSES_FOILED_A_GOLEM);
			player:setVar("foiledagolemdeliverycomplete",0);
			player:addItem(4870);
			player:messageSpecial(ITEM_OBTAINED,4870);
			player:setTitle(DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH);
			player:addFame(WINDURST,WIN_FAME*120);
		end
	elseif(csid == 0x0199) then
		player:setVar("ClassReunionProgress",4);
	end		
end;
