-----------------------------------
-- Area: Beaucedine Glacier [S]
--  VNM: Lord Ruthven
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.RUTHVEN_ENTOMBER)
end