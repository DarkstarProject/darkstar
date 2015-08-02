-----------------------------------
--  Area: Upper Jeuno
--   NPC: Rhea Myuliah
--  Type: Standard NPC
-- @zone: 244
--  @pos -56.220 -1 101.805
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
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
	if(lakeProg >= 3) then
		player:startEvent(0x2784); 
	elseif(lakeProg == 2) then
		player:startEvent(0x2783); -- You danced! Here's your hint
		player:setVar("Lakeside_Minuet_Progress",3);
	elseif(lakeProg == 1) then
		player:startEvent(0x2782); -- After the CS
	elseif(lakesideMin == QUEST_ACCEPTED and lakeProg < 1)then
		player:startEvent(0x2781); -- intial CS
		player:setVar("Lakeside_Minuet_Progress",1);
	elseif(player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==1) then
		player:startEvent(0x2793);

	else
		player:startEvent(0x2789);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if (csid==0x2793) then
		player:setVar("QuestStatus_DNC_AF1", 2);
	end
end;

