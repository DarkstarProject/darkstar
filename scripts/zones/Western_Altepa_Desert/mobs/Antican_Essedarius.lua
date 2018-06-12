-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Essedarius
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,134,2);
end;
