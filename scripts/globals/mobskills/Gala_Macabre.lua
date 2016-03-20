---------------------------------------------------
--  Gala Macabre
--  Family: Corse
--  Description: Charms all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: N/A
--  Range: Radial
--  Notes: Only used by some notorious monsters like Xolotl and Giltine.
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
    local power = 0;

    if (not target:isPC()) then
        skill:setMsg(MSG_MISS);
        return typeEffect;
    end;

    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    if (msg == MSG_ENFEEB_IS) then
        mob:charm(target);
    end;
    skill:setMsg(msg);

    return typeEffect;
end
