-----------------------------------
-- Area: Port Bastok
-- NPC:  Ensetsu
-- Finish Quest: Ayame and Kaede
-- @zone 236
-- @pos 33 -6 67
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 1) then
		
		questStatus = player:getVar("AyameAndKaede_Event")
		
		if((questStatus == 1 or questStatus == 2) and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
			player:startEvent(0x00f2);
		elseif(questStatus == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == true) then
			player:startEvent(0x00f5);
		elseif(questStatus == 3) then
			player:startEvent(0x00f3);
		elseif(player:hasKeyItem(SEALED_DAGGER)) then
			player:startEvent(0x00f6,SEALED_DAGGER);
		end
	elseif(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_COMPLETED) then
		player:startEvent(0x00f7);
	else
		player:startEvent(0x001b);
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

	if(csid == 0x00f2) then
		player:setVar("AyameAndKaede_Event", 2);
	elseif(csid == 0x00f5) then
		player:setVar("AyameAndKaede_Event", 3);
	elseif(csid == 0x00f6) then
		player:delKeyItem(SEALED_DAGGER);
		player:setTitle(SHADOW_WALKER);
		player:unlockJob(13);
		player:messageSpecial(UNLOCK_NINJA); -- You can now become a Ninja
		player:setVar("AyameAndKaede_Event", 0);
		player:addFame(BASTOK, BAS_FAME*30);
		player:completeQuest(BASTOK,AYAME_AND_KAEDE);
	end
	
end;