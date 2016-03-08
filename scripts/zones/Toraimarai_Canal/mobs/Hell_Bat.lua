-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Hell Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,618,1);
end;
