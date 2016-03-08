require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/1000); --base is around 5~150 level depending
    local typeEffect = EFFECT_STONESKIN;
    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 300));
    return typeEffect;
end;
