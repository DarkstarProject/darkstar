-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Goblin Welldigger
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,137,1);
end;
