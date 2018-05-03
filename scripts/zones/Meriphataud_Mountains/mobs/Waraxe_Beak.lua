-----------------------------------
-- Area: Meriphataud Mountains (119)
--  NM:  Waraxe_Beak
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
    mob:setMobMod(dsp.mobMod.HP_STANDBACK, -1);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Waraxe_Beak's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));
end;
