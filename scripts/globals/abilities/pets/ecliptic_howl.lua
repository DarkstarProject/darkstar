---------------------------------------------
-- Aerial Armor
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
        buffvalue = 25;
    elseif moon > 75 then
        buffvalue = 21;
    elseif moon > 60 then
        buffvalue = 17;
    elseif moon > 40 then
        buffvalue = 13;
    elseif moon > 25 then
        buffvalue = 9;
    elseif moon > 10 then
        buffvalue = 5;
    else
        buffvalue = 1;
    end
    target:delStatusEffect(EFFECT.ACCURACY_BOOST);
    target:delStatusEffect(EFFECT.EVASION_BOOST);
    target:addStatusEffect(EFFECT.ACCURACY_BOOST,buffvalue,0,duration);
    target:addStatusEffect(EFFECT.EVASION_BOOST,25-buffvalue,0,duration);
    skill:setMsg(msgBasic.NONE);
    return 0;
end