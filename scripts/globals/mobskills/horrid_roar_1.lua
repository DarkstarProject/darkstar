---------------------------------------------
-- Horrid Roar (Fafnir, Cynoprosopi, Smok)
-- Dispels a single buff at random which could be food.  Lowers Enmity.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1;
    elseif (mob:AnimationSub() ~= 0) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dispel =  target:dispelStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));

    if (dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(msgBasic.SKILL_NO_EFFECT); -- no effect
    else
        skill:setMsg(msgBasic.SKILL_ERASE);
    end

    mob:lowerEnmity(target, 20);

    return dispel;
end