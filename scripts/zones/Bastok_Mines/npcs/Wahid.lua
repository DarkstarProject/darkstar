-----------------------------------
-- Area: Bastok Mines
-- NPC: Wahid
-- Start & Finishes Quest: The Siren's Tear
-- @zone: 234
-- @pos: 26.305 -1 -66.403
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);
hasSirensTear = trade:hasItemQty(576,1);
count = trade:getItemCount();
gil = trade:getGil();

	if (SirensTear == QUEST_ACCEPTED and hasSirensTear and count == 1 and gil == 0) then
		player:startEvent(0x0052);
	end		
			
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);
	
	if (SirensTear == QUEST_AVAILABLE) then
		player:startEvent(0x0051);
	else 
		player:startEvent(0x001c);
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
	
	if (csid == 0x0051) then
		player:addQuest(BASTOK,THE_SIREN_S_TEAR);
	elseif (csid == 0x0052) then
		player:tradeComplete();
		player:completeQuest(BASTOK,THE_SIREN_S_TEAR);
		player:addFame(BASTOK,BAS_FAME*120);
		player:addGil(150);
		player:messageSpecial(GIL_OBTAINED,150);
		player:setTitle(TEARJERKER);
		player:setVar("SirensTear",0);
	end
		
end;