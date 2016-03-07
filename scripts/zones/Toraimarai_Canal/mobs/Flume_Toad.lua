-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Flume Toad
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,625,1);
end;
