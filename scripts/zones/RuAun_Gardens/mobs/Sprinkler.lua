-----------------------------------
-- Area: RuAun Gardens
--  Mob: Sprinkler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 142, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 143, 1, dsp.regime.type.FIELDS)
end;

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    return 212; -- burst

    -- -- Example of how you can select logical spells
    -- if (target:getMod(dsp.mod.UTSUSEMI) > 0) then
    --    return 189; -- stonega
    -- else
    --     return 212; -- burst
    -- end
end;
