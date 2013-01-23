---------------------------------------------------
-- Horrid Roar
-- Dispels a single buff at random which could be food. It does not reset hate.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    local dispel =  target:dispelStatusEffect();

    if(dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end