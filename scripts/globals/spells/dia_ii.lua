-----------------------------------------
-- Spell: Dia II
-- Lowers an enemy's defense and gradually deals light elemental damage.
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
	local basedmg = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 4;
	local dmg = calculateMagicDamage(basedmg,3,caster,spell,target,ENFEEBLING_MAGIC_SKILL,MOD_INT,false);

	-- Softcaps at 8, should always do at least 1

	dmg = utils.clamp(dmg, 1, 8);

	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),ENFEEBLING_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--add in final adjustments including the actual damage dealt
	local final = finalMagicAdjustments(caster,target,spell,dmg);

	-- Calculate duration and bonus
	local duration = 120;
	local bonus = 0;

	if(caster:getEquipID(SLOT_MAIN) == 17466 or caster:getEquipID(SLOT_SUB) == 17466) then -- Dia Wand
		bonus = bonus+1;
	end

	if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
		duration = duration * 2;
		bonus = bonus+2;
		caster:delStatusEffect(EFFECT_SABOTEUR);
	end

	-- Check for Bio.
	local bio = target:getStatusEffect(EFFECT_BIO);

	-- Do it!
	if(bio == nil or (DIA_OVERWRITE == 0 and bio:getPower() <= 2) or (DIA_OVERWRITE == 1 and bio:getPower() < 2)) then
		target:addStatusEffect(EFFECT_DIA,2,3,duration,FLAG_ERASABLE,10+bonus);
		spell:setMsg(2);
	else
		spell:setMsg(75);
	end

	-- Try to kill same tier Bio
	if(BIO_OVERWRITE == 1 and bio ~= nil) then
		if(bio:getPower() <= 2) then
			target:delStatusEffect(EFFECT_BIO);
		end
	end

	return final;

end;