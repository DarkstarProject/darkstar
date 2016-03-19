-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Lich
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,619,2);
end;
