-----------------------------------
-- Area: Quicksand Caves
--  MOB: Antican Aedilis
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,812,2);
    checkGoVregime(ally,mob,813,2);
    checkGoVregime(ally,mob,814,2);
    checkGoVregime(ally,mob,815,1);
    checkGoVregime(ally,mob,816,2);
    checkGoVregime(ally,mob,817,2);
    checkGoVregime(ally,mob,818,2);
    checkGoVregime(ally,mob,819,2);
end;