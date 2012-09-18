-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	local res = (effect:getPower() * (26/512)) * 100;	-- Bio 1 is 27/512, Bio 2 is 52/512. This is roughly accurate.
	target:addMod(MOD_ATTP,-res);
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
	local res = (effect:getPower() * (26/512)) * 100;	-- Bio 1 is 27/512, Bio 2 is 52/512. This is roughly accurate.
	target:delMod(MOD_ATTP,-res);
end;
