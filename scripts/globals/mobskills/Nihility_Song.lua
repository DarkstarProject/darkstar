---------------------------------------------
--  Nihility Song
--
--  Description: AOE that Dispels a single beneficial status effects from all targets in range, including food effects.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local effect = 0;
   
    effect = target:dispelStatusEffect();

    if(effect == EFFECT_NONE) then
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end
    
    

    return effect;
end;