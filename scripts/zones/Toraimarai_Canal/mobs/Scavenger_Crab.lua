-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Scavenger Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,621,1);
end;
