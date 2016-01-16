-----------------------------------
--
--  EFFECT_MARK_OF_SEED
--
--  DO NOT try to use this anywhere else but Fei'Yin!
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:setVar("SEED_AFTERGLOW_TIMER",1);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local Half_Minutes = target:getVar("SEED_AFTERGLOW_TIMER");
    if (Half_Minutes == 1) then
        target:setVar("SEED_AFTERGLOW_TIMER",(Half_Minutes+1));
        target:messageSpecial(MARK_OF_SEED_FLICKERS);
    elseif (Half_Minutes == 40) then
        target:messageSpecial(MARK_OF_SEED_IS_ABOUT_TO_DISSIPATE);
        target:setVar("SEED_AFTERGLOW_TIMER",(Half_Minutes+1));
    elseif (Half_Minutes == 20) then
        target:messageSpecial(MARK_OF_SEED_GROWS_FAINTER);
        target:setVar("SEED_AFTERGLOW_TIMER",(Half_Minutes+1));
    elseif (Half_Minutes >= 2) then
        target:setVar("SEED_AFTERGLOW_TIMER",(Half_Minutes+1));
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (target:hasKeyItem(MARK_OF_SEED) == false and player:hasKeyItem(AZURE_KEY) == false) then
        target:messageSpecial(MARK_OF_SEED_HAS_VANISHED);
    end
    target:setVar("SEED_AFTERGLOW_TIMER",0);
    target:setVar("SEED_AFTERGLOW_MASK",0);
    target:setVar("SEED_AFTERGLOW_INTENSITY",0);
end;
