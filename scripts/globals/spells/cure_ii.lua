-----------------------------------------
-- Spell: Cure II
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
	cap = 60;
	--rate = 1;
	constant = 10;
	Power = 3 * MND + VIT + 3* math.floor((HealingMagic /5));
	if (Power < 110) then
		divisor = 1;
		constant = 20;
	elseif (Power < 170) then
		divisor = 2;
		constant = 47.5;
	else
	divisor = 35.6666;
	constant = 87.62;
	end	
	min = 60;
--ToDo: Implement day & weather bonuses
	basecure = math.floor(Power/2)/divisor + constant;
	if (basecure<min) then basecure=min; end
	-- Base = ((Power / 2) / rate) + constant;
	Final = math.floor(basecure);
	if(Final > cap) then Final = cap; end
	
	return target:addHP(Final);
end;