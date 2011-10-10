-----------------------------------
-- Area: Port Bastok
-- NPC: Ensetsu
-- Involved in Quest: Ayame and Kaede (Ninja Flag Quest)
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
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
	if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 1) then
		questStatus = player:getVar("AyameAndKaede_Event")
		if ((questStatus == 1 or questStatus == 2) and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
			player:startEvent(0x00f2);
		elseif (questStatus == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == true) then
			player:startEvent(0x00f5);
		elseif (questStatus == 3) then
			player:startEvent(0x00f3);
		elseif (player:hasKeyItem(SEALED_DAGGER)) then
			player:startEvent(0x00f6,SEALED_DAGGER);
		end
	elseif (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 2) then
		player:startEvent(0x00f7);
	else

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

	if (csid == 0x00f2) then
		player:setVar("AyameAndKaede_Event", 2);
	elseif (csid == 0x00f5) then
		player:setVar("AyameAndKaede_Event", 3);
	elseif (csid == 0x00f6) then
		player:completeQuest(BASTOK,AYAME_AND_KAEDE);
		player:delKeyItem(SEALED_DAGGER);
		player:setTitle(SHADOW_WALKER);
		player:addFame(BASTOK, BAS_FAME*10);
		player:unlockJob(13);
		player:messageSpecial(UNLOCK_NINJA) -- You can now become a Ninja
		player:setVar("AyameAndKaede_Event", 0);
	end
end;
