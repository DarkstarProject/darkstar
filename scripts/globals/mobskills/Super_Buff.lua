---------------------------------------------------
-- Spike Flail
-- Deals extreme damage in a threefold attack to targets behind the user.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    target:addStatusEffectEx(EFFECT_SUPER_BUFF, 0, 50, 0, 30);
    skill:setMsg(0);
    return 0;
end;
