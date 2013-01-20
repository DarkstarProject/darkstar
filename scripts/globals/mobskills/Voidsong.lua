---------------------------------------------
--  Voidsong
--
--  Description: Removes all status effects in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    -- can only used if not silenced
    if(mob:hasStatusEffect(EFFECT_SILENCE) == false) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    skill:setMsg(MSG_NONE);
    -- this should remove enough
    local dis = target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();
    target:dispelStatusEffect();

    if(dis == EFFECT_NONE) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        skill:setMsg(MSG_DISPEL);
    end

    return dis;
end;