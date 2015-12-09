-----------------------------------
-- Area: Den of Rancor
--  MOB: Tormentor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,802,1);
    checkGoVregime(ally,mob,803,1);
end;