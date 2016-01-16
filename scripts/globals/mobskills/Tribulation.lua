---------------------------------------------
--  Tribulation
--
--  Description: Inflicts Bio and blinds all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: AoE
--  Notes: Bio effect can take away up to 39/tick.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local blinded = false;
    local bio = false;

    blinded = MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 20, 0, 120);
    bio = MobStatusEffectMove(mob, target, EFFECT_BIO, 39, 0, 120);

    skill:setMsg(MSG_ENFEEB_IS);

    -- display blind first, else bio
    if (blinded == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
    elseif (bio == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_BIO;
    else
        skill:setMsg(MSG_MISS);
    end

    return typeEffect;
end;
