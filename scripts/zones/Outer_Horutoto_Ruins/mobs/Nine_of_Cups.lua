-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Nine of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,668,1);
end;