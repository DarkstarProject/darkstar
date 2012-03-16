-----------------------------------------
-- Spell: Cure V
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	MND = caster:getStat(MOD_MND);
	VIT = target:getStat(MOD_VIT);
	HealingMagic = caster:getSkillLevel(0x0021);
	minimum = 450;
	Power = 3 * MND + VIT + 3* math.floor((HealingMagic /5));
	if (Power < 320) then
		divisor = 0.6666;
		constant = 330;
	elseif (Power < 560) then
		divisor = 1;
		constant = 410;
	else
	divisor = 2.8333;
	constant = 591.2;
	end	
--ToDo: Implement day & weather bonuses
	basecure = math.floor(Power/2)/divisor + constant;
	Final = math.floor(basecure);
	if(Final < minimum) then Final = minimum; end
	return target:addHP(Final);
end;