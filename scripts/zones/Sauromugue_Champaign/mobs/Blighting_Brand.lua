-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Blighting Brand
-----------------------------------
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,100,2);
end;

function onMobDespawn(mob)
end;
