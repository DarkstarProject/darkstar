-----------------------------------------
-- Spell: Cure IV
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	MND = caster:getStat(MOD_MND);
	VIT = target:getStat(MOD_VIT);
	HealingMagic = caster:getSkillLevel(0x0021);
	cap = 270;
	--rate = 1;
	constant = 10;
	Power = 3 * MND + VIT + 3* math.floor((HealingMagic /5));
	if (Power < 220) then
		divisor = 0.6666;
		constant = 165;
	elseif (Power < 460) then
		divisor = 2;
		constant = 275;
	else
	divisor = 6.5;
	constant = 354.6666;
	end	
	min = 270;
--ToDo: Implement day & weather bonuses
	basecure = math.floor(Power/2)/divisor + constant;
	if (basecure<min) then basecure=min; end
	-- Base = ((Power / 2) / rate) + constant;
	Final = math.floor(basecure);

	
	if(Final > cap) then Final = cap; end
	if (Final + target:getHP() > target:getMaxHP()) then
		Final = target:getMaxHP() - target:getHP();
		target:setHP(target:getMaxHP());
	else
		target:addHP(Final);
	end
	return Final;
	
end;