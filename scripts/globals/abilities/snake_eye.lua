-----------------------------------
-- Ability: Snake Eye
-- Your next roll will automatically be a 1.
-- Obtained: Corsair Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or the next usage of Phantom Roll or Double-Up
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effects.SNAKE_EYE,(player:getMerit(MERIT_SNAKE_EYE) - 5),0,60);

    return dsp.effects.SNAKE_EYE;
end;