-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Stygian Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,621,2);
end;
