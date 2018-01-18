---------------------------------------------
-- Charm
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CHARM_I;
    local power = 0;

    if (not target:isPC()) then
        skill:setMsg(msgBasic.SKILL_MISS);
        return typeEffect;
    end

    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 150)
    if (msg == msgBasic.SKILL_ENFEEB_IS) then
        mob:charm(target);
    end
    skill:setMsg(msg);

    return typeEffect;
end;
