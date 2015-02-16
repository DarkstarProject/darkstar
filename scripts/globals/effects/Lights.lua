-----------------------------------
-- Type: VISITANT STATUS
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/Abyssea-Konschtat/TextIDs");
require("scripts/zones/Abyssea-La_Theine/TextIDs");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");
require("scripts/zones/Abyssea-Altepa/TextIDs");
require("scripts/zones/Abyssea-Attohwat/TextIDs");
require("scripts/zones/Abyssea-Grauberg/TextIDs");
require("scripts/zones/Abyssea-Misareaux/TextIDs");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

    target:addStatusEffectEx(EFFECT_VISITANT,EFFECT_VISITANT,0,0,5000);
	
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
    target:delMod(MOD_REGEN, effect:getPower());
end;