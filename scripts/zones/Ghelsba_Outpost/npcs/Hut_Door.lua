-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Hut Door
-- Involved in Quest: The Holy Crest
-- @zone 141
-- @pos -162 -11 78
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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

	if(player:hasKeyItem(DRAGON_CURSE_REMEDY) == true or player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_COMPLETED) then
		player:startEvent(0x7D00,0,0,0,2);
	else
		player:startEvent(0x0002);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

	if(csid == 0x7D00 and option == 0) then
		if(player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_COMPLETED) then
			player:updateEvent(2,1,0,100,6,1);
		else
			player:updateEvent(2,1,0,100,6,0);
		end
	elseif(csid == 0x7D01) then
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

	if(csid == 0x7D00) then
		if(option == 17 or option == 101) then
			player:addStatusEffect(EFFECT_BATTLEFIELD,1,0,900,1);
			player:setVar("TheHolyCrest_Timer", os.time());
			player:setVar("TheHolyCrest_Killed",0);
			SpawnMob(17350928,900);
		end
	elseif(csid == 0x7D01) then
		TheHolyCrestComplete = player:getVar("TheHolyCrest_Complete");

		if((option >= 2147483617 and option <= 2147483647) or option == -(2147483648)) then
			player:setTitle(HEIR_TO_THE_HOLY_CREST);
			player:delKeyItem(DRAGON_CURSE_REMEDY);
			player:unlockJob(14);
			player:messageSpecial(UNLOCK_DRG);
			player:setVar("TheHolyCrest_Event",0);
			player:setVar("TheHolyCrest_Killed",0);
			player:setVar("TheHolyCrest_Complete",0);
			player:setVar("TheHolyCrest_Timer",0);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,THE_HOLY_CREST);
		elseif(option >= 1073741824 or option == 0) then
			player:setVar("TheHolyCrest_Killed",0);
			player:setVar("TheHolyCrest_Complete",0);
			player:setVar("TheHolyCrest_Timer",0);
		end
	end
	
end;