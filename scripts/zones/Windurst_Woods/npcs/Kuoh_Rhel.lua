-----------------------------------
--  Area: Windurst Woods
--   NPC: Kuoh Rhel
--  Type: Standard NPC
-- @zone: 241
--  @pos: 131.437 -6 -102.723
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--player:delQuest(WINDURST,CHOCOBILIOUS);
	chocobilious = player:getQuestStatus(WINDURST,CHOCOBILIOUS);
	wFame = player:getFameLevel(WINDURST);
	chocoVar = player:getVar("ChocobiliousQuest");
	
	if (chocobilious == QUEST_AVAILABLE and wFame >= 2) then 
		player:startEvent(0x00e0); -- Start quest
	elseif (chocobilious == QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x00e8); -- Quest complete
	elseif (chocobilious == QUEST_ACCEPTED and chocoVar == 2) then
		player:startEvent(0x00e7); -- Talked to Tapoh
	elseif (chocobilious == QUEST_ACCEPTED) then
		player:startEvent(0x00e1); -- Post quest accepted
	else
		player:startEvent(0x00de); -- default cs
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
printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x00e0 and option == 1) then
		player:addQuest(WINDURST,CHOCOBILIOUS);
	elseif (csid == 0x00e7) then
		player:completeQuest(WINDURST,CHOCOBILIOUS);
		player:addFame(WINDURST,WIN_FAME*220);
		player:addGil(GIL_RATE*1500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
		player:tradeComplete();
		player:setVar("ChocobiliousQuest",0)
		player:needToZone(true); 
	end
end;
