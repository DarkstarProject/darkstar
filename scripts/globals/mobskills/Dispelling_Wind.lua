---------------------------------------------
--  Dispelling Wind
--
--  Description: Dispels two effects from targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local dis1 = target:dispelStatusEffect();
    local dis2 = target:dispelStatusEffect();


    if(dis1 == EFFECT_NONE and dis2 == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISPEL);
    end

    return dis1;
end;