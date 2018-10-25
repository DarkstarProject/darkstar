-----------------------------------
-- Area: Kuftal Tunnel
-- Mob: Robber Crab
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs");
require("scripts/globals/regimes")
require("scripts/globals/settings");
-----------------------------------

function onMobInitialize(mob)
    if (mob:getID() == ID.mob.CANCER + 1) then
        mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
    end
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 735, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 736, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 738, 1, dsp.regime.type.GROUNDS)
end;

function onMobDespawn(mob)
    if (mob:getID() == ID.mob.CANCER + 1) then
        GetNPCByID(ID.npc.CANCER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
