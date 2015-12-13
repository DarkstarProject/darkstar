-----------------------------------
-- Area: Den of Rancor
--  MOB: Bullbeggar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,803,2);
end;