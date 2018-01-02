-----------------------------------
--
-- EFFECT_AFTERMATH
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local subPower = effect:getSubPower()
    local modID = effect:getSubType()
    target:addMod(modID, subPower)
    
    -- Special case, Shock Spikes
    if (modID == MOD_SPIKES_DMG) then
        target:addMod(MOD_SPIKES, SUBEFFECT_SHOCK_SPIKES) -- Make it shock spikes, specifically
    end
    
    -- Special case, "Occasionally deal x damage"
    if (modID == MOD_OCC_DO_EXTRA_DMG) then
        target:addMod(MOD_EXTRA_DMG_CHANCE, 400)
    end
    
    -- Add secondary effects for 119/III weapons (this is a little gross, but what can you do?)
    if (effect:getPower() == 2) then
        if (modID == MOD_SUBTLE_BLOW) then
            if (target:getWeaponSkillType(SLOT_MAIN) == SKILL_H2H) then
                target:addMod(MOD_KICK_ATTACK, 15) -- Final Heaven
            else
                target:addMod(MOD_ATTP, 10) -- Blade: Metsu
            end
        elseif (modID == MOD_CRITHITRATE) then
            if (target:isWeaponTwoHanded()) then -- Ragnarok and Mandau base Aftermath gives +CritRate
                target:addMod(MOD_ACC, 15) -- Scourge
            else
                target:addMod(MOD_CRIT_DMG_INCREASE, 5) -- Mercy Stroke
            end
        elseif (modID == MOD_REGEN) then -- Knights of Round
            target:addMod(MOD_REFRESH, 3)
        elseif (modID == MOD_ATTP) then -- Onslaught - make pets great again!
            local pet = target:getPet()
            if (pet) then
                pet:addMod(MOD_ATTP, subPower)
            end
        elseif (modID == MOD_DMG) then -- Metatron Torment - cause people use that. . .
            target:addMod(MOD_REGEN, 15)
        elseif (modID == MOD_HASTE_GEAR) then -- Catastrophe
            target:addMod(MOD_ACC, 15)
        elseif (modID == MOD_SPIKES_DMG) then -- Geirskogul
            target:addMod(MOD_ATTP, 5) -- lolDRG needs all the help it can get
            target:addMod(MOD_DOUBLE_ATTACK, 5)
        elseif (modID == MOD_STORETP) then -- Tachi: Kaiten
            target:addMod(MOD_ZANSHIN, 10)
        elseif (modID == MOD_ACC) then -- Randgrith
            target:addMod(MOD_MACC, 20) -- WHM OP!
            target:addMod(MOD_REFRESH, 15) -- THEY GET ALL THE GOD DAMN BUFFS!
        elseif (modID == MOD_REFRESH) then -- Gate of Tartarus
            target:addMod(MOD_DMG, -20)
        elseif (modID == MOD_RACC) then -- Namas Arrow
            target:addMod(MOD_SNAP_SHOT, 5)
        elseif (modID == MOD_ENMITY) then -- Coronach
            target:addMod(MOD_RATTP, 10)
        end
    end
end

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local power = effect:getSubPower();
    local modID = effect:getSubType();
    target:delMod(modID, power);
    -- Special case, Shock Spikes
    if (modID == MOD_SPIKES_DMG) then
        target:delMod(MOD_SPIKES, SUBEFFECT_SHOCK_SPIKES); -- RIP Shock Spikes
    end
    
    -- Special case, "Occasionally deal x damage"
    if (modID == MOD_OCC_DO_EXTRA_DMG) then
        target:delMod(MOD_EXTRA_DMG_CHANCE, 400)
    end
    
    -- Remove secondary effects for 119/III weapons
    if (effect:getPower() == 2) then
        if (modID == MOD_SUBTLE_BLOW) then -- Spharai and Kikoku base Aftermath gives +SubtleBlow
            if (target:getWeaponSkillType(SLOT_MAIN) == SKILL_H2H) then
                target:delMod(MOD_KICK_ATTACK, 15) -- Final Heaven
            else
                target:delMod(MOD_ATTP, 10) -- Blade: Metsu
            end
        elseif (modID == MOD_CRITHITRATE) then
            if (target:isWeaponTwoHanded()) then -- Ragnarok and Mandau base Aftermath gives +CritRate hnnnngggg
                target:delMod(MOD_ACC, 15) -- Scourge
            else
                target:delMod(MOD_CRIT_DMG_INCREASE, 5) -- Mercy Stroke
            end
        elseif (modID == MOD_REGEN) then
            target:delMod(MOD_REFRESH, 3) -- Knights of Round
        elseif (modID == MOD_ATTP) then
            local pet = target:getPet()
            if (pet) then
                pet:delMod(MOD_ATTP, subPower) -- Onslaught - make pets great again!
            end
        elseif (modID == MOD_DMG) then -- Metatron Torment - cause people use that. . .
            target:delMod(MOD_REGEN, 15)
        elseif (modID == MOD_HASTE_GEAR) then -- Catastrophe
            target:delMod(MOD_ACC, 15)
        elseif (modID == MOD_SPIKES_DMG) then -- Geirskogul
            target:delMod(MOD_ATTP, 5) -- lolDRG needs all the help it can get
            target:delMod(MOD_DOUBLE_ATTACK, 5)
        elseif (modID == MOD_STORETP) then -- Tachi: Kaiten
            target:delMod(MOD_ZANSHIN, 10)
        elseif (modID == MOD_ACC) then -- Randgrith
            target:delMod(MOD_MACC, 20) -- WHM OP!
            target:delMod(MOD_REFRESH, 15) -- THEY GET ALL THE GOD DAMN BUFFS!
        elseif (modID == MOD_REFRESH) then -- Gate of Tartarus
            target:delMod(MOD_DMG, -20)
        elseif (modID == MOD_RACC) then -- Namas Arrow
            target:delMod(MOD_SNAP_SHOT, 5)
        elseif (modID == MOD_ENMITY) then -- Coronach
            target:delMod(MOD_RATTP, 10)
        end
    end
end