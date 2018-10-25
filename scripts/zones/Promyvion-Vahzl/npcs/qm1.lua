-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm1)
-- Notes: Spawn Deviator Floor 3
-- !pos 302.756 -2.244 -179.892 22
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.DEVIATOR):isSpawned() and npcUtil.tradeHas(trade, 1756)) then -- Cerebrator Remnant
        player:confirmTrade();
        player:messageSpecial(ID.text.ON_NM_SPAWN);
        SpawnMob(ID.mob.DEVIATOR):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.POPPED_NM_OFFSET);
end;
