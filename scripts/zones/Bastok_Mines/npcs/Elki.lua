-----------------------------------
-- Area: Bastok Mines
-- NPC: Elki
-- Starts Quests: Hearts of Mythril (100%) || The Eleventh's Hour (100%)
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Hearts = player:getQuestStatus(BASTOK,HEARTS_OF_MYTHRIL);
HeartsVar = player:getVar("HeartsOfMythril");
Elevenths = player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR);
EleventhsVar = player:getVar("EleventhsHour");
pFame = player:getFameLevel(BASTOK);

	
	if (Hearts == 0) then
		player:startEvent(0x0029);
	elseif (Hearts == 1 and HeartsVar == 2) then
		player:startEvent(0x002a);
	elseif (Hearts == 2 and Elevenths == 0 and pFame >=2) then
		player:startEvent(0x002b);
	elseif (Elevenths == 1 and EleventhsVar == 2) then
		player:startEvent(0x002c);
	else
		player:startEvent(0x001f);
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

	if (csid == 0x0029 and option == 0) then
		player:addQuest(BASTOK,HEARTS_OF_MYTHRIL);
		player:setVar("HeartsOfMythril",1);
		player:addKeyItem(0x17);
		player:messageSpecial(KEYITEM_OBTAINED,0x17);
	elseif (csid == 0x002a) then
		player:setTitle(84);
		player:addItem(12840);
		player:messageSpecial(ITEM_OBTAINED,12840);
		player:completeQuest(BASTOK,HEARTS_OF_MYTHRIL);
		player:addFame(BASTOK,BAS_FAME*80);
	elseif (csid == 0x002b) then
		player:addQuest(BASTOK,THE_ELEVENTH_S_HOUR);
		player:setVar("EleventhsHour",1);
	elseif (csid == 0x002c) then
		player:setVar("EleventhsHour",3);
	end
	
end;



