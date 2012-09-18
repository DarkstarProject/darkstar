-----------------------------------
--
-- 	EFFECT_FROST
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	local skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= effect:getPower()) then --absorb all damage
            target:delMod(MOD_STONESKIN,effect:getPower());
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
			target:wakeUp();
			target:delHP(effect:getPower() - skin);
        end
	else
		target:delHP(effect:getPower());
		target:wakeUp();
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;