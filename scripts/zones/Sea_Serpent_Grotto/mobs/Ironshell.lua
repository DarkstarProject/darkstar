-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Ironshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,805,1);
end;