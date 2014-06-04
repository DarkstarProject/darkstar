-----------------------------------
-- Area: Temple Of Uggalepih
-- MOB:  Temple Bee
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,790,2);
   checkGoVregime(killer,mob,793,2);
end;