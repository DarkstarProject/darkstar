-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Pygmytoise
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,770,2);
end;