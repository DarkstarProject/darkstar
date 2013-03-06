---------------------------------------------------
-- Snatch Morsel
-- Steals food effect
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_FOOD;

        skill:setMsg(MSG_MISS); -- no effect

        local food = target:getStatusEffect(typeEffect);
        if (food ~= nil) then
            target:delStatusEffect(typeEffect);
            skill:setMsg(MSG_ENFEEB_IS);

            -- no way to add food to mobs yet
            -- if(mob:addStatusEffect(typeEffect, food:getPower(), 0, food:getDuration()/1000)) then
            -- end
		end

    return typeEffect;
end;
