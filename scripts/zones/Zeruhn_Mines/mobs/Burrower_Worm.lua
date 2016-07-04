----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Burrower Worm
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
    checkGoVregime(player,mob,629,2);
end;
