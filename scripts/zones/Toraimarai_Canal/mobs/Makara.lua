-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Makara
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,618,2);
end;
