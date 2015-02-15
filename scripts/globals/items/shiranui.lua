-----------------------------------------
-- ID: 17774
-- Item: Shiranui
-- Additional Effect: Light Damage (night time only)
-----------------------------------------
require("scripts/globals/status");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 35;
	if (VanadielHour()>=18 or VanadielHour()<7) then
	    if (target:getMainLvl() > player:getMainLvl()) then
			chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
			chance = utils.clamp(chance, 5, 95);
		end
		if (math.random(0,99) >= chance) then
			return 0,0,0;
		else
			local diff = player:getStat(MOD_INT) - target:getStat(MOD_INT);
			if (diff > 20) then
				diff = 20 + (diff - 20) / 2;
			end
			local lightDamage = diff + (player:getMainLvl() - target:getMainLvl()) + damage/2;
			local params = {};
			params.bonusmab = 0;
			params.includemab = true;
			lightDamage = addBonusesAbility(player, ELE_LIGHT, target, lightDamage, params);
			lightDamage = lightDamage * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
			lightDamage = adjustForTarget(target,lightDamage,ELE_LIGHT);
			if (lightDamage < 0) then
				lightDamage = 0
			end
			lightDamage = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,lightDamage);
			if (lightDamage >35) then				
				lightDamage = 35;
			end
			return SUBEFFECT_LIGHT_DAMAGE, 163, lightDamage;
		end
	end
	return 0,0,0;
end;