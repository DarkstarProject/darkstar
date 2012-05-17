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
    target:delHP(effect:getPower());
    target:wakeUp();
end;


-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;