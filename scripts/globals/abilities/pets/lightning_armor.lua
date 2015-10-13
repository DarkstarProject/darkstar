---------------------------------------------------
--
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

    target:delStatusEffect(EFFECT_SHOCK_SPIKES);
    target:addStatusEffect(EFFECT_SHOCK_SPIKES,15,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_SHOCK_SPIKES;
end