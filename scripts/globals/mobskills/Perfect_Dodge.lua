---------------------------------------------------
-- Manafont
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 50) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PERFECT_DODGE;
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 30));
    return typeEffect;
end;
