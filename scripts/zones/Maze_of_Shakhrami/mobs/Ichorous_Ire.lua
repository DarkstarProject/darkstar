-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Ichorous_Ire
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.JELLYBANE)
end