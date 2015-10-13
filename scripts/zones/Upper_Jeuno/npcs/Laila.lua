-----------------------------------
--  Area: Upper Jeuno
--   NPC: Laila
--  Type: Job Quest Giver
-- @zone: 244
--  @pos -54.045 -1 100.996
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local lakesideMin = player:getQuestStatus(JEUNO,LAKESIDE_MINUET);
	local lakeProg = player:getVar("Lakeside_Minuet_Progress");
	if (lakesideMin == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL and ENABLE_WOTG == 1) then
		player:startEvent(0x277f); -- Start quest csid, asks for Key Item Stardust Pebble
	elseif (lakesideMin == QUEST_COMPLETED and player:needToZone()) then
		player:startEvent(0x2787);
	elseif (player:hasKeyItem(STARDUST_PEBBLE)) then
		player:startEvent(0x2786); -- Ends Quest
	elseif (lakeProg == 3) then
		player:startEvent(0x2781);
	elseif (lakesideMin == QUEST_ACCEPTED) then
		player:startEvent(0x2780) -- After accepting, reminder
	elseif ((player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_AVAILABLE or (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED and player:hasItem(19203)==false))
			and player:getMainJob()==JOB_DNC and player:getMainLvl()>=40) then

		player:startEvent(0x2791);

	elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==5 and player:seenKeyItem(THE_ESSENCE_OF_DANCE) and player:getMainJob()==JOB_DNC) then
		player:startEvent(0x2795);

	elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED) then
		player:startEvent(0x2796);

	elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED and player:getQuestStatus(JEUNO,THE_ROAD_TO_DIVADOM) == QUEST_AVAILABLE and player:getMainJob()==JOB_DNC) then
		player:startEvent(0x2798);

	else
		player:startEvent(0x2788); -- Default
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
	if (csid == 0x277f and option == 1) then
		player:addQuest(JEUNO,LAKESIDE_MINUET);
	elseif (csid == 0x2786) then
		player:setVar("Lakeside_Minuet_Progress",0);
		player:completeQuest(JEUNO,LAKESIDE_MINUET);
		player:addTitle(TROUPE_BRILIOTH_DANCER);
		player:unlockJob(19);
		player:messageSpecial(UNLOCK_DANCER);
		player:addFame(JEUNO, JEUNO_FAME*30);
		player:delKeyItem(STARDUST_PEBBLE);
		player:needToZone(true);
	elseif (csid==0x2791) then
		if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED) then
			player:delQuest(JEUNO,THE_UNFINISHED_WALTZ);
			player:delKeyItem(THE_ESSENCE_OF_DANCE);
		end
		player:addQuest(JEUNO,THE_UNFINISHED_WALTZ);
		player:setVar("QuestStatus_DNC_AF1", 1);

	elseif (csid==0x2795) then
		player:setVar("QuestStatus_DNC_AF1", 0);
		player:addItem(19203); -- war hoop
		player:messageSpecial(ITEM_OBTAINED,19203);
		player:completeQuest(JEUNO,THE_UNFINISHED_WALTZ);
	end
end;

