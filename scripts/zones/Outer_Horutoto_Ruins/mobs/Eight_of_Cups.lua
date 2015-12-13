-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,667,1);
end;