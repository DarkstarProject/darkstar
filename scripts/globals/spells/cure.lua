-----------------------------------------
-- Spell: Cure
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
-- Get caster stats	
	MND = caster:getStat(MOD_MND);
	VIT = target:getStat(MOD_VIT);
	HealingMagic = caster:getSkillLevel(0x0021);
-- Define some constants
	cap = 30;
	constant = 10;
-- Do some calcs
	Power = 3 * MND + VIT + 3* math.floor((HealingMagic /5));
	if (Power < 60) then
		divisor = 1;
		constant = -10;
	elseif (Power < 100) then
		divisor = 2;
		constant = 5;
	else
	divisor = 57;
	constant = 29.125;
	end	
	min = 10;
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
	--printf("mnd: %u",MND);
	--printf("hm: %u",HealingMagic);
	-- printf("power: %u",Power);
	-- printf("base: %u",Base);
	-- printf("final: %u",Final);
	--target:updateEnmity(caster,Final*(240/((target:getMainLvl()/1.6)+10)),Final*(40/((target:getMainLvl()/1.6)+10)));
	return Final;
	
end;