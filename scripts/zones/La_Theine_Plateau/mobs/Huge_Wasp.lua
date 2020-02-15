-----------------------------------
-- Area: La Theine Plateau
--  Mob: Huge Wasp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 5, 2, tpz.regime.type.FIELDS)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end;
