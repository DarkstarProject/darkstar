-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ichorous_Ire
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.JELLYBANE);
end;