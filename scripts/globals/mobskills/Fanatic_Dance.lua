---------------------------------------------------
--  Fanatic Dance
--
--  Description: Charms all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: N/A
--  Range: AoE around user
--  Notes:
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:isInDynamis() and mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CHARM_I;
    local msg = MobStatusEffectMove(mob, target, typeEffect, 0, 0, 60);

    skill:setMsg(msg);
    mob:resetEnmity(target);

    return typeEffect;
end
