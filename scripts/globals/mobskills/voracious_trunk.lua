---------------------------------------------------
-- Voracious Trunk
-- Steal one effect
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(MobDrainStatusEffectMove(mob, target));

    return 1;
end;
