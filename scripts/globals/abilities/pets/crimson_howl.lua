---------------------------------------------
-- Crimson Howl
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
    local duration = 60 + bonusTime;

    target:addStatusEffect(EFFECT_WARCRY,9,0,duration);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return EFFECT_WARCRY;
end