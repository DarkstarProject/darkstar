-----------------------------------
-- Area: The Celestial Nexus
--  MOB: Eald'Narche - Phase 2
-- Zilart Mission 16 BCNM Fight
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobInitialize(mob)
    -- 60% fast cast, -75% physical damage taken, 10tp/tick regain, no standback
    mob:addMod(MOD_UFASTCAST, 60);
    mob:addMod(MOD_UDMGPHYS, -75);
    mob:addMod(MOD_REGAIN, 100);
    mob:setMobMod(MOBMOD_HP_STANDBACK,-1);
end;

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_GA_CHANCE,25);
end;

function onMobFight(mob, target)
end;

function onMobDeath(mob, player, isKiller)
end;