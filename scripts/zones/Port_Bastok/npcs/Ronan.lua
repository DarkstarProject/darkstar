-----------------------------------
-- Area: Port Bastok
-- NPC: Ronan
-- Start & Finishes Quest: Out of One's Shell
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

OutOfOneShell = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);
OutOfOneShellVar = player:getVar("OutOfOneShell");
	
	if (OutOfOneShell == QUEST_ACCEPTED and OutOfOneShellVar == 0) then
		count = trade:getItemCount();
		ShellBug = trade:hasItemQty(17397,3);
		
		if (ShellBug == true and count == 3) then
			player:startEvent(0x0054);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

OutOfOneShell    = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);
OutOfOneShellVar = player:getVar("OutOfOneShell");
TheQuadav = player:getQuestStatus(BASTOK,THE_QUADAV_S_CURSE);
Fame      = player:getFameLevel(BASTOK);

	if (OutOfOneShellVar == 1) then
		if (player:needToZone()) then
			player:startEvent(0x0055);
		else
			player:startEvent(0x0056);
		end
	elseif (OutOfOneShell == QUEST_ACCEPTED) then
		player:showText(npc,RONAN_DIALOG_1);
	elseif (OutOfOneShell == QUEST_COMPLETED) then
		player:startEvent(0x0059);		
	elseif (TheQuadav == QUEST_COMPLETED and Fame >= 2) then
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
		FreeSlots = player:getFreeSlotsCount();
		
		if (FreeSlots >= 1) then
			player:completeQuest(BASTOK,OUT_OF_ONE_S_SHELL);
			player:setVar("OutOfOneShell",0);
			player:addFame(BASTOK,BAS_FAME*120);
			player:addItem(12501);
			player:messageSpecial(ITEM_OBTAINED,12501);
			player:setTitle(SHELL_OUTER);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12501);
		end
	end

end;




