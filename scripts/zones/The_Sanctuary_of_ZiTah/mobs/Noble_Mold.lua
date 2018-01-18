-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Noble Mold
-----------------------------------
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player, mob, 115, 1);
    checkRegime(player, mob, 116, 2);
end;

function onMobDespawn(mob)
end;
