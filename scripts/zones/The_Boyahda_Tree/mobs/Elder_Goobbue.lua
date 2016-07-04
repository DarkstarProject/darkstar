-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Elder Goobbue
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,722,2);
end;