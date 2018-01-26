-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Goblin Shaman
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,129,2);
end;
