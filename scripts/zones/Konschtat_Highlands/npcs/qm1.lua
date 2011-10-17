-----------------------------------
-- Area: Konschtat Highlands
-- NPC: qm1
-- Continues Quests: Past Perfect
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

PastPerfect = player:getQuestStatus(BASTOK,PAST_PERFECT);
PastPerfectVar = player:getVar("PastPerfectVar")
	if (PastPerfect == 1 and PastPerfectvar == 1) then
		player:setVar("PastPerfectVar",2);
		player:addKeyItem(0x6d);
		player:messageSpecial(KEYITEM_OBTAINED,0x6d);
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
end;



