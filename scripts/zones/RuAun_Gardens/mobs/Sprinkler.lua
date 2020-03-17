-----------------------------------
-- Area: RuAun Gardens
--  Mob: Sprinkler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 142, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 143, 1, tpz.regime.type.FIELDS)
end;

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    return 212; -- burst

    -- -- Example of how you can select logical spells
    -- if (target:getMod(tpz.mod.UTSUSEMI) > 0) then
    --    return 189; -- stonega
    -- else
    --     return 212; -- burst
    -- end
end;
