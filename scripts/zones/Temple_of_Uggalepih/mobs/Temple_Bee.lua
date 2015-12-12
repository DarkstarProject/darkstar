-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Temple Bee
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,790,2);
    checkGoVregime(ally,mob,793,2);
end;