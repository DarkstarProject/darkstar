-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Fallen Knight
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,619,1);
end;
