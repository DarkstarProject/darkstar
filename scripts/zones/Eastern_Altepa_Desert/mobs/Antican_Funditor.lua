-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Funditor
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,111,1);
end;
