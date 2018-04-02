-----------------------------------------
-- ID: 16497
-- Item: Sleep Dagger
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        local duration = 25;
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,25);
        duration = duration * applyResistanceAddEffect(player,target,ELE_DARK,0);
        if (not target:hasStatusEffect(dsp.effects.SLEEP_I)) then
            target:addStatusEffect(dsp.effects.SLEEP_I, 1, 0, duration);
        end
        return SUBEFFECT_SLEEP, msgBasic.ADD_EFFECT_STATUS, dsp.effects.SLEEP_I;
    end
end;