-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Starborer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,622,1);
end;
