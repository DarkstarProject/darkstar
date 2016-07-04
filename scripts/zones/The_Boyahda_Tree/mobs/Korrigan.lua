-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Korrigan
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,722,1);
end;