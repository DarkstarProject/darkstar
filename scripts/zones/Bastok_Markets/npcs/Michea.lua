-----------------------------------
-- Area: Bastok Markets
-- NPC: Michea
-- Quest NPC
-- Starts: Father Figure (100%) | The Elvaan Goldsmith (100%)
-- Involed in: Fetichism | Where Two Paths Converge
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
CopperIngot = trade:hasItemQty(648,1);
SilverIngot = trade:hasItemQty(744,1);

	if ((CopperIngot == true) and count == 1) then
		TheElvaanGoldsmith = player:getQuestStatus(BASTOK,THE_ELVAAN_GOLDSMITH);
		if (TheElvaanGoldsmith == 1) then
			player:tradeComplete();
			player:addGil(GIL_RATE*180);
			player:completeQuest(BASTOK,THE_ELVAAN_GOLDSMITH);
			player:addFame(BASTOK,BAS_FAME*100);
			player:startEvent(0x00d8);
		end
	elseif ((SilverIngot == true) and count == 1) then
		FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
		if (FatherFigure == 1) then
			player:tradeComplete();
			player:addGil(GIL_RATE*2200);
			player:completeQuest(BASTOK,FATHER_FIGURE);
			player:addFame(BASTOK,BAS_FAME*120);
			player:startEvent(0x00f1);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

pFame = player:getFameLevel(BASTOK);
FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
TheElvaanGoldsmith = player:getQuestStatus(BASTOK,THE_ELVAAN_GOLDSMITH);

	if (TheElvaanGoldsmith == 0) then
		player:startEvent(0x00d7);
	elseif (FatherFigure == 0 and TheElvaanGoldsmith == 2 and pFame >= 2) then
		player:startEvent(0x00f0);
	else
		player:startEvent(0x007d);
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
	
	if (csid == 0x00d7) then
		player:addQuest(BASTOK,THE_ELVAAN_GOLDSMITH);
	elseif (csid == 0x00f0) then
		player:addQuest(BASTOK,FATHER_FIGURE);
	elseif (csid == 0x00d8) then
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*180);
	elseif (csid == 0x00f1) then
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*2200);
	end
	
end;



