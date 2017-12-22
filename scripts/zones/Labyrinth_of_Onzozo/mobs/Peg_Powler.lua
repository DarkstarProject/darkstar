----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Peg Powler
-----------------------------------
require("scripts/globals/groundsofvalor");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,774,1);
end;

function onMobDespawn(mob)
end;
