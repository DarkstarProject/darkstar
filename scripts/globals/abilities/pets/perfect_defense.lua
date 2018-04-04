---------------------------------------------
-- Perfect Defense
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local power = 100 * (master:getMP() / master:getMaxMP());
    duration = 60;
    if (master ~= nil) then
        local summoningSkill = master:getSkillLevel(SKILL_SUM);
        if (summoningSkill > 600) then
            summoningSkill = 600;
        end
        duration = 30 + summoningSkill / 20;
    end
    target:delStatusEffect(dsp.effects.PERFECT_DEFENSE);
    target:addStatusEffect(dsp.effects.PERFECT_DEFENSE,power,3,duration);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    master:setMP(0);
    return dsp.effects.PERFECT_DEFENSE;
end