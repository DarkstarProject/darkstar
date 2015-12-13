-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Butler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,749,1);
    checkGoVregime(ally,mob,752,1);
end;