-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm1)
-- Notes: Spawn Deviator Floor 3
-- !pos 302.756 -2.244 -179.892 22
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1756,1) and trade:getItemCount() == 1) then -- Cerebrator Remnant
        player:tradeComplete();
        player:messageSpecial(ON_NM_SPAWN);
        SpawnMob(16867455):updateClaim(player); -- Spawn Deviator
        npc:setStatus(STATUS_DISAPPEAR);
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(POPPED_NM_OFFSET);
end;