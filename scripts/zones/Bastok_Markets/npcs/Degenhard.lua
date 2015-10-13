-----------------------------------
-- Area: Bastok Markets
-- NPC:  Degenhard
-- Starts & Ends Quest: The Bare Bones
-- Involved in Quests: Beat Around the Bushin
-- @zone 235
-- @pos -175 2 -135
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

 count = trade:getItemCount();
 BoneChip = trade:hasItemQty(880,1);

	if (BoneChip == true and count == 1) then
		BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);
		if (BareBones == 1) then
			player:tradeComplete();
			player:completeQuest(BASTOK,THE_BARE_BONES);
			player:startEvent(0x0102);
		end
	end
		
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);

	if (player:getVar("BeatAroundTheBushin") == 3) then
		player:startEvent(0x0156);
	elseif (BareBones == 0) then
		player:startEvent(0x0100);
	else
		player:startEvent(0x00ff);
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
	
	if (csid == 0x0156) then
		player:setVar("BeatAroundTheBushin",4);
	elseif (csid == 0x0100) then
		player:addQuest(BASTOK,THE_BARE_BONES);
	elseif (csid == 0x0102) then
		player:addKeyItem(0x188);
		player:messageSpecial(KEYITEM_OBTAINED,0x188);
		player:addFame(BASTOK,BAS_FAME*60);
	end
	
end;




