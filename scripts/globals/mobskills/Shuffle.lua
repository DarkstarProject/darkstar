---------------------------------------------------
-- Shuffle
-- Dispels a single buff at random which could be food. It does not reset hate.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

        local dis = target:dispelStatusEffect();
        local num = 0;

        if(dis ~= EFFECT_NONE) then
            num = num + 1;
        end

        skill:setMsg(MSG_DISAPPEAR);
        if(num == 0) then
            skill:setMsg(MSG_NO_EFFECT);
        end

        return num;
end