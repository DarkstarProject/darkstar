-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Ambusher
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,84,1);
end;
