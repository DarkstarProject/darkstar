-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Ironshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,805,1);
end;
