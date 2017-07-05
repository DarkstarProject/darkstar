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
    
    local duration = 300;
    local typeEffect = EFFECT_MAGIC_SHIELD;
    local msg = MobBuffMove(mob,typeEffect,3,0,duration);
    
    skill:setMsg(msg);
    return typeEffect;
end;