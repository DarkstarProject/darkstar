-----------------------------------
--
-- 	EFFECT_POISON
-- 	
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --nRes=1;
	--cRes = target:getMod(MOD_POISONRES);
    --if(cRes > 0) then
	--    nRes = cRes + nRes    
	--end	
    --target:setMod(MOD_POISONRES,nRes,30);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	skin = target:getMod(MOD_STONESKIN);
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
end;