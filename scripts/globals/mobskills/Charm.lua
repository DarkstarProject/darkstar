---------------------------------------------------
-- Charm
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_CHARM_I;
	local power = 0;

    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 150)
    if (msg == MSG_ENFEEB_IS) then
        mob:charm(target);
    end
    skill:setMsg(msg);

    return typeEffect;
end;
