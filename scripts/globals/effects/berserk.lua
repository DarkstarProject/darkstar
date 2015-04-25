-----------------------------------
--
-- 	EFFECT_BERSERK
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- Mythic great axe Conqueror augments Berserk.
    -- Conqueror Lv75: 30%
    if(target:getEquipID(SLOT_MAIN) == 18991) then
        target:addMod(MOD_ATTP,30);
        target:addMod(MOD_RATTP,30);
        target:addMod(MOD_DEFP,-30);
    -- Conqueror Lv80: 30.7%
    elseif(target:getEquipID(SLOT_MAIN) == 19060) then
        target:addMod(MOD_ATTP,30.7);
        target:addMod(MOD_RATTP,30.7);
        target:addMod(MOD_DEFP,-30.7);
    -- Conqueror Lv85: 32%
    elseif(target:getEquipID(SLOT_MAIN) == 19080) then
        target:addMod(MOD_ATTP,32);
        target:addMod(MOD_RATTP,32);
        target:addMod(MOD_DEFP,-32);
    -- Conqueror Lv99, Lv95: 33%
    elseif(target:getEquipID(SLOT_MAIN) == 19612 or target:getEquipID(SLOT_MAIN) == 19710) then
        target:addMod(MOD_ATTP,33);
        target:addMod(MOD_RATTP,33);
        target:addMod(MOD_DEFP,-33);
    -- Conqueror Lv99, iLv119, iLv119 with afterglow: 33.5%
    elseif(target:getEquipID(SLOT_MAIN) == 19819 or target:getEquipID(SLOT_MAIN) == 19837 or target:getEquipID(SLOT_MAIN) == 19838) then
        target:addMod(MOD_ATTP,33.5);
        target:addMod(MOD_RATTP,33.5);
        target:addMod(MOD_DEFP,-33.5);
        
    --default
    else
        target:addMod(MOD_ATTP,25);
        target:addMod(MOD_RATTP, 25);
        target:addMod(MOD_DEFP,-25);
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
    target:setMod(MOD_ATTP,0);
    target:setMod(MOD_DEFP,0);
    target:setMod(MOD_RATTP,0);
end;
