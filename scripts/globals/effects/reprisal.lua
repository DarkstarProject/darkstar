-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SPIKES,6);
     -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(MOD_SPIKES_DMG, 0);
    target:addMod(MOD_SHIELDBLOCKRATE, 50);
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
    target:delMod(MOD_SPIKES,6);
    target:setMod(MOD_SPIKES_DMG, 0);
    target:delMod(MOD_SHIELDBLOCKRATE, 50);
end;