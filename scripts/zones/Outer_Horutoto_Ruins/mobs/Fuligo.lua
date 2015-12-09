-----------------------------------
-- Area: Outer Horutoto
--  MOB: Fuligo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,669,2);
    checkGoVregime(ally,mob,670,2);
end;