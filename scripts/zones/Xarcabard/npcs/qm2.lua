-----------------------------------
-- Area: Xarcabard
-- NPC:  qm2 (???)
-- Involved in Quests: Atop the Highest Mountains (for Boreal Tiger)
-- @pos 341 -29 370 112
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
    local BorealTiger = GetMobAction(17236204);
    if ((OldSchoolG2 == false) or (BorealTiger == ACTION_NONE or BorealTiger == ACTION_SPAWN)) then
        if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and player:hasKeyItem(ROUND_FRIGICITE) == false) then
            player:addKeyItem(ROUND_FRIGICITE);
            player:messageSpecial(KEYITEM_OBTAINED, ROUND_FRIGICITE);
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