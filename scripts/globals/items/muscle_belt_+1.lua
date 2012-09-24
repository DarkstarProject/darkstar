-----------------------------------------
--	ID: 13279
--	Equip: muscle_belt_+1
--  Adds "Regen" Effect +2 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	sItem = target:getEquipID(SLOT_WAIST);
    FiftyPercent = ((target:getMaxHP())*(1/2));
    currentHP = target:getHP();

	if (sItem == 13279 and currentHP <= FiftyPercent) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,2,3,0,13279);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,13279);
	end
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;


-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
   sItem = target:getEquipID(SLOT_WAIST);
   currentHP = target:getHP();
   FiftyPercent = ((target:getMaxHP())*(1/2));
   
   if(sItem == 13279 and currentHP <= FiftyPercent) then
        target:addHP(effect:getPower());
   else
      target:delStatusEffect(EFFECT_AUTO_REGEN,13279);
   end
end;
-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;