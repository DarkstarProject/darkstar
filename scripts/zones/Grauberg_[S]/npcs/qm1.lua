-----------------------------------
--  Area: Grauberg [S]
--  NPC:  ???
--  Quest - DNC AF1
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/harvesting");
require("scripts/zones/Grauberg_[S]/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==2) then
		player:startEvent(0x0C);

	elseif(player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==3) then
		if (GetMobAction(17142108) == 0) then
			SpawnMob(17142108):updateEnmity(player);
		end

	elseif(player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==4) then
		player:startEvent(0x0D);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	if (csid==0x0C) then
		player:setVar("QuestStatus_DNC_AF1", 3);

	elseif(csid==0x0D) then
		player:addKeyItem(THE_ESSENCE_OF_DANCE);
		player:messageSpecial(KEYITEM_OBTAINED,THE_ESSENCE_OF_DANCE);
		player:setVar("QuestStatus_DNC_AF1", 5);
	end

end;