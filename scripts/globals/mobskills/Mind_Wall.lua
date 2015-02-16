---------------------------------------------
--  Mind Wall
--
--  Description: Absorbs Magic
--  Type: Buff
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_SHIELD;

    skill:setMsg(MobBuffMove(mob, typeEffect, 2, 0, 30));
    return typeEffect;
end;
