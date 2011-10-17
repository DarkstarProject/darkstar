-----------------------------------
-- Area: Port Bastok
-- NPC: Evi
-- Starts Quests: Past Perfect (100%)
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

PastPerfect = player:getQuestStatus(BASTOK,PAST_PERFECT);
PastPerfectVar = player:getVar("PastPerfectVar");

	if (PastPerfect == 0) then
		player:startEvent(0x0082);
	elseif (PastPerfect == 1 and PastPerfectVar == 2) then
		player:startEvent(0x0083);
	else
		player:startEvent(0x0015);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0082) then
		player:addQuest(BASTOK,PAST_PERFECT);
		player:setVar("PastPerfectVar",1);
	elseif (csid == 0x0083) then
		player:delKeyItem(0x6d);
		player:completeQuest(BASTOK,PAST_PERFECT);
		player:addFame(BASTOK,BAS_FAME*110);
		player:addItem(12560);
		player:messageSpecial(ITEM_OBTAINED,12560);
	end
	
end;



