-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Patripatan
-----------------------------------
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,63,1);
end;

function onMobDespawn(mob)
end;
