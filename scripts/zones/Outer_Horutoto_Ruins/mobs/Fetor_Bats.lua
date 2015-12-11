-----------------------------------
-- Area: Outer Horutoto
--  MOB: Fetor Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,669,1);
end;