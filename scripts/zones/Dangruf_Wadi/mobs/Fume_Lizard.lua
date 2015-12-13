-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Fume Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,642,1);
end;