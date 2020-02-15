-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Akbaba
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 31, 1, tpz.regime.type.FIELDS)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end
