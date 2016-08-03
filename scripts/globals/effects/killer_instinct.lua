-----------------------------------
--
-- Pet Ecosystem   | grants this Killer Effect    | ID (effect power) to tell onEffectGain which MOD to raise
-- -------------   --------------------------     ------------------------------------------
-- BEAST           | LIZARD KILLER                | 1
-- LIZARD          | VERMIN KILLER                | 2
-- VERMIN          | PLANTOID KILLER              | 3
-- PLANTOID        | BEAST KILLER                 | 4

-- AQUAN           | AMORPH KILLER                | 5
-- AMORPH          | BIRD KILLER                  | 6
-- BIRD            | AQUAN KILLER                 | 7

-- NONE            | NONE                         | 9
--
----------------------------------------------------------------------------------------------------
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
	    target:addMod(MOD_LIZARD_BONUS_DAMAGE,15)     -- according to BGWiki
	    target:addMod(MOD_LIZARD_KILLER,10)           -- according to BGWiki
	elseif (effect:getPower() == 2) then 
	    target:addMod(MOD_VERMIN_BONUS_DAMAGE,15)
		target:addMod(MOD_VERMIN_KILLER,10)
	elseif (effect:getPower() == 3) then
	    target:addMod(MOD_PLANTOID_BONUS_DAMAGE,15)
	    target:addMod(MOD_PLANTOID_KILLER,10)
	elseif (effect:getPower() == 4) then 
		target:addMod(MOD_BEAST_BONUS_DAMAGE,15)
	    target:addMod(MOD_BEAST_KILLER,10)
	elseif (effect:getPower() == 5) then 
		target:addMod(MOD_AMORPH_BONUS_DAMAGE,15)
	    target:addMod(MOD_AMORPH_KILLER,10)
	elseif (effect:getPower() == 6) then 
		target:addMod(MOD_BIRD_BONUS_DAMAGE,15)
	    target:addMod(MOD_BIRD_KILLER,10)
	elseif (effect:getPower() == 7) then 
		target:addMod(MOD_AQUAN_BONUS_DAMAGE,15)
	    target:addMod(MOD_AQUAN_KILLER,10)
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	if (effect:getPower() == 1) then
	    target:delMod(MOD_LIZARD_BONUS_DAMAGE,15)
	    target:delMod(MOD_LIZARD_KILLER,10)
	elseif (effect:getPower() == 2) then 
	    target:delMod(MOD_VERMIN_BONUS_DAMAGE,15)
		target:delMod(MOD_VERMIN_KILLER,10)
	elseif (effect:getPower() == 3) then
	    target:delMod(MOD_PLANTOID_BONUS_DAMAGE,15)
	    target:delMod(MOD_PLANTOID_KILLER,10)
	elseif (effect:getPower() == 4) then 
		target:delMod(MOD_BEAST_BONUS_DAMAGE,15)
	    target:delMod(MOD_BEAST_KILLER,10)
	elseif (effect:getPower() == 5) then 
		target:delMod(MOD_AMORPH_BONUS_DAMAGE,15)
	    target:delMod(MOD_AMORPH_KILLER,10)
	elseif (effect:getPower() == 6) then 
		target:delMod(MOD_BIRD_BONUS_DAMAGE,15)
	    target:delMod(MOD_BIRD_KILLER,10)
	elseif (effect:getPower() == 7) then 
		target:delMod(MOD_AQUAN_BONUS_DAMAGE,15)
	    target:delMod(MOD_AQUAN_KILLER,10)
	end
end;