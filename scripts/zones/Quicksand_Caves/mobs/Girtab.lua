-----------------------------------
-- Area: Quicksand Caves
--  MOB: Girtab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,818,1);
end;