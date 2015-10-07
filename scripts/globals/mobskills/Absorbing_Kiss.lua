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

    -- str down - chr down
    local effectType = math.random(136, 142);

    skill:setMsg(MobDrainAttribute(mob, target, effectType, 10, 3, 120));

    return 1;
end;
