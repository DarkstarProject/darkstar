---------------------------------------------
--  Murk
--
--  Description: Slow and Weight Area of Effect (10.0')
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local message = MSG_MISS;
    local typeEffect = EFFECT_SLOW;
    local slowed = false;
    local weighted = false;

    if(target:hasStatusEffect(EFFECT_SLOW) == false) then
        slowed = true;
        target:delStatusEffect(EFFECT_HASTE);
        target:addStatusEffect(EFFECT_SLOW,512,0,60);
    end

    if(target:hasStatusEffect(EFFECT_WEIGHT) == false) then
        weighted = true;
        target:addStatusEffect(EFFECT_WEIGHT,40,0,60);
    end

    skill:setMsg(MSG_ENFEEB_IS);

    -- display slowed first, else blind
    if(slowed == true) then
        typeEffect = EFFECT_SLOW;
    elseif(weighted == true) then
        typeEffect = EFFECT_WEIGHT;
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return typeEffect;
end;
