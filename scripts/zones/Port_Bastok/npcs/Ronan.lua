-----------------------------------
-- Area: Port Bastok
-- NPC: Ronan
-- Start & Finishes Quest: Out of One's Shell
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL) == QUEST_ACCEPTED and player:getVar("OutOfOneShell") == 0) then
		if (trade:hasItemQty(17397,3) and trade:getItemCount() == 3) then
			player:startEvent(0x0054);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	OutOfOneShell = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);

	if (OutOfOneShell == QUEST_ACCEPTED and player:getVar("OutOfOneShell") == 1) then
		if (player:needToZone()) then
			player:startEvent(0x0055);
		else
			player:startEvent(0x0056);
		end
	elseif (OutOfOneShell == QUEST_ACCEPTED) then
		player:showText(npc,RONAN_DIALOG_1);
	elseif (OutOfOneShell == QUEST_COMPLETED) then
		player:startEvent(0x0059);		
	elseif (player:getQuestStatus(BASTOK,THE_QUADAV_S_CURSE) == QUEST_COMPLETED and player:getFameLevel(BASTOK) >= 2) then
		player:startEvent(0x0052);
	else	
		player:startEvent(0x0025);
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

	if (csid == 0x0052) then
		player:addQuest(BASTOK,OUT_OF_ONE_S_SHELL);
	elseif (csid == 0x0054) then
		player:needToZone(true);
		player:setVar("OutOfOneShell",1);
		player:tradeComplete();
	elseif (csid == 0x0056) then
		if (player:getFreeSlotsCount() >= 1) then
			player:addTitle(SHELL_OUTER);
			player:setVar("OutOfOneShell",0);
			player:addItem(12501);
			player:messageSpecial(ITEM_OBTAINED,12501);
			player:addFame(BASTOK,BAS_FAME*120);
			player:completeQuest(BASTOK,OUT_OF_ONE_S_SHELL);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12501);
		end
	end

end;