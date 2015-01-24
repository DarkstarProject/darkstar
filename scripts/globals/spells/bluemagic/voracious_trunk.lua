-----------------------------------------
-- Bluemagic: Voracious Trunk
-- Steals one beneficial effect from an
-- enemy.
-- AGI +2
-- Lvl.: 64 MP Cost: 72 Blue Points: 4
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
	local resist = applyResistance(caster,spell,target,dINT,37);
	if(resist > (1/16)) then
		-- Resisted!
		spell:setMsg(85);
	else
		local effect1 = target:copyStatusEffect();
		local effect = target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);
		if(effect == EFFECT_NONE) then
			spell:setMsg(75);
		else
			if (player:addStatusEffect(effect1:getType(), effect1:getPower(), effect1:getTickCount(), effect1:getDuration())) then
				spell:setMsg(453);
			else
				target:dispelStatusEffect(EFFECTFLAG_DISPELABLE); -- Otherwise we just Dispel it
				spell:setMsg(427);
			end
		end
	end

	return effect;
end;