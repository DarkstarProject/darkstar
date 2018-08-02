-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm2)
-- Note: Spawns NM Cancer
-- !pos -25.238 -12.785 -148.393 174
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 4514)) then
        if (not GetMobByID(ID.mob.CANCER):isSpawned() and not GetMobByID(ID.mob.CANCER + 1):isSpawned()) then
            player:confirmTrade();
            local mobId = (math.random(1,100) <= 7) and ID.mob.CANCER or ID.mob.CANCER + 1; -- Cancer has 7% chance to spawn, else Robber Crab.
            SpawnMob(mobId);
            npc:setStatus(dsp.status.DISAPPEAR);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.FISHBONES);
end;
