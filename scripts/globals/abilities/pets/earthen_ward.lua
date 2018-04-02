---------------------------------------------
-- Aerial Armor
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    target:delStatusEffect(dsp.effects.STONESKIN);
    local amount = pet:getMainLvl()*2 + 50;
    target:addStatusEffect(dsp.effects.STONESKIN,amount,0,900);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return dsp.effects.STONESKIN;
end