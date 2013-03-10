-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Ratihb
-- Standard Info NPC
-- @pos 75.225 -6.000 -137.203 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getQuestStatus(AHT_URHGAN,LUCK_OF_THE_DRAW) == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL) then		-- corsair job quest
		player:startEvent(0x0223);	

	elseif(player:getQuestStatus(AHT_URHGAN,THREE_MEN_AND_A_CLOSET) == QUEST_ACCEPTED and player:getVar("threemenandaclosetCS") == 4) then
		player:startEvent(0x0348);
	else
		player:startEvent(0x025B);	-- standard dialog
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

    if(csid == 0x0348) then
		player:setVar("threemenandaclosetCS",5);
	elseif(csid == 0x0223) then
		player:setVar("LuckOfTheDraw",1);
		player:addQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);	
	end
end;



