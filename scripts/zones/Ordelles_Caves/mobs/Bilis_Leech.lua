-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Bilis Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,662,1);
end;