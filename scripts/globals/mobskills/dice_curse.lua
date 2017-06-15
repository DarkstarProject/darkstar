---------------------------------------------
--  Goblin Dice
--  Description: AoE curse.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CURSE_I;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 300));

    return typeEffect;
end;
