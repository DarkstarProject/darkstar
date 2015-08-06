---------------------------------------------------
-- Voracious Trunk
-- Steal one effect
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect = target:stealStatusEffect();
    local dmg = 0;

    if (effect ~= nil) then
        if (mob:hasStatusEffect(effect:getType()) == false) then
            -- add to myself
            mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
        end
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);

        dmg = 1;
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return dmg;
end;
