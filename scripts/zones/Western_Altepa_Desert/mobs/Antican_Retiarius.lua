-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Retiarius
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,135,3);
end;
