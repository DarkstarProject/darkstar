-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Snaggletooth Peapuk
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,726,2);
end;