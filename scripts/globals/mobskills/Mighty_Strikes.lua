---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (skill:getParam() ~= 0) then
        return 1;
    elseif (mob:getHPP() <= 60) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MIGHTY_STRIKES;
    local duration = 45;
    if (skill:getParam() ~= 0) then
        duration = skill:getParam()
    end
    MobBuffMove(mob, typeEffect, 1, 0, duration);

    skill:setMsg(MSG_USES);

    return typeEffect;
end;
