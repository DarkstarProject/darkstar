---------------------------------------------
-- Dream Shroud
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
    local hour = VanadielHour();
    local buffvalue = 0;
    buffvalue = math.abs(12 - hour) + 1
    target:delStatusEffect(dsp.effects.MAGIC_ATK_BOOST);
    target:delStatusEffect(dsp.effects.MAGIC_DEF_BOOST);
    target:addStatusEffect(dsp.effects.MAGIC_ATK_BOOST,buffvalue,0,duration);
    target:addStatusEffect(dsp.effects.MAGIC_DEF_BOOST,14 - buffvalue,0,duration);
    skill:setMsg(msgBasic.NONE);
    return 0;
end
