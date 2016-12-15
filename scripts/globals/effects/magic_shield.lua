-----------------------------------
--
-- Magic Shield BLOCKS all magic attacks
-- Magic Shield from Rampart provides magical stoneskin at vit*2
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getObjType() == TYPE_PC) then
		target:setMod(MOD_MAGIC_SHIELD, effect:getPower());
		target:setVar("Rampart", 1);
	elseif (effect:getPower() == 3) then -- arcane stomp
        target:addMod(MOD_FIRE_ABSORB, 100);
        target:addMod(MOD_EARTH_ABSORB, 100);
        target:addMod(MOD_WATER_ABSORB, 100);
        target:addMod(MOD_WIND_ABSORB, 100);
        target:addMod(MOD_ICE_ABSORB, 100);
        target:addMod(MOD_LTNG_ABSORB, 100);
        target:addMod(MOD_LIGHT_ABSORB, 100);
        target:addMod(MOD_DARK_ABSORB, 100);
    elseif (effect:getPower() == 1) then
        target:addMod(MOD_UDMGMAGIC, -101);
    elseif (effect:getPower() == 0) then
        target:addMod(MOD_MAGIC_ABSORB, 100);
    end;
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
    if (target:getObjType() == TYPE_PC) then
		target:delMod(MOD_MAGIC_SHIELD, 0);
		target:setVar("Rampart", 0);
    elseif (target:getVar("Rampart") == 0) then
	    if (effect:getPower() == 3) then -- arcane stomp
            target:delMod(MOD_FIRE_ABSORB, 100);
            target:delMod(MOD_EARTH_ABSORB, 100);
            target:delMod(MOD_WATER_ABSORB, 100);
            target:delMod(MOD_WIND_ABSORB, 100);
            target:delMod(MOD_ICE_ABSORB, 100);
            target:delMod(MOD_LTNG_ABSORB, 100);
            target:delMod(MOD_LIGHT_ABSORB, 100);
            target:delMod(MOD_DARK_ABSORB, 100);
        elseif (effect:getPower() == 1) then
           target:delMod(MOD_UDMGMAGIC, -101);
        elseif (effect:getpower() == 0) then
           target:delMod(MOD_MAGIC_ABSORB, 100);
        end;
    end;
end;
