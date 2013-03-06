-----------------------------------------
-- Spell: Bio
-- Deals dark damage that weakens an enemy's attacks and gruadually reduces its HP.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	--calculate raw damage
	basedmg = caster:getSkillLevel(DARK_MAGIC_SKILL) / 4;
	dmg = calculateMagicDamage(basedmg,1,caster,spell,target,DARK_MAGIC_SKILL,MOD_INT,false);

	-- Softcaps at 15, should always do at least 1
	if(dmg > 15) then
		dmg = 15;
	end
	if(dmg < 1) then
		dmg = 1;
	end

	--get resist multiplier (1x if no resist)
	resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);

	--add in final adjustments including the actual damage dealt
	final = finalMagicAdjustments(caster,target,spell,dmg);

	-- Calculate duration.
	duration = 60;

	-- Check for Dia & bio.
	dia = target:getStatusEffect(EFFECT_DIA);

	-- Calculate DoT (rough, though fairly accurate)
	dotdmg = 2 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);

	-- Do it!
	if(BIO_OVERWRITE == 0 or (BIO_OVERWRITE == 1 and dia == nil)) then
		target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE);
	end

	--Try to kill same tier Dia (default behavior)
	if(DIA_OVERWRITE == 1 and dia ~= nil) then
		if(dia:getPower() == 1) then
			target:delStatusEffect(EFFECT_DIA);
		end
	end

	return final;

end;
