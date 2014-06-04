-----------------------------------
-- Area: Bostaunieux Oubliette
-- MOB:  Nachtmahr
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,616,1);
end;
