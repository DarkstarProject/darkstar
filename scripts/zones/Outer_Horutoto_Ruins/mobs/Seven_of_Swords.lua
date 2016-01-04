-----------------------------------
-- Area: Outer Horutoto
--  MOB: Seven of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,666,3);
end;