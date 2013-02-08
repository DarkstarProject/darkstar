require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-- DEF is removed in core as equip swaps can mess this up otherwise!
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_COUNTER,effect:getPower());
    -- TODO fix this. There is no clean way to ignore def right now
    target:addMod(MOD_DEFP,-75);
    target:addMod(MOD_ENMITY,effect:getPower()/5);
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
    target:delMod(MOD_COUNTER,effect:getPower());
    target:delMod(MOD_DEFP,-75);
	target:delMod(MOD_ENMITY,effect:getPower()/5);
end;