-----------------------------------
-- Area: Windurst Woods
-- NPC: Wetata
-- Trust Starter
-------------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs");
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
	
	--0x0363 - quest starter but not first
	if (Level >= 5 and TrustWindurst == QUEST_AVAILABLE and (TrustBastok == QUEST_COMPLETED or TrustSandoria == QUEST_COMPLETED)) then
		player:startEvent(0x0363);
		
	--0x035f - quest starter
	elseif (Level >= 5 and TrustWindurst == QUEST_AVAILABLE and TrustBastok == QUEST_AVAILABLE and TrustSandoria == QUEST_AVAILABLE) then
		player:startEvent(0x035f);
	
	--0x0360 - accept quest(directions)
	elseif (player:hasKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD)) then
		player:startEvent(0x0360);
	
	--0x035d - complete quest
	elseif (TrustWindurst == QUEST_COMPLETED) then
		player:startEvent(0x035d);
	else
		--0x0364 - Intro
		player:startEvent(0x0364);
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option1);
	if ((csid == 0x035f or csid == 0x0363) and option == 2) then
		player:addKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD);
		player:addQuest(WINDURST,TRUST_WINDURST);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.GREEN_INSTITUTE_CARD);
    end
end;







--0x035e - acquring a trust
--0x0385 - ARK Angel trust
--0x0386 - cant read cipher
