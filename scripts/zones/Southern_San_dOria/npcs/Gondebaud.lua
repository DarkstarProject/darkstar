-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Gondebaud
-- Trust Starter
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
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
	
	if (Level >= 5 and TrustSandoria == QUEST_AVAILABLE and (TrustBastok == QUEST_COMPLETED or TrustWindurst == QUEST_COMPLETED)) then
		player:startEvent(0x0db0);
	elseif (Level >= 5 and TrustSandoria == QUEST_AVAILABLE and TrustBastok == QUEST_AVAILABLE and TrustWindurst == QUEST_AVAILABLE) then
		player:startEvent(0x0dac);
	elseif (player:hasKeyItem(dsp.keyItem.RED_INSTITUTE_CARD)) then
		player:startEvent(0x0dad);	
	elseif (TrustSandoria == QUEST_COMPLETED) then
		player:startEvent(0x0dae);
	else
		player:startEvent(0x0db1);
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
	if ((csid == 0x0dac or csid == 0x0db0) and option == 2) then
		player:addKeyItem(dsp.keyItem.RED_INSTITUTE_CARD);
		player:addQuest(SANDORIA,TRUST_SANDORIA);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.RED_INSTITUTE_CARD);
    end
end;
