---------------------------------------------------
-- Horrid Roar (Tiamat, Jormungand, Vrtra, Ouryu)
-- Dispels all buffs including food. Lowers Enmity.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_INVINCIBLE)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON)) then
        return 1;
	elseif (target:isBehind(mob, 48) == true) then
		return 1;
    elseif (mob:AnimationSub() == 1) then
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

    mob:lowerEnmity(target, 70);
    
    if (mob:getName() == "Jormungand" and mob:getHPP() <= 30 and mob:actionQueueAbility() == false) then
        mob:useMobAbility(1040);
    end
    
    return dispel;
end