-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm2)
-- Notes: Spawn Wailer Floor 4
-- !pos 339.000 -1.883 144.000 22
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.WAILER):isSpawned() and npcUtil.tradeHas(trade, 1757)) then -- Coveter Remnant
        player:confirmTrade();
        player:messageSpecial(ID.text.ON_NM_SPAWN);
        SpawnMob(ID.mob.WAILER):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.POPPED_NM_OFFSET+1);
end;
