-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Feeler Antlion
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 40); -- Don't know exact value
    mob:addMod(MOD_REGEN, 30);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("SAND_BLAST",1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;