-----------------------------------------
-- Spell: Bio V
-- Deals dark damage that weakens an
-- enemy's attacks and gruadually reduces
-- its HP.
-- MP Cost: 197
-----------------------------------------

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

	-- Calculate raw damage
	local basedmg = caster:getSkillLevel(DARK_MAGIC_SKILL) / 2;
	local dmg = calculateMagicDamage(basedmg,3,caster,spell,target,DARK_MAGIC_SKILL,MOD_INT,false);

	-- Softcaps at 200, should always do at least 1
	if(dmg > 200) then
		dmg = 200;
	end
	if(dmg < 1) then
		dmg = 1;
	end

	-- Get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
	-- Get the resisted damage
	dmg = dmg*resist;
	-- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	-- Add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	-- Add in final adjustments including the actual damage dealt
	final = finalMagicAdjustments(caster,target,spell,dmg);

	-- Calculate duration.
	local duration = 150;

	-- Check for Dia.
	local dia = target:getStatusEffect(EFFECT_DIA);

	-- Calculate DoT (rough, though fairly accurate)
	local dotdmg = 6 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);

	-- Do it!
	if(dia == nil or (BIO_OVERWRITE == 0 and dia:getPower() <= 5) or (BIO_OVERWRITE == 1 and dia:getPower() < 5)) then
		target:delStatusEffect(EFFECT_BIO); -- Delete old Bio
		target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE);
	end

	-- Try to kill same tier Dia (default behavior)
	if(DIA_OVERWRITE == 1 and dia ~= nil) then
		if(dia:getPower() <= 5) then
			target:delStatusEffect(EFFECT_DIA);
		end
	end

	return final;

end;