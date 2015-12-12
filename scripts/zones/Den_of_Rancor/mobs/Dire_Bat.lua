-----------------------------------
-- Area: Den of Rancor
--  MOB: Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,796,1);
    checkGoVregime(ally,mob,797,1);
end;