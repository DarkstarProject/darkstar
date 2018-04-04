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
    local moon = VanadielMoonPhase();
    local buffvalue = 0;
    if moon > 90 then
        buffvalue = 31;
    elseif moon > 75 then
        buffvalue = 26;
    elseif moon > 60 then
        buffvalue = 21;
    elseif moon > 40 then
        buffvalue = 16;
    elseif moon > 25 then
        buffvalue = 11;
    elseif moon > 10 then
        buffvalue = 6;
    else
        buffvalue = 1;
    end
    target:delStatusEffect(dsp.effects.ACCURACY_DOWN);
    target:delStatusEffect(dsp.effects.EVASION_DOWN);
    target:addStatusEffect(dsp.effects.ACCURACY_DOWN,buffvalue,0,180);
    target:addStatusEffect(dsp.effects.EVASION_DOWN,32-buffvalue,0,180);
    skill:setMsg(msgBasic.NONE);
    return 0;
end