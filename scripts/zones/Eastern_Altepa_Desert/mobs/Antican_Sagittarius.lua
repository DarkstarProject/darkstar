-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Sagittarius
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,112,2);
end;
