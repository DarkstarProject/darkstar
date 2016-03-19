-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Dark Aspic
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,619,3);
    checkGoVregime(ally,mob,620,1);
end;
