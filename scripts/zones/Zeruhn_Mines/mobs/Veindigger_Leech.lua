-----------------------------------
--  Area: Zeruhn Mines (172)
--   Mob: Veindigger Leech
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
    checkGoVregime(killer,mob,630,2);
end;
