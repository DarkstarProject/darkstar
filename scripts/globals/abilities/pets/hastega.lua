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
    print(bonusTime)
    print(duration)

    -- Garuda's Hastega is a weird exception and uses 153 instead of 15%
    -- That's why it overwrites some things regular haste won't.
    target:addStatusEffect(EFFECT_HASTE,153,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_HASTE;
end