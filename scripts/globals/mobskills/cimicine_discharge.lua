---------------------------------------------
-- Cimicine Discharge
-- Reduces the attack speed of enemies within range.
-- Duration: Variable, with max of 3 min
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.SLOW;
    local power = 200;
    local duration = math.random(60,180);

    if (mob:hasStatusEffect(dsp.effects.HASTE) == false) then
        mob:addStatusEffect(dsp.effects.HASTE,150,0,duration)
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

    return typeEffect;

    --[[ Is there suppsoed to be a message about haste?
    local typeEffect = dsp.effects.HASTE;
    skill:setMsg(MobBuffMove(mob, typeEffect, 150, 0, duration));
    return typeEffect;
    ]]--
end