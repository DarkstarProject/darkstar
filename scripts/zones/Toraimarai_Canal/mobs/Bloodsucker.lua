-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Bloodsucker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,620,2);
end;
