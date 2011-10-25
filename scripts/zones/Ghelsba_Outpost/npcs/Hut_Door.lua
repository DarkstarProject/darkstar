-----------------------------------
-- Area: Ghelsba Outpost
-- NPC: Hut Door
-- Involved in Quest: The Holy Crest
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
require("scripts/zones/Ghelsba_Outpost/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:hasKeyItem(DRAGON_CURSE_REMEDY) == false or player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 2) then
		player:startEvent(0x7D00,0,0,0,2);
	else
		player:startEvent(0x0002);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("onUpdate CSID: %u",csid);
printf("onUpdate RESULT: %u",option);

	if (csid == 0x7D00 and option == 0) then
		if (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 2) then
			player:updateEvent(2,1,0,100,6,1);
		else
			player:updateEvent(2,1,0,100,6,0);
		end
	elseif (csid == 0x7D01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
		player:setVar("TheHolyCrest_Complete",-(option));
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

	if (csid == 0x7D00) then
		if (option == 17 or option == 101) then
			player:addStatusEffect(EFFECT_BATTLEFIELD,1,0,900,1);
			player:setVar("TheHolyCrest_Timer", os.time());
			player:setVar("TheHolyCrest_Killed",0);
			SpawnMob(17350928,900);
		end
	elseif (csid == 0x7D01) then
		TheHolyCrestComplete = player:getVar("TheHolyCrest_Complete");

		if ((TheHolyCrestComplete >= 2147483617 and TheHolyCrestComplete <= 2147483647) or TheHolyCrestComplete == -(2147483648)) then
			player:completeQuest(SANDORIA,THE_HOLY_CREST);
			player:setTitle(HEIR_TO_THE_HOLY_CREST);
			player:unlockJob(14);
			player:messageSpecial(UNLOCK_DRG);
			player:addFame(SANDORIA, SAN_FAME*20);
			player:delKeyItem(DRAGON_CURSE_REMEDY);
			player:setVar("TheHolyCrest_Event",0);
			player:setVar("TheHolyCrest_Killed",0);
			player:setVar("TheHolyCrest_Complete",0);
			player:setVar("TheHolyCrest_Timer",0);
		elseif (option >= 1073741824 or option == 0) then
			player:setVar("TheHolyCrest_Killed",0);
			player:setVar("TheHolyCrest_Complete",0);
			player:setVar("TheHolyCrest_Timer",0);
		end
	end
end;

