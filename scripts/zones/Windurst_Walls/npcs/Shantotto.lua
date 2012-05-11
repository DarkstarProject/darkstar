-----------------------------------
--	Area: Windurst Walls
--	NPC:  Shantotto
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");

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
		
	end		
end;