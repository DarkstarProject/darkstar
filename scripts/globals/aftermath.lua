-----------------------------------
-- Aftermath handling
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")

dsp = dsp or {}

dsp.aftermath = {}

dsp.aftermath.type =
{
    RELIC    = 1,
    MYTHIC   = 2,
    EMPYREAN = 3,
} -- TODO: Add Aeonic

-------------------------------------
-- HELPERS : For aftermath eyes onry
-------------------------------------
local getTier1RelicDuration = function(tp)
    return math.floor(tp * 0.02)
end

local getTier2RelicDuration = function(tp)
    return math.floor(tp * 0.06)
end

dsp.aftermath.effects =
{
    -----------------------------------
    -- Tier 1 Relic
    -----------------------------------
    [1]  = { mods = { dsp.mod.SUBTLE_BLOW, 10 }, duration = getTier1RelicDuration }, -- Spharai
    [2]  = { mods = { dsp.mod.CRITHITRATE, 5 }, duration = getTier1RelicDuration }, -- Mandau
    [3]  = { mods = { dsp.mod.REGEN, 10 }, duration = getTier1RelicDuration }, -- Excalibur
    [4]  = { mods = { dsp.mod.CRITHITRATE, 5 }, duration = getTier1RelicDuration }, -- Ragnarok
    [5]  = { mods = { dsp.mod.ATTP, 10 }, duration = getTier1RelicDuration }, -- Guttler
    [6]  = { mods = { dsp.mod.DMG, -20 }, duration = getTier1RelicDuration }, -- Bravura
    [7]  = { mods = { dsp.mod.HASTE_GEAR, 1000 }, duration = getTier1RelicDuration }, -- Apocalypse
    [8]  = { mods = { dsp.mod.SPIKES, dsp.subEffect.SHOCK_SPIKES, dsp.mod.SPIKES_DMG, 10 }, duration = getTier1RelicDuration }, -- Gungnir
    [9]  = { mods = { dsp.mod.SUBTLE_BLOW, 10 }, duration = getTier1RelicDuration }, -- Kikoku
    [10] = { mods = { dsp.mod.STORETP, 7 }, duration = getTier1RelicDuration }, -- Amanomurakumo
    [11] = { mods = { dsp.mod.ACC, 20 }, duration = getTier1RelicDuration }, -- Mjollnir
    [12] = { mods = { dsp.mod.REFRESH, 8 }, duration = getTier1RelicDuration }, -- Claustrum
    [13] = { mods = { dsp.mod.RACC, 20 }, duration = getTier1RelicDuration }, -- Yoichinoyumi
    [14] = { mods = { dsp.mod.ENMITY, -20 }, duration = getTier1RelicDuration }, -- Annihilator

    -----------------------------------
    -- Tier 2 Relic
    -----------------------------------
    [15] = { mods = { dsp.mod.SUBTLE_BLOW, 10, dsp.mod.KICK_ATTACK, 15 }, duration = getTier2RelicDuration }, -- Spharai
    [16] = { mods = { dsp.mod.CRITHITRATE, 5, dsp.mod.CRIT_DMG_INCREASE, 5 }, duration = getTier2RelicDuration }, -- Mandau
    [17] = { mods = { dsp.mod.REGEN, 30, dsp.mod.REFRESH, 3 }, duration = getTier2RelicDuration }, -- Excalibur
    [18] = { mods = { dsp.mod.CRITHITRATE, 10, dsp.mod.ACC, 15 }, duration = getTier2RelicDuration }, -- Ragnarok
    [19] = { mods = { dsp.mod.ATTP, 10 }, duration = getTier2RelicDuration, includePets = true }, -- Guttler
    [20] = { mods = { dsp.mod.DMG, -20, dsp.mod.REGEN, 15 }, duration = getTier2RelicDuration }, -- Bravura
    [21] = { mods = { dsp.mod.HASTE_ABILITY, 1000, dsp.mod.ACC, 15 }, duration = getTier2RelicDuration }, -- Apocalypse
    [22] = { mods = { dsp.mod.SPIKES, dsp.subEffect.SHOCK_SPIKES, dsp.mod.SPIKES_DMG, 10, dsp.mod.ATTP, 5, dsp.mod.DOUBLE_ATTACK, 5 }, duration = getTier2RelicDuration }, -- Gungir
    [23] = { mods = { dsp.mod.SUBTLE_BLOW, 10, dsp.mod.ATTP, 10 }, duration = getTier2RelicDuration }, -- Kikoku
    [24] = { mods = { dsp.mod.STORETP, 10, dsp.mod.ZANSHIN, 10 }, duration = getTier2RelicDuration }, -- Amanomurakumo
    [25] = { mods = { dsp.mod.ACC, 20, dsp.mod.MACC, 20, dsp.mod.REFRESH, 5 }, duration = getTier2RelicDuration }, -- Mjollnir
    [26] = { mods = { dsp.mod.REFRESH, 15, dsp.mod.DMG, -20 }, duration = getTier2RelicDuration }, -- Claustrum
    [27] = { mods = { dsp.mod.RACC, 30, dsp.mod.SNAP_SHOT, 5 }, duration = getTier2RelicDuration }, -- Yoichinoyumi
    [28] = { mods = { dsp.mod.ENMITY, -25, dsp.mod.RATTP, 10 }, duration = getTier2RelicDuration }, -- Annihilator

    -----------------------------------
    -- Tier 1 Mythic
    -----------------------------------
    [29] = -- Conqueror, Glanzfaust, Vajra, Burtgang, Liberator, Aymur, Kogarasumaru, Nagi, Ryunohige, Nirvana, Kenkonken, Terpsichore
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.ATT, function(tp) return math.floor(2 * tp / 50 - 60) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end } },
        duration = { 60, 90, 120 }
    },
    [30] = -- Yagrush, Carnwenhan
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.ACC, function(tp) return math.floor(tp / 100 - 10) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end } },
        duration = { 180, 90, 120 }
    },
    [31] = -- Laevateinn, Murgleis, Tupsimati
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.MATT, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end } },
        duration = { 180, 180, 120 }
    },
    [32] = -- Tizona
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.MACC, function(tp) return math.floor(tp / 100 - 10) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end } },
        duration = { 60, 90, 120 }
    },
    [33] = -- Gastraphetes, Death Penalty
    {
        mods = { { dsp.mod.RACC, function(tp) return math.floor(tp / 100) end },
                 { dsp.mod.RATT, function(tp) return math.floor(2 * tp / 50 - 60) end },
                 { dsp.mod.REM_OCC_DO_DOUBLE_DMG_RANGED, function(tp) return 40 end } },
        duration = { 60, 90, 120 }
    },
    
    -----------------------------------
    -- Tier 2 Mythic
    -----------------------------------
    [34] = -- Conqueror, Glanzfaust, Vajra, Burtgang, Liberator, Aymur, Kogarasumaru, Nagi, Ryunohige, Nirvana, Kenkonken, Terpsichore
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(3 * tp / 200) end },
                 { dsp.mod.ATT, function(tp) return math.floor(3 * tp / 50 - 90) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 60 end } },
        duration = { 90, 120, 180 }
    },
    [35] = -- Yagrush, Carnwenhan
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(3 * tp / 200) end },
                 { dsp.mod.ACC, function(tp) return math.floor(3 * tp / 200 - 15) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 60 end } },
        duration = { 270, 120, 180 }
    },
    [36] = -- Laevateinn, Murgleis, Tupsimati
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(3 * tp / 200) end },
                 { dsp.mod.MATT, function(tp) return math.floor(tp / 50 - 20) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 60 end } },
        duration = { 270, 270, 180 }
    },
    [37] = -- Tizona
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(3 * tp / 200) end },
                 { dsp.mod.MACC, function(tp) return math.floor(3 * tp / 200 - 15) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 60 end } },
        duration = { 90, 120, 180 }
    },
    [38] = -- Gastraphetes, Death Penalty
    {
        mods = { { dsp.mod.RACC, function(tp) return math.floor(tp / 50) end },
                 { dsp.mod.RATT, function(tp) return math.floor(3 * tp / 50 - 90) end },
                 { dsp.mod.REM_OCC_DO_DOUBLE_DMG_RANGED, function(tp) return 60 end } },
        duration = { 90, 120, 180 }
    },
    
    -----------------------------------
    -- Tier 3 Mythic
    -----------------------------------
    [39] = -- Conqueror, Glanzfaust, Vajra, Burtgang, Liberator, Aymur, Kogarasumaru, Nagi, Ryunohige, Nirvana, Kenkonken, Terpsichore
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(tp / 50 + 10) end },
                 { dsp.mod.ATT, function(tp) return math.floor(tp * 0.6 - 80) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end, dsp.mod.MYTHIC_OCC_ATT_THRICE, function(tp) return 20 end } },
        duration = { 90, 120, 180 }
    },
    [40] = -- Yagrush, Carnwenhan
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(tp / 50 + 10) end },
                 { dsp.mod.ACC, function(tp) return math.floor(tp / 50 - 10) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end, dsp.mod.MYTHIC_OCC_ATT_THRICE, function(tp) return 20 end } },
        duration = { 270, 120, 180 }
    },
    [41] = -- Laevateinn, Murgleis, Tupsimati
    {
        mods = { { dsp.mod.MACC, function(tp) return math.floor(tp / 50 + 10) end },
                 { dsp.mod.MATT, function(tp) return math.floor(tp / 50 - 10) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end, dsp.mod.MYTHIC_OCC_ATT_THRICE, function(tp) return 20 end } },
        duration = { 270, 270, 180 }
    },
    [42] = -- Tizona
    {
        mods = { { dsp.mod.ACC, function(tp) return math.floor(tp / 50 + 10) end },
                 { dsp.mod.MACC, function(tp) return math.floor(tp / 50 - 10) end },
                 { dsp.mod.MYTHIC_OCC_ATT_TWICE, function(tp) return 40 end, dsp.mod.MYTHIC_OCC_ATT_THRICE, function(tp) return 20 end } },
        duration = { 90, 120, 180 }
    },
    [43] = -- Gastraphetes, Death Penalty
    {
        mods = { { dsp.mod.RACC, function(tp) return math.floor(tp / 50 + 10) end },
                 { dsp.mod.RATT, function(tp) return math.floor(tp * 0.6 - 80) end },
                 { dsp.mod.REM_OCC_DO_DOUBLE_DMG_RANGED, function(tp) return 40 end, dsp.mod.REM_OCC_DO_TRIPLE_DMG_RANGED, function(tp) return 20 end } },
        duration = { 90, 120, 180 }
    },

    -----------------------------------
    -- Tier 1 Empyrean
    -----------------------------------
    [44] =
    {
        mod = dsp.mod.REM_OCC_DO_DOUBLE_DMG,
        power = { 30, 40, 50 },
        duration = { 30, 60, 90 }
    },
    
    -----------------------------------
    -- Tier 2 Empyrean
    -----------------------------------
    [45] =
    {
        mod = dsp.mod.REM_OCC_DO_TRIPLE_DMG,
        power = { 30, 40, 50 },
        duration = { 60, 120, 180 }
    }
}

dsp.aftermath.addStatusEffect = function(player, tp, weaponSlot, aftermathType)
    local weapon = player:getStorageItem(0, 0, weaponSlot)
    if not weapon then return end

    local id = weapon:getMod(dsp.mod.AFTERMATH)

    -- Verify the aftermath ID matches the aftermath Type
    local invalid = false
    switch (aftermathType) : caseof
    {
        -- Relic
        [1] = function(x)
            invalid = id > 28
        end,
        
        -- Mythic
        [2] = function(x)
            invalid = id < 29 or id > 43
        end,
        
        -- Empyrean
        [3] = function(x)
            invalid = id < 44
        end
    }
    if invalid then return end

    local aftermath = dsp.aftermath.effects[id]
    if not aftermath then return end

    if not dsp.aftermath.canOverwrite(player, tp, id, aftermathType) then return end

    player:delStatusEffect(dsp.effect.AFTERMATH)
    switch (aftermathType) : caseof
    {
        -- Relic
        [1] = function(x)
            player:addStatusEffect(dsp.effect.AFTERMATH, id, 0, aftermath.duration(tp), 0, tp, aftermathType)
        end,
        
        -- Mythic
        [2] = function(x)
            local tier = math.floor(tp / 1000)
            local icon = dsp.effect["AFTERMATH_LV"..tier]
            player:addStatusEffectEx(dsp.effect.AFTERMATH, icon, id, 0, aftermath.duration[tier], 0, tp, aftermathType)
        end,
        
        -- Empyrean
        [3] = function(x)
            local tier = math.floor(tp / 1000)
            local icon = dsp.effect["AFTERMATH_LV"..tier]
            player:addStatusEffectEx(dsp.effect.AFTERMATH, icon, id, 0, aftermath.duration[tier], 0, tp, aftermathType)
        end
    }
end

-----------------------------------
-- Effect Power = Aftermath ID
-- Effect SubPower = TP
-- Effect Tier = Aftermath Type
-----------------------------------
dsp.aftermath.onEffectGain = function(target, effect)
    local aftermath = dsp.aftermath.effects[effect:getPower()]
    switch (effect:getTier()) : caseof
    {
        -- Relic
        [1] = function(x)
            local pet = nil
            if aftermath.includePets then pet = target:getPet() end
            for i = 1, #aftermath.mods, 2 do
                target:addMod(aftermath.mods[i], aftermath.mods[i + 1])
                if pet then
                    pet:addMod(aftermath.mods[i], aftermath.mods[i + 1])
                end
            end
        end,
        
        -- Mythic
        [2] = function(x)
            local tp = effect:getSubPower()
            local mods = aftermath.mods[math.floor(tp / 1000)]
            local pet = target:getPet()
            for i = 1, #mods, 2 do
                target:addMod(mods[i], mods[i + 1](tp))
                if pet then
                    pet:addMod(mods[i], mods[i + 1](tp))
                end
            end
        end,
        
        -- Empyrean
        [3] = function(x)
            target:addMod(aftermath.mod, aftermath.power[math.floor(effect:getSubPower() / 1000)])
        end
    }
end

dsp.aftermath.onEffectLose = function(target, effect)
    local aftermath = dsp.aftermath.effects[effect:getPower()]
    switch (effect:getTier()) : caseof
    {
        -- Relic
        [1] = function(x)
            local pet = nil
            if aftermath.includePets then pet = target:getPet() end
            for i = 1, #aftermath.mods, 2 do
                target:delMod(aftermath.mods[i], aftermath.mods[i + 1])
                if pet then
                    pet:delMod(aftermath.mods[i], aftermath.mods[i + 1])
                end
            end
        end,
        
        -- Mythic
        [2] = function(x)
            local tp = effect:getSubPower()
            local mods = aftermath.mods[math.floor(tp / 1000)]
            local pet = target:getPet()
            for i = 1, #mods, 2 do
                target:delMod(mods[i], mods[i + 1](tp))
                if pet then
                    pet:delMod(mods[i], mods[i + 1](tp))
                end
            end
        end,
        
        -- Empyrean
        [3] = function(x)
            target:delMod(aftermath.mod, aftermath.power[math.floor(effect:getSubPower() / 1000)])
        end
    }
end

dsp.aftermath.canOverwrite = function(player, tp, aftermathId, aftermathType)
    local effect = player:getStatusEffect(dsp.effect.AFTERMATH)
    if not effect then
        return true
    end

    -- Empyrean > Mythic > Relic 'cause why not?
    if aftermathType < effect:getTier() then
        return false
    end

    local canOverwrite = false
    local aftermath = dsp.aftermath.effects[aftermathId]
    switch (aftermathType) : caseof
    {
        -- Relic
        [1] = function(x)
            local newDuration = aftermath.duration(tp) * 1000
            canOverwrite = newDuration > effect:getTimeRemaining()
        end,

        -- Mythic
        [2] = function(x)
            local currentLevel = math.floor(effect:getSubPower() / 1000)
            local newLevel = math.floor(tp / 1000)
            canOverwrite = currentLevel == 1 or currentLevel < newLevel
        end,

        -- Empyrean
        [3] = function(x)
            local currentLevel = math.floor(effect:getSubPower() / 1000)
            local newLevel = math.floor(tp / 1000)
            canOverwrite = currentLevel == 1 or currentLevel < newLevel
        end,
    }

    return canOverwrite
end