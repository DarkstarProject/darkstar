-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Deviling Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,622,2);
end;
