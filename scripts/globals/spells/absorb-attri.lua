--------------------------------------
-- Spell: Absorb-Attri
-- Steals an enemy's beneficial status
-- effect. The ability Nether Void
-- allows for two beneficial status
-- effects to be absorbed.
-- MP Cost: 33
--------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local bonus = AffinityBonus(caster,spell:getElement());
	local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
	local resist = applyResistance(caster,spell,target,dINT,37,bonus);
	local netherVoid = 0;
	if(resist <= 0.125) then
		spell:setMsg(85); -- Resists
	else
		if(caster:hasStatusEffect(EFFECT_NETHER_VOID)) then
			caster:delStatusEffect(EFFECT_NETHER_VOID);
			netherVoid = 1;
		end
		local effect1 = target:copyStatusEffect();
		local effect = target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);
		if(effect1 == nil) then
			printf("Null \n");
			spell:setMsg(75); -- No effect
		else
			local power = (effect1:getPower() * resist) + ((effect1:getPower() * resist) * ((caster:getMod(MOD_ABSORB_POTENCY) * .01)));
			local duration = effect1:getDuration() + caster:getMod(MOD_ABSORB_DURATION);
			caster:addStatusEffect(effect1:getType(), power, effect1:getTickCount(), duration);
			spell:setMsg(MSG_EFFECT_DRAINED);
			if (netherVoid == 1) then
				local effect3 = target:copyStatusEffect(player);
				local effect2 = target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);
				if(effect3 == nil) then
					local power2 = (effect3:getPower() * resist) + ((effect3:getPower() * resist) * ((caster:getMod(MOD_ABSORB_POTENCY) * .01)));
					local duration2 = effect3:getDuration() + caster:getMod(MOD_ABSORB_DURATION);
					caster:addStatusEffect(effect3:getType(), power2, effect3:getTickCount(), duration2);
				end
			end
		end
	end
	return effect;
end;