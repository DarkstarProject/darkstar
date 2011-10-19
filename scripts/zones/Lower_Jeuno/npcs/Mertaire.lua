-----------------------------------
-- Area: Lower Jeuno
-- NPC: Mertaire
-- Starts Quest: The Old Monument
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(JEUNO, THE_OLD_MONUMENT) == 2) then
		count = trade:getItemCount();
		gil = trade:getGil();
		
		if (trade:hasItemQty(POETIC_PARCHMENT,1) == true and count == 1 and gil == 0) then
			player:startEvent(0x0065);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getMainLvl() >= 30) then
		if (player:getVar("TheOldMonument_Event") == 0 and player:getQuestStatus(JEUNO,THE_OLD_MONUMENT) == 0) then
			player:startEvent(0x0066);
		end
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

	if (csid == 0x0066 and option == 0) then
		player:setVar("TheOldMonument_Event",1);
	elseif (csid == 0x0065) then
		player:tradeComplete();
		player:completeQuest(JEUNO,A_MINSTREL_IN_DESPAIR);
		player:addGil(GIL_RATE*2100);
		player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
		player:addFame(BASTOK,BAS_FAME*10);
		player:addFame(SAN_D_ORIA,SAN_FAME*10);
		player:addFame(WINDURST,WIN_FAME*10);
	end
end;

