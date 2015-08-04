---------------------------------------------------
-- Manafont
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getHPP() <= 50) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PERFECT_DODGE;
    MobBuffMove(mob, typeEffect, 1, 0, 30);

    skill:setMsg(MSG_USES);
    return typeEffect;
end;
