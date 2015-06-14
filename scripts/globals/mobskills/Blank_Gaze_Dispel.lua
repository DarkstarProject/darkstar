---------------------------------------------------
-- Blank Gaze
-- Gaze dispel
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local effect = 0;
    if(target:isFacing(mob)) then

        effect = target:dispelStatusEffect();

        if(effect == EFFECT_NONE) then
            skill:setMsg(MSG_NO_EFFECT); -- no effect
        else
            skill:setMsg(MSG_DISAPPEAR);
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    return effect;
end
