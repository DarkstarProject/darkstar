-----------------------------------------
-- Spell: Digest
-- Drain functions only on skill level!!
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
		
	local dmg = 5 + 0.575 * (caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL));
	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_MND)-target:getStat(MOD_MND),BLUE_SKILL,1.0);
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

	if(target:getHP() > dmg) then
		caster:addHP(dmg);
		target:delHP(dmg);
	else
		dmg = target:getHP();
		caster:addHP(dmg);
		target:delHP(dmg);
	end

	spell:setMsg(227); 
	return dmg;
end;