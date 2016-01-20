---------------------------------------------------
-- Dissipation
-- Dispels all buffs add terror effect
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10)
    
    local count = target:dispelAllStatusEffect();

    if (count == 0) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        skill:setMsg(MSG_DISAPPEAR_NUM);
    end

    return count;
end