-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,809,1);
    checkGoVregime(ally,mob,810,1);
end;