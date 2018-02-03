-----------------------------------
-- Area: Jugner Forest
--  MOB: Jugner Funguar
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,13,1);
    checkRegime(player,mob,14,1);
end;
