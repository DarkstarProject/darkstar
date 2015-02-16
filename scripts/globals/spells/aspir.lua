-----------------------------------------
-- Spell: Aspir
-- Drain functions only on skill level!!
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/abyssea");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	if (caster:isPC()) then
		local YellowTrigger = caster:getVar("YellowTrigger");
		if (YellowTrigger == 247) then
			WeaknessTriggerYellow(caster,target,spell);
		else
			if (math.random(4) == 1) then
				TriggerHintYELLOW(caster);
			end
		end
	end
	--calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
	-- also have small constant to account for 0 dark skill
	local dmg = 5 + 0.375 * (caster:getSkillLevel(DARK_MAGIC_SKILL) + caster:getMod(79 + DARK_MAGIC_SKILL));
	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end

	if(target:isUndead()) then
		spell:setMsg(75); -- No effect
		return dmg;
	end

	if(target:getMP() > dmg) then
		caster:addMP(dmg);
		target:delMP(dmg);
	--elseif caster:hasStatusEffect(EFFECT_ATMA_OF_DUNES) then
	--	local AtmaBonus = 25
	--	if (target:getMP() > dmg) then
	--		caster:addMP(dmg+AtmaBonus);
	--		target:delMP(dmg+AtmaBonus);
	--	else
	--		dmg = target:getMP();
	--		caster:addMP(dmg+AtmaBonus);
	--		target:delMP(dmg+AtmaBonus);
	--	end
	else
		dmg = target:getMP();
		caster:addMP(dmg);
		target:delMP(dmg);
	end

	return dmg;
end;