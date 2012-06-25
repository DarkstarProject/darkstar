-----------------------------------------
--	ID: 13185
--	Equip: muscle_belt
--  Adds "Regen" Effect +1 every 3 sec when HP <= 50%
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	sItem = target:getEquipID(10);
    FiftyPercent = ((target:getMaxHP())*(1/2));
    currentHP = target:getHP();

	if (sItem == 13185 and currentHP <= FiftyPercent) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,13185);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,13185);
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
   sItem = target:getEquipID(10);
   currentHP = target:getHP();
   FiftyPercent = ((target:getMaxHP())*(1/2));
   
   if(sItem == 13185 and currentHP <= FiftyPercent) then
        target:addHP(effect:getPower());
   else
      target:delStatusEffect(EFFECT_AUTO_REGEN,13185);
   end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;