-----------------------------------------
-- Spell: Banish V
-- Deals light damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doDivineNuke(594,1.5,caster,spell,target,false,1.0);
	if(caster:getObjType() == TYPE_PC) then
		local job = caster:getMainJob();
		local sjob = caster:getSubJob();
	if(job == JOB_WHM or sjob == JOB_WHM) then
		dmg = dmg + caster:getMerit(MERIT_BANISH_EFFECT);
	end
	local duration = 75;
	if(caster:getObjType() == TYPE_PC) then
		if(job == JOB_WHM or sjob == JOB_WHM) then
			duration = 75 + caster:getMerit(MERIT_BANISH_EFFECT);
		end
	end
	local power = 900;
	local ring1 = caster:getEquipID(SLOT_RING1);
	local ring2 = caster:getEquipID(SLOT_RING2);
	local hands = caster:getEquipID(SLOT_HANDS);
	-- Equipment Bonuses
	if(ring1 == 15831 or ring2 == 15831) then
		power = power + 25;
	end
	if(hands == 15104 or hands == 14911) then
		power = power + 25;
	end
	if(hands == 10692) then
		power = power + 50;
	end
	if(target:isUndead()) then
		if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
			target:addStatusEffect(EFFECT_DEFENSE_DOWN,power,0,duration);
		elseif(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == true) then
			target:delStatusEffect(EFFECT_DEFENSE_DOWN);
			target:addStatusEffect(EFFECT_DEFENSE_DOWN,power,0,duration);
		end
	end
	return dmg;
end;