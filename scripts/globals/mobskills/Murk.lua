---------------------------------------------
--  Murk
--
--  Description: Slow and Weight Area of Effect (10.0')
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local slowed = false;
    local weight = false;

    slowed = MobStatusEffectMove(mob, target, EFFECT_SLOW, 128, 0, 60);
    weight = MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 40, 0, 60);

    skill:setMsg(MSG_ENFEEB_IS);

    -- display slow first, else weight
    if (slowed == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_SLOW;
    elseif (weight == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_WEIGHT;
    else
        skill:setMsg(MSG_MISS);
    end

    return typeEffect;
end;
