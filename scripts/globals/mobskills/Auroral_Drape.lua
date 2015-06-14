---------------------------------------------
--  Auroral Drape
--
--  Description: Silence and Blind Area of Effect (10.0')
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
    local silenced = false;
    local blinded = false;

    silenced = MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 60);

    blinded = MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 60, 0, 60);

    skill:setMsg(MSG_ENFEEB_IS);

    -- display silenced first, else blind
    if(silenced == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_SILENCE;
    elseif(blinded == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
    else
        skill:setMsg(MSG_MISS);
    end

    return typeEffect;
end;
