-----------------------------------
-- Area: Xarcabard
-- NPC:  qm2 (???)
-- Involved in Quests: Atop the Highest Mountains (for Boreal Tiger)
-- !pos 341 -29 370 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs");
require("scripts/zones/Xarcabard/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (not OldSchoolG2 or GetMobByID(BOREAL_TIGER):isDead()) then
        if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and not player:hasKeyItem(ROUND_FRIGICITE)) then
            player:addKeyItem(ROUND_FRIGICITE);
            player:messageSpecial(KEYITEM_OBTAINED, ROUND_FRIGICITE);
        else
            player:messageSpecial(ONLY_SHARDS);
        end
    else
        player:messageSpecial(ONLY_SHARDS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
