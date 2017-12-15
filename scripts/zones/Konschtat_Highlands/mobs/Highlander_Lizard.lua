-----------------------------------
-- Area: Konschtat Highlands
--  NM:  Highlander Lizard
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobInitialize(mob)
    -- Higher TP Gain per melee hit than normal lizards.
    -- It is definitly NOT regain.
    mob:addMod(MOD_STORETP, 25); -- May need adjustment.

    -- Hits especially hard for his level, even by NM standards.
    mob:addMod(MOD_ATT, 50); -- May need adjustment along with cmbDmgMult in mob_pools.sql
end;

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    -- I think he still counts the FoV pages? Most NM's do not though.
    checkRegime(player,mob,20,2);
    checkRegime(player,mob,82,2);
end;

function onMobDespawn(mob)

    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(1200,1800)); -- 20~30 min repop
end;
