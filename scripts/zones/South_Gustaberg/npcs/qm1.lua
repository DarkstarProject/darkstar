-----------------------------------
-- Area: South Gustaberg
-- NPC:  qm1 (???)
-- Involved in Quest: The Cold Light of Day
-- !pos  744 0 -671 107
-----------------------------------
package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/South_Gustaberg/TextIDs");
require("scripts/zones/South_Gustaberg/MobIDs");

function onTrade(player,npc,trade)
    if (
        (trade:hasItemQty(4514,1) or trade:hasItemQty(5793,1)) and
        trade:getItemCount() == 1 and trade:getGil() == 0 and
        not GetMobByID(BUBBLY_BERNIE):isSpawned()
    ) then
        player:tradeComplete();
        SpawnMob(BUBBLY_BERNIE);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(MONSTER_TRACKS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
