-----------------------------------
-- Area: Lufaise Meadows
--  NPC: ??? - Kurrea spawn
-- !pos -249.320 -16.189 41.497 24
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(5210,1) and trade:getItemCount() == 1) then -- Adamantoise Soup
        player:tradeComplete();
        SpawnMob(16875778):updateClaim(player); -- Kurrea
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
end;