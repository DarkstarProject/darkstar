-----------------------------------
-- Area: Xarcabard
-- NPC:  qm4 (???)
-- Involved in Quests: Atop the Highest Mountains
-- @pos -21 -25 -490 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local BorealHound = GetMobAction(17236202);
	if ((OldSchoolG2 == false) or (BorealHound == ACTION_NONE or BorealHound == ACTION_SPAWN)) then
		if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and player:hasKeyItem(TRIANGULAR_FRIGICITE) == false) then
			player:addKeyItem(TRIANGULAR_FRIGICITE);
			player:messageSpecial(KEYITEM_OBTAINED, TRIANGULAR_FRIGICITE);
		else
			player:messageSpecial(ONLY_SHARDS);
		end
	else
		player:messageSpecial(ONLY_SHARDS);
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
end;