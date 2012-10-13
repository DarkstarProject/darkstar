-----------------------------------
-- Area: Windurst Woods
-- NPC:  Parih Vashai
-- Starts and Finishes Quest: The Fanged One
-- @zone 241
-- @pos 117 -3 92
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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

	TheFangedOne = player:getQuestStatus(WINDURST,THE_FANGED_ONE);

	if(TheFangedOne ~= QUEST_COMPLETED) then
		if(TheFangedOne == QUEST_AVAILABLE) then
			player:startEvent(0x015f);
		elseif(TheFangedOne == QUEST_ACCEPTED and player:hasKeyItem(OLD_TIGERS_FANG) == false) then
			player:startEvent(0x0160);
		elseif(player:hasKeyItem(OLD_TIGERS_FANG) and player:getVar("TheFangedOne_Event") ~= 1) then
			player:startEvent(0x0165);
		elseif(player:getVar("TheFangedOne_Event") == 1) then
			player:startEvent(0x0166);
		end
	else
		player:startEvent(0x0152);
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

	if(csid == 0x015f) then
		player:addQuest(WINDURST,THE_FANGED_ONE);
	elseif(csid == 0x0165 or csid == 0x0166) then
        if(player:getFreeSlotsCount(0) >= 1 and player:hasItem(13117) == false) then
			player:delKeyItem(OLD_TIGERS_FANG);
			player:setVar("TheFangedOne_Event",0);
			player:setVar("TheFangedOne_Died",0);
			player:addTitle(THE_FANGED_ONE);
			player:addItem(13117);
			player:messageSpecial(ITEM_OBTAINED,13117);
			player:unlockJob(11);
			player:messageSpecial(PERIH_VASHAI_DIALOG);
			player:addFame(WINDURST, WIN_FAME* 30);
			player:completeQuest(WINDURST,THE_FANGED_ONE);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13117);
			player:setVar("TheFangedOne_Event",1);
		end
	end

end;
