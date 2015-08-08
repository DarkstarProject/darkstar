-----------------------------------------
-- Spell: Bio III
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Bio III value per point is '30' This is a constant set in the table 'merits'
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	--calculate raw damage
	local basedmg = caster:getSkillLevel(DARK_MAGIC_SKILL) / 4;
	local dmg = calculateMagicDamage(basedmg,3,caster,spell,target,DARK_MAGIC_SKILL,MOD_INT,false);

	-- Softcaps at 32, should always do at least 1
	if (dmg > 62) then
		dmg = 62;
	end
	if (dmg < 1) then
		dmg = 1;
	end

	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--add in final adjustments including the actual damage dealt
	local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = caster:getMerit(MERIT_BIO_III);
    if (duration == 0) then --if caster has the spell but no merits in it, they are either a mob or we assume they are GM or otherwise gifted with max duration
        duration = 150;
    end

	-- Check for Dia.
	local dia = target:getStatusEffect(EFFECT_DIA);

	-- Calculate DoT (rough, though fairly accurate)
	local dotdmg = 4 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);

	-- Do it!
	if (dia == nil or (BIO_OVERWRITE == 0 and dia:getPower() <= 3) or (BIO_OVERWRITE == 1 and dia:getPower() < 3)) then
		target:delStatusEffect(EFFECT_BIO); -- delete old bio
		target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE, 15);
	end

	--Try to kill same tier Dia (default behavior)
	if (DIA_OVERWRITE == 1 and dia ~= nil) then
		if (dia:getPower() <= 3) then
			target:delStatusEffect(EFFECT_DIA);
		end
	end

	return final;

end;
