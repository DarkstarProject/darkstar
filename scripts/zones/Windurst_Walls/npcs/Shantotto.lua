-----------------------------------
--	Area: Windurst Walls
--	NPC:  Shantotto
--	Working 100%
-- CSID's misisng in autoEventID please check the old forums under resources for all of shantotto's csid's. I found them all manually.
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
	if(foiledAgain == QUEST_ACCEPTED and trade:hasItemQty(928,1) and trade:hasItemQty(880,2)) then
		player:startEvent(0xad,0,0,0,0,0,0,928,880);
		
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	foiledAgain = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1);
	
	if(foiledAgain == QUEST_AVAILABLE) then
		player:startEvent(0xab,0,0,0,0,0,0,928,880);
	elseif(foiledAgain == QUEST_COMPLETED) then
	    cDay = VanadielDayOfTheYear();
		cYear = VanadielYear();
		dFinished = player:getVar("Curses,FoiledAgain!DayFinished");
		yFinished = player:getVar("Curses,FoiledAgain!YearFinished");
		if(cDay == dFinished and cYear == yFinished) then
		    player:startEvent(0xae);
		elseif(cDay == dFinished + 1 and cYear == yFinished) then
            player:startEvent(0xb2);
		elseif(cDay >= dFinished + 2 and cYear == yFinished) then
			player:startEvent(0xb3);

			
		end	
	elseif(foiledAgain == QUEST_ACCEPTED) then
		player:startEvent(0xac,0,0,0,0,0,0,928,880);
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