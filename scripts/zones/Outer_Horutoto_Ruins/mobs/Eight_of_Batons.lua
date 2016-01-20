-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,667,2);
end;