---------------------------------------------
-- Dispelling Wind
--
-- Description: Dispels two effects from targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
-- Notes:
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
    local dis1 = target:dispelStatusEffect();
    local dis2 = target:dispelStatusEffect();


    if (dis1 ~= dsp.effects.NONE and dis2 ~= dsp.effects.NONE) then
        skill:setMsg(msgBasic.DISAPPEAR_NUM);
        return 2;
    elseif (dis1 ~= dsp.effects.NONE or dis2 ~= dsp.effects.NONE) then
        -- dispeled only one
        skill:setMsg(msgBasic.DISAPPEAR_NUM);
        return 1;
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT); -- no effect
    end

    return 0;
end;
