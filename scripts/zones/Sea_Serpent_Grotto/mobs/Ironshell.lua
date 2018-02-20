-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Ironshell
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,805,1);
end;
