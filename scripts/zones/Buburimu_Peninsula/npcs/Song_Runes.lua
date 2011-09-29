-----------------------------------
--	Area: Buburimu Peninsula
--	NPC:  Song Runes
--  Finishes Quest: The Old Monument
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Buburimu_Peninsula/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
			
		if (player:getVar("TheOldMonument_Event") == 3) then
			count = trade:getItemCount();
			gil = trade:getGil();
			Parchment = trade:hasItemQty(917,1);

			if (count == 1 and gil == 0 and Parchment == true) then
				player:addItem(634,1); -- Poetic Parchment
				player:messageSpecial(ITEM_OBTAINED, 634);
				player:completeQuest(JEUNO,THE_OLD_MONUMENT);
				player:setVar("TheOldMonument_Event",0);
				player:setTitle(RESEARCHER_OF_CLASSICS);
				player:addFame(BASTOK,BAS_FAME*10);
				player:addFame(SAN_D_ORIA,SAN_FAME*10);
				player:addFame(WINDURST,WIN_FAME*10);
				player:tradeComplete();
			end
		end		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getVar("TheOldMonument_Event") == 2) then
		player:startEvent(0x0000);
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
	
	if (csid == 0x0000) then
		player:setVar("TheOldMonument_Event",3);
	end
end;