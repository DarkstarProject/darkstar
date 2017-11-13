---------------------------------------------
--  Tribulation
--
--  Description: Inflicts Bio and blinds all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: AoE
--  Notes: Bio effect can take away up to 39/tick.
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
    local blinded = false;
    local bio = false;

    blinded = MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 20, 0, 120);
    bio = MobStatusEffectMove(mob, target, EFFECT_BIO, 39, 0, 120);

    skill:setMsg(msgBasic.SKILL_ENFEEB_IS);

    -- display blind first, else bio
    if (blinded == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
    elseif (bio == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = EFFECT_BIO;
    else
        skill:setMsg(msgBasic.SKILL_MISS);
    end

    return typeEffect;
end;
