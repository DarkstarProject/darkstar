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
    if (effect:getPower() == 1) then
        target:addPetMod(MOD_REGAIN, 20);
        target:addPetMod(MOD_REGEN, 4);
    elseif (effect:getPower() == 2) then
        target:addPetMod(MOD_REGAIN, 50);
        target:addPetMod(MOD_REGEN, 20);
    elseif (effect:getPower() == 3) then
        target:addPetMod(MOD_REGAIN, 20);
        target:addPetMod(MOD_REGEN, 6);
    elseif (effect:getPower() == 4) then
        target:addPetMod(MOD_REGAIN, 20);
        target:addPetMod(MOD_REGEN, 8);
    elseif (effect:getPower() == 5) then
        target:addPetMod(MOD_REGAIN, 30);
        target:addPetMod(MOD_REGEN, 10);
    elseif (effect:getPower() == 6) then
        target:addPetMod(MOD_REGAIN, 30);
        target:addPetMod(MOD_REGEN, 12);
    elseif (effect:getPower() == 7) then
        target:addPetMod(MOD_REGAIN, 30);
        target:addPetMod(MOD_REGEN, 14);
    elseif (effect:getPower() == 8) then
        target:addPetMod(MOD_REGAIN, 40);
        target:addPetMod(MOD_REGEN, 16);
    elseif (effect:getPower() == 9) then
        target:addPetMod(MOD_REGAIN, 40);
        target:addPetMod(MOD_REGEN, 18);
    elseif (effect:getPower() == 10) then
        target:addPetMod(MOD_REGAIN, 10);
        target:addPetMod(MOD_REGEN, 3);
    elseif (effect:getPower() == 11) then
        target:addPetMod(MOD_REGAIN, 60);
        target:addPetMod(MOD_REGEN, 25);
    end
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
    if (effect:getPower() == 1) then
        target:delPetMod(MOD_REGAIN, 20);
        target:delPetMod(MOD_REGEN, 4);
    elseif (effect:getPower() == 2) then
        target:delPetMod(MOD_REGAIN, 50);
        target:delPetMod(MOD_REGEN, 20);
    elseif (effect:getPower() == 3) then
        target:delPetMod(MOD_REGAIN, 20);
        target:delPetMod(MOD_REGEN, 6);
    elseif (effect:getPower() == 4) then
        target:delPetMod(MOD_REGAIN, 20);
        target:delPetMod(MOD_REGEN, 8);
    elseif (effect:getPower() == 5) then
        target:delPetMod(MOD_REGAIN, 30);
        target:delPetMod(MOD_REGEN, 10);
    elseif (effect:getPower() == 6) then
        target:delPetMod(MOD_REGAIN, 30);
        target:delPetMod(MOD_REGEN, 12);
    elseif (effect:getPower() == 7) then
        target:delPetMod(MOD_REGAIN, 30);
        target:delPetMod(MOD_REGEN, 14);
    elseif (effect:getPower() == 8) then
        target:delPetMod(MOD_REGAIN, 40);
        target:delPetMod(MOD_REGEN, 16);
    elseif (effect:getPower() == 9) then
        target:delPetMod(MOD_REGAIN, 40);
        target:delPetMod(MOD_REGEN, 18);
    elseif (effect:getPower() == 10) then
        target:delPetMod(MOD_REGAIN, 10);
        target:delPetMod(MOD_REGEN, 3);
    elseif (effect:getPower() == 11) then
        target:delPetMod(MOD_REGAIN, 60);
        target:delPetMod(MOD_REGEN, 25);
    end
end;
