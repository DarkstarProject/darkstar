---------------------------------------------
-- Ecliptic Growl
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(SKILL_SUM) - 300, 0, 200);
    local duration = 180 + bonusTime;

    local moon = VanadielMoonPhase();
    local buffvalue = 0;
    if moon > 90 then
        buffvalue = 7;
    elseif moon > 75 then
        buffvalue = 6;
    elseif moon > 60 then
        buffvalue = 5;
    elseif moon > 40 then
        buffvalue = 4;
    elseif moon > 25 then
        buffvalue = 3;
    elseif moon > 10 then
        buffvalue = 2;
    else
        buffvalue = 1;
    end
    target:delStatusEffect(dsp.effects.STR_BOOST);
    target:delStatusEffect(dsp.effects.DEX_BOOST);
    target:delStatusEffect(dsp.effects.VIT_BOOST);
    target:delStatusEffect(dsp.effects.AGI_BOOST);
    target:delStatusEffect(dsp.effects.MND_BOOST);
    target:delStatusEffect(dsp.effects.CHR_BOOST);

    target:addStatusEffect(dsp.effects.STR_BOOST,buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.DEX_BOOST,buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.VIT_BOOST,buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.AGI_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.INT_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.MND_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.CHR_BOOST,8-buffvalue,0,duration);
    skill:setMsg(msgBasic.NONE);
    return 0;
end