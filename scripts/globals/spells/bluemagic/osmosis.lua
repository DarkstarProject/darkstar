--------------------------------------
-- 	Spell: Osmosis
-- 	Steals an enemy's attribute
--	Note: this does nothing but drain at he moment
--	as it has not been implimented yet
--------------------------------------
 require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local dmg = 10 + (0.709 * (caster:getSkillLevel(BLUE_SKILL)) + caster:getMod(1 + BLUE_SKILL));
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_MND)-target:getStat(MOD_MND),BLUE_SKILL,1.0);
	dmg = dmg*resist;
	dmg = addBonuses(caster,spell,target,dmg);
	dmg = adjustForTarget(target,dmg,spell:getElement());
	if (dmg > (caster:getSkillLevel(BLUE_SKILL) + 75)) then
		dmg = (caster:getSkillLevel(BLUE_SKILL) + 75);
	end

    if (dmg < 0) then
        dmg = 0
    end
    
	if(target:isUndead()) or (effect == EFFECT_NONE) then
	    spell:setMsg(75); 
		return dmg;
	end

	dmg = finalMagicAdjustments(caster,target,spell,dmg);

	dmg = (dmg * DRAIN_POWER);

	if(effect == EFFECT_NONE) then
	    spell:setMsg(75);
	else	
	    spell:setMsg(227);
	end  
	local effect = EFFECT_NONE;
	effect = target:dispelStatusEffect();
	caster:addHP(dmg);
	return dmg;

end;
