---------------------------------------------
--
-- Grace of Hera
--
-- Grants a Regen effect and removes
-- harmful status effects.
--
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (target:eraseStatusEffect()) then
        skill:setMsg(MSG_DISAPPEAR);
    end
    skill:setMsg(MobBuffMove(mob, EFFECT_REGEN, 25, 0, 120));
    return EFFECT_REGEN;
end;