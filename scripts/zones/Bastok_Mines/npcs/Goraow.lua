-----------------------------------
-- Area: Bastok Mines
-- NPC: Goraow
-- Starts Quests: Vengeful Wrath
-- @zone 234
-- @pos 38 0 14
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	Vengeful = player:getQuestStatus(BASTOK, VENGEFUL_WRATH);

	if (Vengeful ~= QUEST_AVAILABLE) then
		QuadavHelm = trade:hasItemQty(501,1);
		if (QuadavHelm == true and trade:getItemCount() == 1) then
			player:startEvent(0x006b);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	Vengeful = player:getQuestStatus(BASTOK,VENGEFUL_WRATH);
	Fame = player:getFameLevel(BASTOK);
	
	if (Vengeful == QUEST_AVAILABLE and Fame >= 3) then
		player:startEvent(0x006a);
	else
		player:startEvent(0x0069);
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

	if (csid == 0x006a) then
		player:addQuest(BASTOK, VENGEFUL_WRATH);
	elseif (csid == 0x006b) then
		Vengeful = player:getQuestStatus(BASTOK, VENGEFUL_WRATH);
		if (Vengeful == QUEST_ACCEPTED) then
			player:addTitle(95);
			player:addFame(BASTOK,BAS_FAME*120);
		else
			player:addFame(BASTOK,BAS_FAME*8);
		end
		player:tradeComplete();
		player:addGil(GIL_RATE*900);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
		player:completeQuest(BASTOK, VENGEFUL_WRATH); -- for save fame
	end
end;




