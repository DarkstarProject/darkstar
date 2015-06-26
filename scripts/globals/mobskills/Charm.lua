---------------------------------------------------
-- Charm
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_CHARM_I;
	local power = 0;

    if (not target:isPC()) then
        skill:setMsg(MSG_MISS);
        return typeEffect;
    end
    
    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 150)
    if (msg == MSG_ENFEEB_IS) then
        mob:charm(target);
    end
    skill:setMsg(msg);

    return typeEffect;
end;
