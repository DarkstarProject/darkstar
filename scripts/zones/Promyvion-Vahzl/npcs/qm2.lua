-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm2)
-- Notes: Spawn Wailer Floor 4
-- !pos 339.000 -1.883 144.000 22
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(WAILER):isSpawned() and npcUtil.tradeHas(trade, 1757)) then -- Coveter Remnant
        player:confirmTrade();
        player:messageSpecial(ON_NM_SPAWN);
        SpawnMob(WAILER):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(POPPED_NM_OFFSET+1);
end;
