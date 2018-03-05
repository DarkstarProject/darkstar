-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm3)
-- Notes: Spawn Provoker Floor 5
-- !pos -260.000 -0.003 72.000 22
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(PROVOKER):isSpawned() and npcUtil.tradeHas(trade, 1758)) then -- Satiator Remnant
        player:confirmTrade();
        player:messageSpecial(ON_NM_SPAWN);
        SpawnMob(PROVOKER):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(POPPED_NM_OFFSET+2);
end;
