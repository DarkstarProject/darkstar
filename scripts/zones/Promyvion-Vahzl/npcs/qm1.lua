-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm1)
-- Notes: Spawn Deviator Floor 3
-- !pos 302.756 -2.244 -179.892 22
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(DEVIATOR):isSpawned() and npcUtil.tradeHas(trade, 1756)) then -- Cerebrator Remnant
        player:confirmTrade();
        player:messageSpecial(ON_NM_SPAWN);
        SpawnMob(DEVIATOR):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(POPPED_NM_OFFSET);
end;
