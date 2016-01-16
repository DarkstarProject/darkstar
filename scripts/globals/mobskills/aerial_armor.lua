require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

   local typeEffect = EFFECT_BLINK;

    skill:setMsg(MobBuffMove(mob, typeEffect, 3, 0, 180));

    return typeEffect;

end
