-----------------------------------
-- Area: Port Bastok
-- NPC: Qiji
-- Starts & Ends Quest: Forever to Hold
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/titles");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

 count = trade:getItemCount();
 BrassHairpin = trade:hasItemQty(BRASS_HAIRPIN,1);
 
	if (BrassHairpin == true and count == 1) then
		questStatus = player:getVar("ForevertoHold_Event");
			if (questStatus == 1) then
				player:startEvent(0x7c);
				player:setVar("ForevertoHold_Event",2);
			end
	end
		
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 pFame = player:getFameLevel(BASTOK);
 ForevertoHold = player:getQuestStatus(BASTOK,FOREVER_TO_HOLD);
 questStatus = player:getVar("ForevertoHold_Event");

 	if (pFame >= 2 and ForevertoHold == 0) then
		player:startEvent(0x7B);
	elseif (ForevertoHold == 1 and questStatus == 3) then
		player:startEvent(0x7e);
	else
		player:startEvent(0x21);
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

	if (csid == 0x7b) then
		player:addQuest(BASTOK,FOREVER_TO_HOLD);
		player:setVar("ForevertoHold_Event",1);
	elseif (csid == 0x7e) then
		player:completeQuest(BASTOK,FOREVER_TO_HOLD);
		player:addFame(BASTOK,BAS_FAME*80);
		player:setTitle(89);
		player:addGil(GIL_RATE*300);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
	end
	
end;




