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

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,630,2);
end;
