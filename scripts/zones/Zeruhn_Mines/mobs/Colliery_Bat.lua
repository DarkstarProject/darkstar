-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Colliery Bat
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
    checkGoVregime(player,mob,628,1);
    checkGoVregime(player,mob,629,1);
    checkGoVregime(player,mob,630,1);
end;
