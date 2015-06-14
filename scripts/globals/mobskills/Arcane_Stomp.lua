---------------------------------------------
--  Arcane Stomp
--
--  Description: Stomps the ground to apply elemental absorption.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: AoE surrounding Gurfurlur, affects all mobs.
--  Notes: Only used by Gurfurlur the Menacing. This results in all elemental damage (from spells or weaponskills) healing him. Aspir still works normally.  Lasts approximately 5 minutes, cannot be dispelled.
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

    typeEffect = EFFECT_NAME;
    skill:setMsg(MSG_BUFF);
    if(mob:hasStatusEffect(typeEffect) == true) then
        oldEffect = mob:getStatusEffect(typeEffect);
        oldEffect:setPower(power);
        oldEffect:setDuration(duration);
    else
        mob:addStatusEffect(typeEffect,power,tic,duration);
    return typeEffect;
	]]
end;