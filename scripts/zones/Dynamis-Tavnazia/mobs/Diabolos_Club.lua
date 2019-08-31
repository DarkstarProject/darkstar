-----------------------------------
-- Area: Dynamis-Tavnazia
--  Mob: Diabolos Club
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
    player:addTitle(dsp.title.NIGHTMARE_AWAKENER)
end
