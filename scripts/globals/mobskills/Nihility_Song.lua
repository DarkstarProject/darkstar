---------------------------------------------
--  Nihility Song
--  Family: Hippogryph
--  Description: A song dispels a positive effect in an area of effect, including food.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows 
--  Range: Radial 12.5'
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dispel =  target:dispelStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));

    if (dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end