---------------------------------------------------
-- Shuffle
-- Dispels a single buff at random (which could be food)<-Pending verification. It does not reset hate.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local effect = target:dispelStatusEffect();

    if (effect == EFFECT_NONE) then
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end
    return effect;
end