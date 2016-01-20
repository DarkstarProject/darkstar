---------------------------------------------
--  Belly Dance
--
--  Description: Charms all targets in an area of effect, that are facing the Lamia.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
--  Notes: Used only by Lamia NM's, particularly in Besieged.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    --[[
    power = 1;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_NAME;
    statmod = MOD_INT;

    resist = applyPlayerResistance(mob,typeEffect,target,isEnfeeble,typeEffect,statmod);
    if (resist > 0.2) then
        if (target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,power,tic,duration);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
    return typeEffect;
    ]]
end;