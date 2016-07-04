-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Viseclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,726,1);
end;