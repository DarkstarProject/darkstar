---------------------------------------------------
--  Danse Macabre
-- 
--  Description: Charms a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: N/A
--  Range: Single target
--  Notes:
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CHARM_I;
    local msg = MobStatusEffectMove(mob, target, typeEffect, 0, 0, 60)

    skill:setMsg(msg);
    mob:resetEnmity(target);

    return typeEffect;
end
