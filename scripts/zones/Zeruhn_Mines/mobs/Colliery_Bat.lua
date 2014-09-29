-----------------------------------
--  Area: Zeruhn Mines (172)
--   Mob: Colliery Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    checkGoVregime(killer,mob,628,1);
    checkGoVregime(killer,mob,629,1);
    checkGoVregime(killer,mob,630,1);
end;
