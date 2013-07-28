-----------------------------------------
-- Spell: Blind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	-- Pull base stats.
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	local bonus = AffinityBonus(caster,spell:getElement());

	-- Base power.  May need more research.
	local power = math.floor((dINT + 60) / 4);
	if(power < 5) then
		power = 5;
	end
	if(power > 20) then
		power = 20;
	end

	-- Duration, including resistance.  Unconfirmed.
	local duration = 120 * applyResistance(caster,spell,target,dINT,35,bonus);

	if(100 * math.random() >= target:getMod(MOD_BLINDRES)) then
		if(duration >= 90) then --Do it!

			if(target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
				spell:setMsg(236);
			else

				spell:setMsg(75);
			end
		else
            spell:setMsg(85);
		end
	else
		spell:setMsg(284);
	end
	return EFFECT_BLINDNESS;
end;