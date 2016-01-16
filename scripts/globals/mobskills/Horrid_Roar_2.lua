---------------------------------------------------
-- Horrid Roar (Nidhogg)
-- Dispels all buffs including food. Lowers Enmity.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1;
    elseif (mob:AnimationSub() ~= 0) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dispel =  target:dispelAllStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));

    if (dispel == 0) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR_NUM);
    end

    mob:lowerEnmity(target, 45);
    
    return dispel;
end