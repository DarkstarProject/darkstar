-----------------------------------
--
-- dsp.effect.ATMA
--
-- Also used for Voidwatch Atmacite (it is a single effect in the client).
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

dsp = dsp or {}
dsp.atma = dsp.atma or {}

local ATMA_OFFSET = dsp.ki.ATMA_OF_THE_LION - 1

local atmaMods =
{
    -- GROUP 1
    [dsp.ki.ATMA_OF_THE_LION]                   = {dsp.mod.TRIPLE_ATTACK, 7, dsp.mod.DMGPHYS, -10, dsp.mod.THUNDERATT, 30},
    [dsp.ki.ATMA_OF_THE_STOUT_ARM]              = {dsp.mod.STR, 40, dsp.mod.ATT, 50, dsp.mod.RATT, 40},
    [dsp.ki.ATMA_OF_THE_TWIN_CLAW]              = {dsp.mod.DEF, 40, dsp.mod.MDEF, 20, dsp.mod.CHARMRES, 20},
    [dsp.ki.ATMA_OF_ALLURE]                     = {dsp.mod.MPP, 30, dsp.mod.MND, 30, dsp.mod.ENMITY, -30},
    [dsp.ki.ATMA_OF_ETERNITY]                   = {dsp.mod.ENEMYCRITRATE, -20, dsp.mod.SLOWRES, 30, dsp.mod.CURSERES, 30},
    [dsp.ki.ATMA_OF_THE_HEAVENS]                = {dsp.mod.MACC, 30, dsp.mod.DMGPHYS, -10, dsp.mod.PARALYZERES, 30},
    [dsp.ki.ATMA_OF_THE_BAYING_MOON]            = {dsp.mod.ATT, 30, dsp.mod.MATT, 30},
    [dsp.ki.ATMA_OF_THE_EBON_HOOF]              = {dsp.mod.HPP, 30, dsp.mod.SLEEPRES, 50},
    [dsp.ki.ATMA_OF_TREMORS]                    = {dsp.mod.DMG, -20, dsp.mod.SILENCERES, 40},
    [dsp.ki.ATMA_OF_THE_SAVAGE_TIGER]           = {dsp.mod.AGI, 30, dsp.mod.DOUBLE_ATTACK, 10},
    [dsp.ki.ATMA_OF_THE_VORACIOUS_VIOLET]       = {dsp.mod.STR, 50, dsp.mod.DOUBLE_ATTACK, 10, dsp.mod.REGAIN, 20},
    [dsp.ki.ATMA_OF_CLOAK_AND_DAGGER]           = {dsp.mod.ACC, 40, dsp.mod.EVA, 40},
    [dsp.ki.ATMA_OF_THE_STORMBIRD]              = {dsp.mod.ACC, 40, dsp.mod.THUNDERATT, 40, dsp.mod.REFRESH, 5},
    [dsp.ki.ATMA_OF_THE_NOXIOUS_FANG]           = {dsp.mod.SUBTLE_BLOW, 40, dsp.mod.WATERATT, 40, dsp.mod.POISONRES, 40},
    [dsp.ki.ATMA_OF_VICISSITUDE]                = {dsp.mod.DEF, 40, dsp.mod.MDEF, 20, dsp.mod.REGEN, 15},
    [dsp.ki.ATMA_OF_THE_BEYOND]                 = {dsp.mod.MATT, 30, dsp.mod.ICEATT, 30, dsp.mod.LIGHTATT, 30},
    [dsp.ki.ATMA_OF_STORMBREATH]                = {dsp.mod.VIT, 30, dsp.mod.DMGBREATH, -30},
    [dsp.ki.ATMA_OF_GALES]                      = {dsp.mod.WINDATT, 30, dsp.mod.WINDACC, 30},
    [dsp.ki.ATMA_OF_THRASHING_TENDRILS]         = {dsp.mod.CHR, 30, dsp.mod.CRITHITRATE, 20},
    [dsp.ki.ATMA_OF_THE_DRIFTER]                = {dsp.mod.RATT, 30, dsp.mod.RACC, 40},
    [dsp.ki.ATMA_OF_THE_STRONGHOLD]             = {dsp.mod.ATT, 40, dsp.mod.DEF, 40, dsp.mod.REGEN, 15},
    [dsp.ki.ATMA_OF_THE_HARVESTER]              = {dsp.mod.STR, 30, dsp.mod.DOUBLE_ATTACK, 10, dsp.mod.SLEEPRES, 40},
    [dsp.ki.ATMA_OF_DUNES]                      = {dsp.mod.STORETP, 20, dsp.mod.SLOWRES, 40},
    [dsp.ki.ATMA_OF_THE_COSMOS]                 = {dsp.mod.DARKATT, 40, dsp.mod.AMNESIARES, 40, dsp.mod.SILENCERES, 40},
    [dsp.ki.ATMA_OF_THE_SIREN_SHADOW]           = {dsp.mod.ATT, 40, dsp.mod.EVA, 40, dsp.mod.PARALYZERES, 40},
    [dsp.ki.ATMA_OF_THE_IMPALER]                = {dsp.mod.DOUBLE_ATTACK, 20, dsp.mod.BINDRES, 40, dsp.mod.BLINDRES, 40},
    [dsp.ki.ATMA_OF_THE_ADAMANTINE]             = {dsp.mod.VIT, 20, dsp.mod.DEF, 40},
    [dsp.ki.ATMA_OF_CALAMITY]                   = {dsp.mod.SLOWRES, 40, dsp.mod.BLINDRES, 40},
    [dsp.ki.ATMA_OF_THE_CLAW]                   = {dsp.mod.EARTHATT, 30, dsp.mod.EARTHACC, 40},
    [dsp.ki.ATMA_OF_BALEFUL_BONES]              = {dsp.mod.STR, 20, dsp.mod.DARKACC, 40},
    [dsp.ki.ATMA_OF_THE_CLAWED_BUTTERFLY]       = {dsp.mod.FIREACC, 40, dsp.mod.INT, 30},
    [dsp.ki.ATMA_OF_THE_DESERT_WORM]            = {dsp.mod.MND, 20, dsp.mod.ACC, 40, dsp.mod.MAGIC_NULL, 5},
    [dsp.ki.ATMA_OF_THE_UNDYING]                = {dsp.mod.MND, 40, dsp.mod.CONSERVE_MP, 10, dsp.mod.ICEATT, 20},
    [dsp.ki.ATMA_OF_THE_IMPREGNABLE_TOWER]      = {dsp.mod.HPP, 30, dsp.mod.MACC, 40, dsp.mod.MATT, 40},
    [dsp.ki.ATMA_OF_THE_SMOLDERING_SKY]         = {dsp.mod.ATT, 20, dsp.mod.MACC, 40, dsp.mod.FIREATT, 30},
    [dsp.ki.ATMA_OF_THE_DEMONIC_SKEWER]         = {dsp.mod.STR, 20, dsp.mod.TP_BONUS, 20, dsp.mod.NULL_PHYSICAL_DAMAGE, 5},
    [dsp.ki.ATMA_OF_THE_GOLDEN_CLAW]            = {dsp.mod.SKILLCHAINBONUS, 20, dsp.mod.STR, 20},
    [dsp.ki.ATMA_OF_THE_GLUTINOUS_OOZE]         = {dsp.mod.MND, 20, dsp.mod.WATERACC, 20},
    [dsp.ki.ATMA_OF_THE_LIGHTNING_BEAST]        = {dsp.mod.FASTCAST, 20, dsp.mod.SPELLINTERRUPT, 20},
    [dsp.ki.ATMA_OF_THE_NOXIOUS_BLOOM]          = {dsp.mod.STORETP, 20, dsp.mod.WALTZ_POTENTCY, 10},
    [dsp.ki.ATMA_OF_THE_GNARLED_HORN]           = {dsp.mod.AGI, 50, dsp.mod.CRITHITRATE, 20, dsp.mod.COUNTER, 10},
    [dsp.ki.ATMA_OF_THE_STRANGLING_WIND]        = {dsp.mod.STR, 20, dsp.mod.VIT, 20, dsp.mod.AGI, 30},
    [dsp.ki.ATMA_OF_THE_DEEP_DEVOURER]          = {dsp.mod.SUBTLE_BLOW, 5, dsp.mod.STORETP, 5, dsp.mod.SONG_SPELLCASTING_TIME, 20},
    [dsp.ki.ATMA_OF_THE_MOUNTED_CHAMPION]       = {dsp.mod.VIT, 50, dsp.mod.REGEN, 20, dsp.mod.ENMITY_REDUCTION_PHYSICAL, -20},
    [dsp.ki.ATMA_OF_THE_RAZED_RUINS]            = {dsp.mod.DEX, 50, dsp.mod.CRITHITRATE, 30, dsp.mod.CRIT_DMG_INCREASE, 30},
    [dsp.ki.ATMA_OF_THE_BLUDGEONING_BRUTE]      = {dsp.mod.REGAIN, 10, dsp.mod.THUNDERRES, 50, dsp.mod.WATERRES, 50},
    [dsp.ki.ATMA_OF_THE_RAPID_REPTILIAN]        = {dsp.mod.TRIPLE_ATTACK, 5, dsp.mod.DMGBREATH, -40},
    [dsp.ki.ATMA_OF_THE_WINGED_ENIGMA]          = {dsp.mod.HASTE_GEAR, 100},
    [dsp.ki.ATMA_OF_THE_CRADLE]                 = {dsp.mod.VIT, 20, dsp.mod.DEX, 20},
    [dsp.ki.ATMA_OF_THE_UNTOUCHED]              = {dsp.mod.CHR, 20, dsp.mod.TRIPLE_ATTACK, 5},
    [dsp.ki.ATMA_OF_THE_SANGUINE_SCYTHE]        = {dsp.mod.HPP, 20, dsp.mod.CRIT_DMG_INCREASE, 30, dsp.mod.ENMITY, 20},
    [dsp.ki.ATMA_OF_THE_TUSKED_TERROR]          = {dsp.mod.FASTCAST, 20, dsp.mod.WATERATT, 20, dsp.mod.WATERACC, 20},
    [dsp.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY]    = {dsp.mod.REFRESH, 10, dsp.mod.INT, 50, dsp.mod.ENMITY, -20},
    [dsp.ki.ATMA_OF_THE_WOULD_BE_KING]          = {dsp.mod.REGAIN, 100, dsp.mod.STORETP, 20, dsp.mod.TP_BONUS, 20},
    [dsp.ki.ATMA_OF_THE_BLINDING_HORN]          = {dsp.mod.CONSERVE_MP, 20, dsp.mod.THUNDERATT, 30, dsp.mod.DMGMAGIC, -20},
    [dsp.ki.ATMA_OF_THE_DEMONIC_LASH]           = {dsp.mod.ATT, 40, dsp.mod.DOUBLE_ATTACK, 10, dsp.mod.MAGIC_ABSORB, 20},
    [dsp.ki.ATMA_OF_APPARITIONS]                = {dsp.mod.EVA, 20, dsp.mod.WINDRES, 50},
    [dsp.ki.ATMA_OF_THE_SHIMMERING_SHELL]       = {dsp.mod.AGI, 20, dsp.mod.FIRERES, 50},
    [dsp.ki.ATMA_OF_THE_MURKY_MIASMA]           = {dsp.mod.DARKRES, 50, dsp.mod.STUNRES, 30},
    [dsp.ki.ATMA_OF_THE_AVARICIOUS_APE]         = {dsp.mod.HASTE_GEAR, 100}, -- not implemented: Monster Correlation
    [dsp.ki.ATMA_OF_THE_MERCILESS_MATRIARCH]    = {dsp.mod.MACC, 50, dsp.mod.FASTCAST, 20, dsp.mod.ENMITY, -50},
    [dsp.ki.ATMA_OF_THE_BROTHER_WOLF]           = {dsp.mod.MATT, 20, dsp.mod.MDEF, 20, dsp.mod.FIRERES, 100},
    [dsp.ki.ATMA_OF_THE_EARTH_WYRM]             = {dsp.mod.EARTHRES, 100, dsp.mod.DMG, -20, dsp.mod.FORCE_EARTH_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_ASCENDING_ONE]          = {dsp.mod.WINDRES, 100, dsp.mod.HASTE_GEAR, 500, dsp.mod.SNAP_SHOT, 5},
    [dsp.ki.ATMA_OF_THE_SCORPION_QUEEN]         = {dsp.mod.STORETP, 20, dsp.mod.CRITHITRATE, 30, dsp.mod.BINDRES, 50},
    [dsp.ki.ATMA_OF_A_THOUSAND_NEEDLES]         = {dsp.mod.HPP, 20, dsp.mod.MPP, 20, dsp.mod.DEX, 10},
    [dsp.ki.ATMA_OF_THE_BURNING_EFFIGY]         = {dsp.mod.STR, 20, dsp.mod.FORCE_FIRE_DWBONUS, 1}, -- fire based ws + 0.2 fTP] = {},
    [dsp.ki.ATMA_OF_THE_SMITING_BLOW]           = {dsp.mod.TP_BONUS, 50, dsp.mod.WSACC, 50},
    [dsp.ki.ATMA_OF_THE_LONE_WOLF]              = {dsp.mod.ATT, 20, dsp.mod.FIREATT, 30},
    [dsp.ki.ATMA_OF_THE_CRIMSON_SCALE]          = {dsp.mod.HASTE_GEAR, 300, dsp.mod.ENMITY, -20},
    [dsp.ki.ATMA_OF_THE_SCARLET_WING]           = {dsp.mod.ELEM, 10, dsp.mod.FORCE_WIND_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_RAISED_TAIL]            = {dsp.mod.ATT, 40, dsp.mod.EVA, 40},
    [dsp.ki.ATMA_OF_THE_SAND_EMPEROR]           = {dsp.mod.ACC, 40, dsp.mod.EVA, 40},
    [dsp.ki.ATMA_OF_THE_OMNIPOTENT]             = {dsp.mod.DEX, 50, dsp.mod.HASTE_GEAR, 1000, dsp.mod.ENMITY, 20},
    [dsp.ki.ATMA_OF_THE_WAR_LION]               = {dsp.mod.DEX, 20, dsp.mod.THUNDERRES, 100, dsp.mod.FORCE_LIGHTNING_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_FROZEN_FETTERS]         = {dsp.mod.INT, 20, dsp.mod.ICERES, 100, dsp.mod.FORCE_ICE_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_PLAGUEBRINGER]          = {dsp.mod.REGEN, 10, dsp.mod.STORETP, 20, dsp.mod.DOUBLE_ATTACK, 7},
    [dsp.ki.ATMA_OF_THE_SHRIEKING_ONE]          = {dsp.mod.DEF, 60, dsp.mod.MDEF, 20, dsp.mod.STORETP, 20},
    [dsp.ki.ATMA_OF_THE_HOLY_MOUNTAIN]          = {dsp.mod.LIGHTRES, 100, dsp.mod.LIGHTACC, 50, dsp.mod.FORCE_LIGHT_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_LAKE_LURKER]            = {dsp.mod.MND, 20, dsp.mod.WATERRES, 100, dsp.mod.FORCE_WATER_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_CRUSHING_CUDGEL]        = {dsp.mod.ACC, 20, dsp.mod.SKILLCHAINDMG, 5},
    [dsp.ki.ATMA_OF_PURGATORY]                  = {dsp.mod.VIT, 40, dsp.mod.INT, 40},
    [dsp.ki.ATMA_OF_BLIGHTED_BREATH]            = {dsp.mod.SONG_SPELLCASTING_TIME, 40, dsp.mod.LIGHTACC, 40},
    [dsp.ki.ATMA_OF_THE_PERSISTENT_PREDATOR]    = {dsp.mod.STORETP, 40, dsp.mod.TP_BONUS, 10},
    [dsp.ki.ATMA_OF_THE_STONE_GOD]              = {dsp.mod.SUBTLE_BLOW, 40, dsp.mod.ENMITY, 40},
    [dsp.ki.ATMA_OF_THE_SUN_EATER]              = {dsp.mod.STORETP, 40, dsp.mod.TP_BONUS, 40},
    [dsp.ki.ATMA_OF_THE_DESPOT]                 = {dsp.mod.CHR, 50, dsp.mod.MAGIC_ABSORB, 15, dsp.mod.TP_BONUS, 40},
    [dsp.ki.ATMA_OF_THE_SOLITARY_ONE]           = {dsp.mod.TRIPLE_ATTACK, 7, dsp.mod.DMGBREATH, -25, dsp.mod.ZANSHIN, 10},
    [dsp.ki.ATMA_OF_THE_WINGED_GLOOM]           = {dsp.mod.DMG, -25, dsp.mod.REGEN, 2},
    [dsp.ki.ATMA_OF_THE_SEA_DAUGHTER]           = {dsp.mod.REGAIN, 50, dsp.mod.HASTE_GEAR, -1500, dsp.mod.REGEN, 30},
    [dsp.ki.ATMA_OF_THE_HATEFUL_STREAM]         = {}, -- Not yet implemented. No easy way to do this ATMA. No way I am doing bit crap in onTick for it..
    [dsp.ki.ATMA_OF_THE_FOE_FLAYER]             = {dsp.mod.MPP, 20, dsp.mod.REFRESH, 20, dsp.mod.FASTCAST, 20, dsp.mod.MACC, 50},
    [dsp.ki.ATMA_OF_THE_ENDLESS_NIGHTMARE]      = {dsp.mod.MND, 20, dsp.mod.DARKRES, 100, dsp.mod.FORCE_DARK_DWBONUS, 1},
    [dsp.ki.ATMA_OF_THE_SUNDERING_SLASH]        = {dsp.mod.ATT, 20, dsp.mod.REGAIN, 30},
    [dsp.ki.ATMA_OF_ENTWINED_SERPENTS]          = {dsp.mod.ATT, 20, dsp.mod.DOUBLE_ATTACK, 15},
    [dsp.ki.ATMA_OF_THE_HORNED_BEAST]           = {dsp.mod.ACC, 60, dsp.mod.PETRIFYRES, 50},
    [dsp.ki.ATMA_OF_AQUATIC_ARDOR]              = {dsp.mod.ABSORB_DMG_CHANCE, 6, dsp.mod.MAGIC_ABSORB, 6},
    [dsp.ki.ATMA_OF_THE_FALLEN_ONE]             = {dsp.mod.INT, 30, dsp.mod.MND, 30},
    [dsp.ki.ATMA_OF_FIRES_AND_FLARES]           = {dsp.mod.AGI, 20, dsp.mod.RATT, 40},
    [dsp.ki.ATMA_OF_THE_APOCALYPSE]             = {dsp.mod.TRIPLE_ATTACK, 15, dsp.mod.RERAISE_III, 1, dsp.mod.QUICK_MAGIC, 10},
    
    -- GROUP 2
    [dsp.ki.ATMA_OF_THE_HEIR]                   = {},
    [dsp.ki.ATMA_OF_THE_HERO]                   = {},
    [dsp.ki.ATMA_OF_THE_FULL_MOON]              = {},
    [dsp.ki.ATMA_OF_ILLUSIONS]                  = {},
    [dsp.ki.ATMA_OF_THE_BANISHER]               = {},
    [dsp.ki.ATMA_OF_THE_SELLSWORD]              = {},
    [dsp.ki.ATMA_OF_A_FUTURE_FABULOUS]          = {},
    [dsp.ki.ATMA_OF_CAMARADERIE]                = {},
    [dsp.ki.ATMA_OF_THE_TRUTHSEEKER]            = {},
    [dsp.ki.ATMA_OF_THE_AZURE_SKY]              = {},
    [dsp.ki.ATMA_OF_ECHOES]                     = {},
    [dsp.ki.ATMA_OF_DREAD]                      = {},
    [dsp.ki.ATMA_OF_AMBITION]                   = {},
    [dsp.ki.ATMA_OF_THE_BEAST_KING]             = {},
    [dsp.ki.ATMA_OF_THE_KIRIN]                  = {},
    [dsp.ki.ATMA_OF_HELLS_GUARDIAN]             = {},
    [dsp.ki.ATMA_OF_LUMINOUS_WINGS]             = {},
    [dsp.ki.ATMA_OF_THE_DRAGON_RIDER]           = {},
    [dsp.ki.ATMA_OF_THE_IMPENETRABLE]           = {},
    [dsp.ki.ATMA_OF_ALPHA_AND_OMEGA]            = {},
    [dsp.ki.ATMA_OF_THE_ULTIMATE]               = {},
    [dsp.ki.ATMA_OF_THE_HYBRID_BEAST]           = {},
    [dsp.ki.ATMA_OF_THE_DARK_DEPTHS]            = {},
    [dsp.ki.ATMA_OF_THE_ZENITH]                 = {},
    [dsp.ki.ATMA_OF_PERFECT_ATTENDANCE]         = {},
    [dsp.ki.ATMA_OF_THE_RESCUER]                = {},
    [dsp.ki.ATMA_OF_NIGHTMARES]                 = {},
    [dsp.ki.ATMA_OF_THE_EINHERJAR]              = {},
    [dsp.ki.ATMA_OF_THE_ILLUMINATOR]            = {},
    [dsp.ki.ATMA_OF_THE_BUSHIN]                 = {},
    [dsp.ki.ATMA_OF_THE_ACE_ANGLER]             = {},
    [dsp.ki.ATMA_OF_THE_MASTER_CRAFTER]         = {},
    [dsp.ki.ATMA_OF_INGENUITY]                  = {},
    [dsp.ki.ATMA_OF_THE_GRIFFONS_CLAW]          = {},
    [dsp.ki.ATMA_OF_THE_FETCHING_FOOTPAD]       = {},
    [dsp.ki.ATMA_OF_UNDYING_LOYALTY]            = {},
    [dsp.ki.ATMA_OF_THE_ROYAL_LINEAGE]          = {},
    [dsp.ki.ATMA_OF_THE_SHATTERING_STAR]        = {},
    [dsp.ki.ATMA_OF_THE_COBRA_COMMANDER]        = {},
    [dsp.ki.ATMA_OF_ROARING_LAUGHTER]           = {},
    [dsp.ki.ATMA_OF_THE_DARK_BLADE]             = {},
    [dsp.ki.ATMA_OF_THE_DUCAL_GUARD]            = {},
    [dsp.ki.ATMA_OF_HARMONY]                    = {},
    [dsp.ki.ATMA_OF_REVELATIONS]                = {},
    [dsp.ki.ATMA_OF_THE_SAVIOR]                 = {},
}

dsp.atma.onEffectGain = function(target, effect)
    local atma = ATMA_OFFSET + effect:getPower()
    local mods = atmaMods[atma]
    if mods ~= nil then
        for i = 1, #mods, 2 do
            target:addMod(i, i + 1)
        end
    end
end

dsp.atma.onEffectLose = function(target, effect)
    local atma = ATMA_OFFSET + effect:getPower()
    local mods = atmaMods[atma]
    if mods ~= nil then
        for i = 1, #mods, 2 do
            target:delMod(i, i + 1)
        end
    end
end
