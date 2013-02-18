---------------------------------------------
--  Auroral Drape
--
--  Description: Silence and Blind Area of Effect (10.0')
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
    local typeEffect = EFFECT_SILENCE;
    local silenced = false;
    local blinded = false;

    if(target:hasStatusEffect(EFFECT_SILENCE) == false) then
        silenced = true;
        target:addStatusEffect(EFFECT_SILENCE,1,0,60);
    end

    if(target:hasStatusEffect(EFFECT_BLINDNESS) == false) then
        blinded = true;
        target:addStatusEffect(EFFECT_BLINDNESS,20,0,120);
    end

    skill:setMsg(MSG_ENFEEB_IS);

    -- display silenced first, else blind
    if(silenced == true) then
        typeEffect = EFFECT_SILENCE;
    elseif(blinded == true) then
        typeEffect = EFFECT_BLINDNESS;
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return typeEffect;
end;
