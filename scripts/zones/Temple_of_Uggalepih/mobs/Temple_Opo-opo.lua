-----------------------------------
-- Area: Temple Of Uggalepih
-- MOB:  Temple Opo-opo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,792,2);
end;