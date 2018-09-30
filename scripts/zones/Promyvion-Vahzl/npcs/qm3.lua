-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm3)
-- Notes: Spawn Provoker Floor 5
-- !pos -260.000 -0.003 72.000 22
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.PROVOKER):isSpawned() and npcUtil.tradeHas(trade, 1758)) then -- Satiator Remnant
        player:confirmTrade();
        player:messageSpecial(ID.text.ON_NM_SPAWN);
        SpawnMob(ID.mob.PROVOKER):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.POPPED_NM_OFFSET+2);
end;
