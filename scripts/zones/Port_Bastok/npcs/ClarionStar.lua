-----------------------------------
-- Area: Port Bastok
-- NPC: Clarion Star
-- Trust Starter
-- !pos 83 7.5 -25 236
-- !cs 434 - start Trust quest (first)
-- !cs 435 - directions
-- !cs 436 - trust info
-- !cs 437 - trust trade
-- !cs 438 - start Trust quest (not the first)
-- !cs 442 - intro before quest start
-- !cs 443 - Moogle Quest
-- !cs 457 - cant read page
-- !cs 458 - ARK Angel cs
-------------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    TrustSandoria = player:getQuestStatus(SANDORIA,TRUST_SANDORIA);
	TrustBastok   = player:getQuestStatus(BASTOK,TRUST_BASTOK);
	TrustWindurst = player:getQuestStatus(WINDURST,TRUST_WINDURST);
	local Level = player:getMainLvl();
	
	-- !cs 438 - start Trust quest (not the first)
	if (Level >= 5 and TrustBastok == QUEST_AVAILABLE and (TrustSandoria == QUEST_COMPLETED or TrustWindurst == QUEST_COMPLETED)) then
		player:startEvent(438);
	
	-- !cs 434 - start Trust quest (first)	
	elseif (Level >= 5 and TrustBastok == QUEST_AVAILABLE and TrustSandoria == QUEST_AVAILABLE and TrustWindurst == QUEST_AVAILABLE) then
		player:startEvent(434);
	
	-- !cs 435 - directions
	elseif (player:hasKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD)) then
		player:startEvent(435);	
	
	-- !cs 436 - trust info
	elseif (TrustBastok == QUEST_COMPLETED) then
		player:startEvent(436);
	
	--!cs 442 - intro before quest start
	else
		player:startEvent(442);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	if ((csid == 438 or csid == 434) and option == 2) then
		player:addKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD);
		player:addQuest(BASTOK,TRUST_BASTOK);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.BLUE_INSTITUTE_CARD);
    end
end;
