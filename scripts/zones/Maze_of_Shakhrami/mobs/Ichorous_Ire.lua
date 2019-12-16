-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Ichorous Ire
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.JELLYBANE)
end