-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Lanista
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,138,2);
end;
