-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourioche
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,720,1);
    checkGoVregime(player,mob,721,1);
end;