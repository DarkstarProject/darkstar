---------------------------------------------
--  Murk
--
--  Description: Slow and Weight Area of Effect (10.0')
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
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

    local slowed = false;
    local weight = false;

    slowed = MobStatusEffectMove(mob, target, EFFECT_SLOW, 128, 0, 60);
    weight = MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 40, 0, 60);

    skill:setMsg(msgBasic.ENFEEB_IS);

    -- display slow first, else weight
    if (slowed == msgBasic.ENFEEB_IS) then
        typeEffect = EFFECT_SLOW;
    elseif (weight == msgBasic.ENFEEB_IS) then
        typeEffect = EFFECT_WEIGHT;
    else
        skill:setMsg(msgBasic.MISS);
    end

    return typeEffect;
end;
