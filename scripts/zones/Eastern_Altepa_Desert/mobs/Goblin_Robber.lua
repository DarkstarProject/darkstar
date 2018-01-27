-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Robber
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,113,2);
end;
