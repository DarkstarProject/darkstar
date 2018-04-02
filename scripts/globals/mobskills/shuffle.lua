---------------------------------------------
-- Shuffle
-- Dispels a single buff at random (which could be food)<-Pending verification. It does not reset hate.
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
    local effect = target:dispelStatusEffect();

    if (effect == dsp.effects.NONE) then
        skill:setMsg(msgBasic.SKILL_NO_EFFECT); -- no effect
    else
        skill:setMsg(msgBasic.SKILL_ERASE);
    end
    return effect;
end