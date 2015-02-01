-----------------------------------------
-- Spell: Diaga IV
-- Lowers an enemy's defense and gradually
-- deals light elemental damage.
-- MP Cost: 180
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
	local basedmg = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 3;
	local dmg = calculateMagicDamage(basedmg,5,caster,spell,target,ENFEEBLING_MAGIC_SKILL,MOD_INT,false);

	dmg = utils.clamp(dmg, 1, 120);

	-- Get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),ENFEEBLING_MAGIC_SKILL,1.0);
	-- Get the resisted damage
	dmg = dmg*resist;
	-- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	-- Add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	-- Add in final adjustments including the actual damage dealt
	local final = finalMagicAdjustments(caster,target,spell,dmg);

	-- Calculate duration.
	local duration = 150;

	local diaPowerMod = 0;

	if(caster:getEquipID(SLOT_MAIN) == 17466 or caster:getEquipID(SLOT_SUB) == 17466) then -- Dia Wand
		diaPowerMod = 1;
	end

	if (caster:hasStatusEffect(EFFECT_SABOTEUR) == true) then
		duration = duration + (duration * (1 + (caster:getMod(MOD_SABOTEUR)/100)));
		diaPowerMod = diaPowerMod + 4;
		caster:delStatusEffect(EFFECT_SABOTEUR);
    	end

	-- Check for Bio.
	bio = target:getStatusEffect(EFFECT_BIO);

	-- Do it!
	if(bio == nil or (DIA_OVERWRITE == 0 and bio:getPower() <= 4) or (DIA_OVERWRITE == 1 and bio:getPower() < 4)) then
		target:addStatusEffect(EFFECT_DIA,4,3,duration, 0, 20, diaPowerMod);
		spell:setMsg(2);
	else
		spell:setMsg(75);
	end

	-- Try to kill same tier Bio
	if(BIO_OVERWRITE == 1 and bio ~= nil) then
		if(bio:getPower() <= 4) then
			target:delStatusEffect(EFFECT_BIO);
		end
	end

	return final;

end;