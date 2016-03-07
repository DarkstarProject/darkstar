-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Poroggo Excavator
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,625,2);
end;
