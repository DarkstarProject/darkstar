-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Ironshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,805,1);
end;
