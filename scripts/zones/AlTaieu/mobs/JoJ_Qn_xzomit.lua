-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Jailor of Justice Pet version
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob, target)
    mob:useMobAbility(731); -- Mijin_Gakure
end;

function onMobDeath(mob, player, isKiller)
end;
