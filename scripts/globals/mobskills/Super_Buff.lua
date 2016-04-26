---------------------------------------------------
-- Spike Flail
-- Deals extreme damage in a threefold attack to targets behind the user.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    target:addStatusEffectEx(EFFECT_SUPER_BUFF, 0, 50, 0, 30);
    skill:setMsg(0);
    return 0;
end;
