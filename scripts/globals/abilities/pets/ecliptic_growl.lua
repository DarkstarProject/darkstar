---------------------------------------------------
-- Ecliptic Growl
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

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
    target:delStatusEffect(EFFECT_STR_BOOST);
    target:delStatusEffect(EFFECT_DEX_BOOST);
    target:delStatusEffect(EFFECT_VIT_BOOST);
    target:delStatusEffect(EFFECT_AGI_BOOST);
    target:delStatusEffect(EFFECT_MND_BOOST);
    target:delStatusEffect(EFFECT_CHR_BOOST);

    target:addStatusEffect(EFFECT_STR_BOOST,buffvalue,0,duration);
    target:addStatusEffect(EFFECT_DEX_BOOST,buffvalue,0,duration);
    target:addStatusEffect(EFFECT_VIT_BOOST,buffvalue,0,duration);
    target:addStatusEffect(EFFECT_AGI_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(EFFECT_INT_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(EFFECT_MND_BOOST,8-buffvalue,0,duration);
    target:addStatusEffect(EFFECT_CHR_BOOST,8-buffvalue,0,duration);
    skill:setMsg(0);
    return 0;
end