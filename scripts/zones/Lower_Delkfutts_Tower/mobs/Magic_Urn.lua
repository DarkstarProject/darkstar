-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Magic Urn
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,781,2);
end;