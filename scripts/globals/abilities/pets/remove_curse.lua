---------------------------------------------
-- Remove Curse
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(dsp.effects.CURSE_I)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = dsp.effects.CURSE_I
    elseif (target:delStatusEffect(dsp.effects.DOOM)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = dsp.effects.DOOM
    else
        skill:setMsg(msgBasic.JA_NO_EFFECT);
    end

    return effect;
end
