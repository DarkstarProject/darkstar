-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Goblin Hunter
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,137,1);
end;
