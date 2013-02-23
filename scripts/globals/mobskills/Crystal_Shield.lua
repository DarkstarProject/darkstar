---------------------------------------------------
-- Crystal Shield
-- Protect II
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local power = 40;
    local duration = 300;

    local typeEffect = EFFECT_PROTECT;

    if(mob:addStatusEffect(typeEffect, power, 0, duration)) then
        skill:setMsg(MSG_BUFF);
    else
        spell:setMsg(MSG_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
