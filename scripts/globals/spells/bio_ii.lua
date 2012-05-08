-----------------------------------------
-- Spell: Bio II
-- Deals dark damage that weakens an enemy's attacks and gruadually reduces its HP.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	--calculate raw damage
	basedmg = caster:getSkillLevel(DARK_MAGIC_SKILL) / 4;
	dmg = calculateMagicDamage(basedmg,2,caster,spell,target,DARK_MAGIC_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	resist = applyResistance(caster,spell,target,caster:getMod(MOD_INT)-target:getMod(MOD_INT),ELEMENTAL_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments including the actual damage dealt
	final = finalMagicAdjustments(caster,target,spell,dmg);
	
	-- Calculate duration.
	duration = 120;
	
	-- Check for Dia.
	dia = target:getStatusEffect(EFFECT_DIA);

	-- Calculate DoT (rough, though fairly accurate)
	dotdmg = 3 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);
	
	-- Do it!
	if(dia == nil or (BIO_OVERWRITE == 0 and dia:getPower() <= 2) or (BIO_OVERWRITE == 1 and dia:getPower() < 2)) then
		target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE);
	end
	
	--Try to kill same tier Dia (default behavior)
	if(DIA_OVERWRITE == 1 and dia ~= nil) then
		if(dia:getPower() <= 2) then
			target:delStatusEffect(EFFECT_DIA);
		end
	end
	
	return final;
	
end;