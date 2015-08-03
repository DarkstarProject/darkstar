-----------------------------------
-- Area: Xarcabard
-- NPC:  qm3 (???)
-- Involved in Quests: Atop the Highest Mountains (for Boreal Coeurl)
-- @pos 580 -9 290 112
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
	local BorealCoeurl = GetMobAction(17236203);
	if ((OldSchoolG2 == false) or (BorealCoeurl == ACTION_NONE or BorealCoeurl == ACTION_SPAWN)) then
		if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and player:hasKeyItem(SQUARE_FRIGICITE) == false) then
			player:addKeyItem(SQUARE_FRIGICITE);
			player:messageSpecial(KEYITEM_OBTAINED, SQUARE_FRIGICITE);
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