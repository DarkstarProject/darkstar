-----------------------------------------
-- ID: 16077
-- Item: Megrim Crown
-- Enchantment: ??? Random 
-- Durration: 15 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	var = math.random(1,8);
	DEFmod = math.random(5,15)
	ATKmod = math.random(5,15)
	ACCmod = math.random(5,15)
	if (var == 1) then
		if (target:hasStatusEffect(EFFECT_DEFENSE_BOOST) == false) then
			target:addStatusEffect(EFFECT_DEFEFENSE_BOOST,DEFmod,0,900);
		end
	elseif (var == 2) then
		if (target:hasStatusEffect(EFFECT_ATTACK_BOOST) == false) then
			target:addStatusEffect(EFFECT_ATTACK_BOOST,ATKmod,0,900);
		end
	elseif (var == 3) then
		if (target:hasStatusEffect(EFFECT_ACCURACY_BOOST) == false) then
			target:addStatusEffect(EFFECT_ACCURACY_BOOST,ACCmod,0,900);
		end
	elseif (var == 4) then
		if (target:hasStatusEffect(EFFECT_BLINK) == false) then
			target:addStatusEffect(EFFECT_BLINK,4,1,900);
		end
	elseif (var == 5) then
		if (target:hasStatusEffect(EFFECT_REGEN) == false) then
			target:addStatusEffect(EFFECT_REGEN,3,1,900);
		end
	elseif (var == 6) then
		if(target:hasStatusEffect(EFFECT_REFRESH) == false) then
			target:addStatusEffect(EFFECT_REFRESH,5,1,900);
		end
	elseif (var == 7) then
		if(target:hasStatusEffect(EFFECT_BLAZE_SPIKES) == false) then
			target:addStatusEffect(EFFECT_BLAZE_SPIKES,4,3,900);
		end
	end;
end;
