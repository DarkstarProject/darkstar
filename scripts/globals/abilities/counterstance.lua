-----------------------------------
-- Ability: Counterstance
-- Increases chance to counter but lowers defense.
-- Obtained: Monk Level 45
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    local power = 45 + player:getMod(MOD_COUNTERSTANCE_EFFECT);

    target:delStatusEffect(dsp.effects.COUNTERSTANCE); --if not found this will do nothing
    target:addStatusEffect(dsp.effects.COUNTERSTANCE,power,0,300);
end;