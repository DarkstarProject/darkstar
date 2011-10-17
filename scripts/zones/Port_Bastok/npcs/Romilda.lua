-----------------------------------
-- Area: Port Bastok
-- NPC: Romilda
-- Involved in Quest: Forever to Hold
-- Starts & Ends Quest: Till Death Do Us Part
-----------------------------------

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
 CottonGloves = trade:hasItemQty(COTTON_GLOVES,1);
 
	if (BrassHairpin == true and count == 1) then
		questStatus = player:getVar("ForevertoHold_Event");
			if (questStatus == 2) then
				player:tradeComplete();
				player:startEvent(0x7D);
				player:setVar("ForevertoHold_Event",3);
			end
	elseif (CottonGloves == true and count == 1) then
		questStatus = player:getVar("ForevertoHold_Event");
			if (questStatus == 3) then
				player:tradeComplete();
				player:startEvent(0x81);
				player:setVar("ForevertoHold_Event",4);
			end
	end
		
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 pFame = player:getFameLevel(BASTOK);
 questStatus = player:getVar("ForevertoHold_Event");
 ForevertoHold = player:getQuestStatus(BASTOK,FOREVER_TO_HOLD);
 TilldeathdousPart = player:getQuestStatus(BASTOK,TILL_DEATH_DO_US_PART);
	
	if (pFame >= 3 and questStatus == 3 and ForevertoHold == 2 and TilldeathdousPart == 0) then
		player:startEvent(0x80);
	else
		player:startEvent(0x22);
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
	
	if (csid == 0x80) then
		player:addQuest(BASTOK,TILL_DEATH_DO_US_PART);
	elseif (csid == 0x81) then
		player:completeQuest(BASTOK,TILL_DEATH_DO_US_PART);
		player:addFame(BASTOK,BAS_FAME*160);
		player:setTitle(90);
		player:addGil(GIL_RATE*2000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*2000);
	end
			
end;



