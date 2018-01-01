-----------------------------------
-- Area: Xarcabard
-- NPC:  qm1 (???)
-- Involved in Quests: The Three Magi
-- !pos -331 -29 -49 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs");
require("scripts/zones/Xarcabard/MobIDs");
require("scripts/globals/quests");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,THE_THREE_MAGI) == QUEST_ACCEPTED and not player:hasItem(1104)) then
        if (trade:hasItemQty(613,1) and trade:getItemCount() == 1) then -- Trade Faded Crystal
            player:tradeComplete();
            SpawnMob(CHAOS_ELEMENTAL):updateClaim(player);
            npc:setStatus(STATUS_DISAPPEAR);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
