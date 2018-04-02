-----------------------------------
-- Ability: Mantra
-- Increases the max. HP of party members within area of effect.
-- Obtainable: Monk Level 75
-- Recast Time: 0:10:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffect(EFFECT.MAX_HP_BOOST);

    local merits = player:getMerit(MERIT_MANTRA);

    target:addStatusEffect(EFFECT.MAX_HP_BOOST,merits,0,180);

    return EFFECT.MANTRA;
end;