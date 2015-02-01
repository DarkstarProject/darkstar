-----------------------------------
--	EFFECT_SCARLET_DELIRIUM_II
--	(Charged)
-- Channels dmg taken into enhanced
-- atk and magic atk. Dmg proportional
-- to next hit taken hp loss / 2.
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_SCARLET_DMG,effect:getPower());
	target:addMod(MOD_SCARLET_MDMG,effect:getPower());
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
	target:delMod(MOD_SCARLET_DMG,effect:getPower());
	target:delMod(MOD_SCARLET_MDMG,effect:getPower());
end;