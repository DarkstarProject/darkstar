-----------------------------------
--
-- dsp.effect.ATMA
--
-- Also used for Voidwatch Atmacite
-- (it is a single effect in the client).
-- Todo: table this BS / ditch these functions
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function atmaEffectGain(target, effect)
    local pwr = effect:getPower();
    if (pwr == 1) then -- ATMA of the Lion
        target:addMod(dsp.mod.TRIPLE_ATTACK, 7);
        target:addMod(dsp.mod.DMGPHYS, -10);
        target:addMod(dsp.mod.THUNDERATT, 30);
    elseif (pwr == 2) then -- dsp.ki.ATMA_OF_THE_STOUT_ARM
        target:addMod(dsp.mod.STR, 40);
        target:addMod(dsp.mod.ATT, 50);
        target:addMod(dsp.mod.RATT, 40);
    elseif (pwr == 3) then -- dsp.ki.ATMA_OF_THE_TWIN_CLAW
        target:addMod(dsp.mod.DEF, 40);
        target:addMod(dsp.mod.MDEF, 20);
        target:addMod(dsp.mod.CHARMRES, 20);
    elseif (pwr == 4) then -- dsp.ki.ATMA_OF_ALLURE
        target:addMod(dsp.mod.MPP, 30);
        target:addMod(dsp.mod.MND, 30);
        target:addMod(dsp.mod.ENMITY, -30);
    elseif (pwr == 5) then -- dsp.ki.ATMA_OF_ETERNITY
        target:addMod(dsp.mod.ENEMYCRITRATE, -20);
        target:addMod(dsp.mod.SLOWRES, 30);
        target:addMod(dsp.mod.CURSERES, 30);
    elseif (pwr == 6) then -- dsp.ki.ATMA_OF_THE_HEAVENS
        target:addMod(dsp.mod.MACC, 30);
        target:addMod(dsp.mod.DMGPHYS, -10);
        target:addMod(dsp.mod.PARALYZERES, 30);
    elseif (pwr == 7) then -- dsp.ki.ATMA_OF_THE_BAYING_MOON
        target:addMod(dsp.mod.ATT, 30);
        target:addMod(dsp.mod.MATT, 30);
    elseif (pwr == 8) then -- dsp.ki.ATMA_OF_THE_EBON_HOOF
        target:addMod(dsp.mod.HPP, 30);
        target:addMod(dsp.mod.SLEEPRES, 50);
    elseif (pwr == 9) then -- dsp.ki.ATMA_OF_TREMORS
        target:addMod(dsp.mod.DMG, -20);
        target:addMod(dsp.mod.SILENCERES, 40);
    elseif (pwr == 10) then -- dsp.ki.ATMA_OF_THE_SAVAGE_TIGER
        target:addMod(dsp.mod.AGI, 30);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 10);
    elseif (pwr == 11) then -- dsp.ki.ATMA_OF_THE_VORACIOUS_VIOLET
        target:addMod(dsp.mod.STR, 50);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:addMod(dsp.mod.REGAIN, 20);
    elseif (pwr == 12) then -- dsp.ki.ATMA_OF_CLOAK_AND_DAGGER
        target:addMod(dsp.mod.ACC, 40);
        target:addMod(dsp.mod.EVA, 40);
    elseif (pwr == 13) then -- dsp.ki.ATMA_OF_THE_STORMBIRD
        target:addMod(dsp.mod.ACC, 40);
        target:addMod(dsp.mod.THUNDERATT, 40);
        target:addMod(dsp.mod.REFRESH, 5);
    elseif (pwr == 14) then -- dsp.ki.ATMA_OF_THE_NOXIOUS_FANG
        target:addMod(dsp.mod.SUBTLE_BLOW, 40);
        target:addMod(dsp.mod.WATERATT, 40);
        target:addMod(dsp.mod.POISONRES, 40);
    elseif (pwr == 15) then -- dsp.ki.ATMA_OF_VICISSITUDE
        target:addMod(dsp.mod.DEF, 40);
        target:addMod(dsp.mod.MDEF, 20);
        target:addMod(dsp.mod.REGEN, 15);
    elseif (pwr == 16) then -- dsp.ki.ATMA_OF_THE_BEYOND
        target:addMod(dsp.mod.MATT, 30);
        target:addMod(dsp.mod.ICEATT, 30);
        target:addMod(dsp.mod.LIGHTATT, 30);
    elseif (pwr == 17) then -- dsp.ki.ATMA_OF_STORMBREATH
        target:addMod(dsp.mod.VIT, 30);
        target:addMod(dsp.mod.DMGBREATH, -30);
    elseif (pwr == 18) then -- dsp.ki.ATMA_OF_GALES
        target:addMod(dsp.mod.WINDATT, 30);
        target:addMod(dsp.mod.WINDACC, 30);
    elseif (pwr == 19) then -- dsp.ki.ATMA_OF_THRASHING_TENDRILS
        target:addMod(dsp.mod.CHR, 30);
        target:addMod(dsp.mod.CRITHITRATE, 20);
    elseif (pwr == 20) then -- dsp.ki.ATMA_OF_THE_DRIFTER
        target:addMod(dsp.mod.RATT, 30);
        target:addMod(dsp.mod.RACC, 40);
    elseif (pwr == 21) then -- dsp.ki.ATMA_OF_THE_STRONGHOLD
        target:addMod(dsp.mod.ATT, 40);
        target:addMod(dsp.mod.DEF, 40);
        target:addMod(dsp.mod.REGEN, 15);
    elseif (pwr == 22) then -- dsp.ki.ATMA_OF_THE_HARVESTER
        target:addMod(dsp.mod.STR, 30);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:addMod(dsp.mod.SLEEPRES, 40);
    elseif (pwr == 23) then -- dsp.ki.ATMA_OF_DUNES
        target:addMod(dsp.mod.STORETP, 20);
        target:addMod(dsp.mod.SLOWRES, 40);
    elseif (pwr == 24) then -- dsp.ki.ATMA_OF_THE_COSMOS
        target:addMod(dsp.mod.DARKATT, 40);
        target:addMod(dsp.mod.AMNESIARES, 40);
        target:addMod(dsp.mod.SILENCERES, 40);
    elseif (pwr == 25) then -- dsp.ki.ATMA_OF_THE_SIREN_SHADOW
        target:addMod(dsp.mod.ATT, 40);
        target:addMod(dsp.mod.EVA, 40);
        target:addMod(dsp.mod.PARALYZERES, 40);
    elseif (pwr == 26) then -- dsp.ki.ATMA_OF_THE_IMPALER
        target:addMod(dsp.mod.DOUBLE_ATTACK, 20);
        target:addMod(dsp.mod.BINDRES, 40);
        target:addMod(dsp.mod.BLINDRES, 40);
    elseif (pwr == 27) then -- dsp.ki.ATMA_OF_THE_ADAMANTINE
        target:addMod(dsp.mod.VIT, 20);
        target:addMod(dsp.mod.DEF, 40);
    elseif (pwr == 28) then -- dsp.ki.ATMA_OF_CALAMITY
        target:addMod(dsp.mod.SLOWRES, 40);
        target:addMod(dsp.mod.BLINDRES, 40);
    elseif (pwr == 29) then -- dsp.ki.ATMA_OF_THE_CLAW
        target:addMod(dsp.mod.EARTHATT, 30);
        target:addMod(dsp.mod.EARTHACC, 40);
    elseif (pwr == 30) then -- dsp.ki.ATMA_OF_BALEFUL_BONES
        target:addMod(dsp.mod.STR, 20);
        target:addMod(dsp.mod.DARKACC, 40)
    elseif (pwr == 31) then -- dsp.ki.ATMA_OF_THE_CLAWED_BUTTERFLY
        target:addMod(dsp.mod.FIREACC, 40);
        target:addMod(dsp.mod.INT, 30);
    elseif (pwr == 32) then -- dsp.ki.ATMA_OF_THE_DESERT_WORM
        target:addMod(dsp.mod.MND, 20);
        target:addMod(dsp.mod.ACC, 40);
        target:addMod(dsp.mod.MAGIC_NULL, 5);
    elseif (pwr == 33) then -- dsp.ki.ATMA_OF_THE_UNDYING
        target:addMod(dsp.mod.MND, 40);
        target:addMod(dsp.mod.CONSERVE_MP, 10);
        target:addMod(dsp.mod.ICEATT, 20);
    elseif (pwr == 34) then -- dsp.ki.ATMA_OF_THE_IMPREGNABLE_TOWER
        target:addMod(dsp.mod.HPP, 30);
        target:addMod(dsp.mod.MACC, 40);
        target:addMod(dsp.mod.MATT, 40);
    elseif (pwr == 35) then -- dsp.ki.ATMA_OF_THE_SMOLDERING_SKY
        target:addMod(dsp.mod.ATT, 20);
        target:addMod(dsp.mod.MACC, 40);
        target:addMod(dsp.mod.FIREATT, 30);
    elseif (pwr == 36) then -- dsp.ki.ATMA_OF_THE_DEMONIC_SKEWER
        target:addMod(dsp.mod.STR, 20);
        target:addMod(dsp.mod.TP_BONUS, 20);
        target:addMod(dsp.mod.NULL_PHYSICAL_DAMAGE, 5);
    elseif (pwr == 37) then -- dsp.ki.ATMA_OF_THE_GOLDEN_CLAW
        target:addMod(dsp.mod.SKILLCHAINBONUS, 20);
        target:addMod(dsp.mod.STR, 20);
    elseif (pwr == 38) then -- dsp.ki.ATMA_OF_THE_GLUTINOUS_OOZE
        target:addMod(dsp.mod.MND, 20);
        target:addMod(dsp.mod.WATERACC, 20);
    elseif (pwr == 39) then -- dsp.ki.ATMA_OF_THE_LIGHTNING_BEAST
        target:addMod(dsp.mod.FASTCAST, 20);
        target:addMod(dsp.mod.SPELLINTERRUPT, 20);
    elseif (pwr == 40) then -- dsp.ki.ATMA_OF_THE_NOXIOUS_BLOOM
        target:addMod(dsp.mod.STORETP, 20);
        target:addMod(dsp.mod.WALTZ_POTENTCY, 10);
    elseif (pwr == 41) then -- dsp.ki.ATMA_OF_THE_GNARLED_HORN
        target:addMod(dsp.mod.AGI, 50);
        target:addMod(dsp.mod.CRITHITRATE, 20);
        target:addMod(dsp.mod.COUNTER, 10);
    elseif (pwr == 42) then -- dsp.ki.ATMA_OF_THE_STRANGLING_WIND
        target:addMod(dsp.mod.STR, 20);
        target:addMod(dsp.mod.VIT, 20);
        target:addMod(dsp.mod.AGI, 30);
    elseif (pwr == 43) then -- dsp.ki.ATMA_OF_THE_DEEP_DEVOURER
        target:addMod(dsp.mod.SUBTLE_BLOW, 5);
        target:addMod(dsp.mod.STORETP, 5);
        target:addMod(dsp.mod.SONG_SPELLCASTING_TIME, 20);
    elseif (pwr == 44) then -- dsp.ki.ATMA_OF_THE_MOUNTED_CHAMPION
        target:addMod(dsp.mod.VIT, 50);
        target:addMod(dsp.mod.REGEN, 20);
        target:addMod(dsp.mod.ENMITY_REDUCTION_PHYSICAL, -20);
    elseif (pwr == 45) then -- dsp.ki.ATMA_OF_THE_RAZED_RUINS
        target:addMod(dsp.mod.DEX, 50);
        target:addMod(dsp.mod.CRITHITRATE, 30);
        target:addMod(dsp.mod.CRIT_DMG_INCREASE, 30);
    elseif (pwr == 46) then -- dsp.ki.ATMA_OF_THE_BLUDGEONING_BRUTE
        target:addMod(dsp.mod.REGAIN, 10);
        target:addMod(dsp.mod.THUNDERRES, 50);
        target:addMod(dsp.mod.WATERRES, 50);
    elseif (pwr == 47) then -- dsp.ki.ATMA_OF_THE_RAPID_REPTILIAN
        target:addMod(dsp.mod.TRIPLE_ATTACK, 5);
        target:addMod(dsp.mod.DMGBREATH, -40);
    elseif (pwr == 48) then -- dsp.ki.ATMA_OF_THE_WINGED_ENIGMA
        target:addMod(dsp.mod.HASTE_GEAR, 5);
    elseif (pwr == 49) then -- dsp.ki.ATMA_OF_THE_CRADLE
        target:addMod(dsp.mod.VIT, 20);
        target:addMod(dsp.mod.DEX, 20);
    elseif (pwr == 50) then -- dsp.ki.ATMA_OF_THE_UNTOUCHED
        target:addMod(dsp.mod.CHR, 20);
        target:addMod(dsp.mod.TRIPLE_ATTACK, 5);
    elseif (pwr == 51) then -- dsp.ki.ATMA_OF_THE_SANGUINE_SCYTHE
        target:addMod(dsp.mod.HPP, 20);
        target:addMod(dsp.mod.CRIT_DMG_INCREASE, 30);
        target:addMod(dsp.mod.ENMITY, 20);
    elseif (pwr == 52) then -- dsp.ki.ATMA_OF_THE_TUSKED_TERROR
        target:addMod(dsp.mod.FASTCAST, 20);
        target:addMod(dsp.mod.WATERATT, 20);
        target:addMod(dsp.mod.WATERACC, 20);
    elseif (pwr == 53) then -- dsp.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY
        target:addMod(dsp.mod.REFRESH, 10);
        target:addMod(dsp.mod.INT, 50);
        target:addMod(dsp.mod.ENMITY, -20);
    elseif (pwr == 54) then -- dsp.ki.ATMA_OF_THE_WOULD_BE_KING
        target:addMod(dsp.mod.REGAIN, 100);
        target:addMod(dsp.mod.STORETP, 20);
        target:addMod(dsp.mod.TP_BONUS, 20);
    elseif (pwr == 55) then -- dsp.ki.ATMA_OF_THE_BLINDING_HORN
        target:addMod(dsp.mod.CONSERVE_MP, 20);
        target:addMod(dsp.mod.THUNDERATT, 30);
        target:addMod(dsp.mod.DMGMAGIC, -20);
    elseif (pwr == 56) then -- dsp.ki.ATMA_OF_THE_DEMONIC_LASH
        target:addMod(dsp.mod.ATT, 40);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:addMod(dsp.mod.MAGIC_ABSORB, 20);
    elseif (pwr == 57) then -- dsp.ki.ATMA_OF_APPARITIONS
        target:addMod(dsp.mod.EVA, 20);
        target:addMod(dsp.mod.WINDRES, 50);
    elseif (pwr == 58) then -- dsp.ki.ATMA_OF_THE_SHIMMERING_SHELL
        target:addMod(dsp.mod.AGI, 20);
        target:addMod(dsp.mod.FIRERES, 50);
    elseif (pwr == 59) then -- dsp.ki.ATMA_OF_THE_MURKY_MIASMA
        target:addMod(dsp.mod.DARKRES, 50);
        target:addMod(dsp.mod.STUNRES, 30);
    elseif (pwr == 60) then -- dsp.ki.ATMA_OF_THE_AVARICIOUS_APE
        target:addMod(dsp.mod.HASTE_GEAR, 5);
        -- not implemented: Monster Correlation
    elseif (pwr == 61) then -- dsp.ki.ATMA_OF_THE_MERCILESS_MATRIARCH
        target:addMod(dsp.mod.MACC, 50);
        target:addMod(dsp.mod.FASTCAST, 20);
        target:addMod(dsp.mod.ENMITY, -50);
    elseif (pwr == 62) then -- dsp.ki.ATMA_OF_THE_BROTHER_WOLF
        target:addMod(dsp.mod.MATT, 20);
        target:addMod(dsp.mod.MDEF, 20);
        target:addMod(dsp.mod.FIRERES, 100);
    elseif (pwr == 63) then -- dsp.ki.ATMA_OF_THE_EARTH_WYRM
        target:addMod(dsp.mod.EARTHRES, 100);
        target:addMod(dsp.mod.DMG, -20);
        target:addMod(dsp.mod.FORCE_EARTH_DWBONUS, 1);
    elseif (pwr == 64) then -- dsp.ki.ATMA_OF_THE_ASCENDING_ONE
        target:addMod(dsp.mod.WINDRES, 100);
        target:addMod(dsp.mod.HASTE_GEAR, 5);
        target:addMod(dsp.mod.SNAP_SHOT, 5);
    elseif (pwr == 65) then -- dsp.ki.ATMA_OF_THE_SCORPION_QUEEN
        target:addMod(dsp.mod.STORETP, 20);
        target:addMod(dsp.mod.CRITHITRATE, 30);
        target:addMod(dsp.mod.BINDRES, 50);
    elseif (pwr == 66) then -- dsp.ki.ATMA_OF_A_THOUSAND_NEEDLES
        target:addMod(dsp.mod.HPP, 20);
        target:addMod(dsp.mod.MPP, 20);
        target:addMod(dsp.mod.DEX, 10);
    elseif (pwr == 67) then -- dsp.ki.ATMA_OF_THE_BURNING_EFFIGY
        target:addMod(dsp.mod.STR, 20);
        -- fire based ws + 0.2 fTP
        target:addMod(dsp.mod.FORCE_FIRE_DWBONUS, 1);
    elseif (pwr == 68) then -- dsp.ki.ATMA_OF_THE_SMITING_BLOW
        target:addMod(dsp.mod.TP_BONUS, 50);
        target:addMod(dsp.mod.WSACC, 50);
    elseif (pwr == 69) then -- dsp.ki.ATMA_OF_THE_LONE_WOLF
        target:addMod(dsp.mod.ATT, 20);
        target:addMod(dsp.mod.FIREATT, 30);
    elseif (pwr == 70) then -- dsp.ki.ATMA_OF_THE_CRIMSON_SCALE
        target:addMod(dsp.mod.HASTE_GEAR, 5);
        target:addMod(dsp.mod.ENMITY, -20);
    elseif (pwr == 71) then -- dsp.ki.ATMA_OF_THE_SCARLET_WING
        target:addMod(dsp.mod.ELEM, 10);
        target:addMod(dsp.mod.FORCE_WIND_DWBONUS, 1);
    elseif (pwr == 72) then -- dsp.ki.ATMA_OF_THE_RAISED_TAIL
        target:addMod(dsp.mod.ATT, 40);
        target:addMod(dsp.mod.EVA, 40);
    elseif (pwr == 73) then -- dsp.ki.ATMA_OF_THE_SAND_EMPEROR
        target:addMod(dsp.mod.ACC, 40);
        target:addMod(dsp.mod.EVA, 40);
    elseif (pwr == 74) then -- dsp.ki.ATMA_OF_THE_OMNIPOTENT
        target:addMod(dsp.mod.DEX, 50);
        target:addMod(dsp.mod.HASTE_GEAR, 10);
        target:addMod(dsp.mod.ENMITY, 20);
    elseif (pwr == 75) then -- dsp.ki.ATMA_OF_THE_WAR_LION
        target:addMod(dsp.mod.DEX, 20);
        target:addMod(dsp.mod.THUNDERRES, 100);
        target:addMod(dsp.mod.FORCE_LIGHTNING_DWBONUS, 1);
    elseif (pwr == 76) then -- dsp.ki.ATMA_OF_THE_FROZEN_FETTERS
        target:addMod(dsp.mod.INT, 20);
        target:addMod(dsp.mod.ICERES, 100);
        target:addMod(dsp.mod.FORCE_ICE_DWBONUS, 1);
    elseif (pwr == 77) then -- dsp.ki.ATMA_OF_THE_PLAGUEBRINGER
        target:addMod(dsp.mod.REGEN, 10);
        target:addMod(dsp.mod.STORETP, 20);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 7);
    elseif (pwr == 78) then -- dsp.ki.ATMA_OF_THE_SHRIEKING_ONE
        target:addMod(dsp.mod.DEF, 60);
        target:addMod(dsp.mod.MDEF, 20);
        target:addMod(dsp.mod.STORETP, 20);
    elseif (pwr == 79) then -- dsp.ki.ATMA_OF_THE_HOLY_MOUNTAIN
        target:addMod(dsp.mod.LIGHTRES, 100);
        target:addMod(dsp.mod.LIGHTACC, 50);
        target:addMod(dsp.mod.FORCE_LIGHT_DWBONUS, 1);
    elseif (pwr == 80) then -- dsp.ki.ATMA_OF_THE_LAKE_LURKER
        target:addMod(dsp.mod.MND, 20);
        target:addMod(dsp.mod.WATERRES, 100);
        target:addMod(dsp.mod.FORCE_WATER_DWBONUS, 1);
    elseif (pwr == 81) then -- dsp.ki.ATMA_OF_THE_CRUSHING_CUDGEL
        target:addMod(dsp.mod.ACC, 20);
        target:addMod(dsp.mod.SKILLCHAINDMG, 5);
    elseif (pwr == 82) then -- dsp.ki.ATMA_OF_PURGATORY
        target:addMod(dsp.mod.VIT, 40);
        target:addMod(dsp.mod.INT, 40);
    elseif (pwr == 83) then -- dsp.ki.ATMA_OF_BLIGHTED_BREATH
        target:addMod(dsp.mod.SONG_SPELLCASTING_TIME, 40);
        target:addMod(dsp.mod.LIGHTACC, 40);
    elseif (pwr == 84) then -- dsp.ki.ATMA_OF_THE_PERSISTENT_PREDATOR
        target:addMod(dsp.mod.STORETP, 40);
        target:addMod(dsp.mod.TP_BONUS, 10);
    elseif (pwr == 85) then -- dsp.ki.ATMA_OF_THE_STONE_GOD
        target:addMod(dsp.mod.SUBTLE_BLOW, 40);
        target:addMod(dsp.mod.ENMITY, 40);
    elseif (pwr == 86) then -- dsp.ki.ATMA_OF_THE_SUN_EATER
        target:addMod(dsp.mod.STORETP, 40);
        target:addMod(dsp.mod.TP_BONUS, 40);
    elseif (pwr == 87) then -- dsp.ki.ATMA_OF_THE_DESPOT
        target:addMod(dsp.mod.CHR, 50);
        target:addMod(dsp.mod.MAGIC_ABSORB, 15);
        target:addMod(dsp.mod.TP_BONUS, 40);
    elseif (pwr == 88) then -- dsp.ki.ATMA_OF_THE_SOLITARY_ONE
        target:addMod(dsp.mod.TRIPLE_ATTACK, 7);
        target:addMod(dsp.mod.DMGBREATH, -25);
        target:addMod(dsp.mod.ZANSHIN, 10);
    elseif (pwr == 89) then -- dsp.ki.ATMA_OF_THE_WINGED_GLOOM
        target:addMod(dsp.mod.DMG, -25);
        target:addMod(dsp.mod.REGEN, 2);
    elseif (pwr == 90) then -- dsp.ki.ATMA_OF_THE_SEA_DAUGHTER
        target:addMod(dsp.mod.REGAIN, 50);
        target:addMod(dsp.mod.HASTE_GEAR, -12);
        target:addMod(dsp.mod.REGEN, 30);
    elseif (pwr == 91) then -- dsp.ki.ATMA_OF_THE_HATEFUL_STREAM
        -- Not yet implemented
        -- http://wiki.ffxiclopedia.org/wiki/Atma_of_the_Hateful_Stream
        -- No easy way to do this ATMA, no way I am doing bit crap in onTick for it..
    elseif (pwr == 92) then -- dsp.ki.ATMA_OF_THE_FOE_FLAYER
        target:addMod(dsp.mod.MPP, 20);
        target:addMod(dsp.mod.REFRESH, 20);
        target:addMod(dsp.mod.FASTCAST, 20);
        target:addMod(dsp.mod.MACC, 50);
    elseif (pwr == 93) then -- dsp.ki.ATMA_OF_THE_ENDLESS_NIGHTMARE
        target:addMod(dsp.mod.MND, 20);
        target:addMod(dsp.mod.DARKRES, 100);
        target:addMod(dsp.mod.FORCE_DARK_DWBONUS, 1);
    elseif (pwr == 94) then -- dsp.ki.ATMA_OF_THE_SUNDERING_SLASH
        target:addMod(dsp.mod.ATT, 20);
        target:addMod(dsp.mod.REGAIN, 30);
    elseif (pwr == 95) then -- dsp.ki.ATMA_OF_ENTWINED_SERPENTS
        target:addMod(dsp.mod.ATT, 20);
        target:addMod(dsp.mod.DOUBLE_ATTACK, 15);
    elseif (pwr == 96) then -- dsp.ki.ATMA_OF_THE_HORNED_BEAST
        target:addMod(dsp.mod.ACC, 60);
        target:addMod(dsp.mod.PETRIFYRES, 50);
    elseif (pwr == 97) then -- dsp.ki.ATMA_OF_AQUATIC_ARDOR
        target:addMod(dsp.mod.ABSORB_DMG_CHANCE, 6);
        target:addMod(dsp.mod.MAGIC_ABSORB, 6);
    elseif (pwr == 98) then -- dsp.ki.ATMA_OF_THE_FALLEN_ONE
        target:addMod(dsp.mod.INT, 30);
        target:addMod(dsp.mod.MND, 30);
    elseif (pwr == 99) then -- dsp.ki.ATMA_OF_FIRES_AND_FLARES
        target:addMod(dsp.mod.AGI, 20);
        target:addMod(dsp.mod.RATT, 40);
    elseif (pwr == 100) then -- dsp.ki.ATMA_OF_THE_APOCALYPSE
        target:addMod(dsp.mod.TRIPLE_ATTACK, 15);
        -- target:addMod(dsp.mod.GRIMOIRE_INSTANT_CAST, 10); -- Wrong modifier, correct one not yet implimented.
        target:addMod(dsp.mod.RERAISE_III, 1);
    elseif (pwr == 101) then -- dsp.ki.ATMA_OF_THE_HEIR                         KI ID = 1655;
    elseif (pwr == 102) then -- dsp.ki.ATMA_OF_THE_HERO                         KI ID = 1656;
    elseif (pwr == 103) then -- dsp.ki.ATMA_OF_THE_FULL_MOON                    KI ID = 1657;
    elseif (pwr == 104) then -- dsp.ki.ATMA_OF_ILLUSIONS                        KI ID = 1658;
    elseif (pwr == 105) then -- dsp.ki.ATMA_OF_THE_BANISHER                     KI ID = 1659;
    elseif (pwr == 106) then -- dsp.ki.ATMA_OF_THE_SELLSWORD                    KI ID = 1660;
    elseif (pwr == 107) then -- dsp.ki.ATMA_OF_A_FUTURE_FABULOUS                KI ID = 1661;
    elseif (pwr == 108) then -- dsp.ki.ATMA_OF_CAMARADERIE                      KI ID = 1662;
    elseif (pwr == 109) then -- dsp.ki.ATMA_OF_THE_TRUTHSEEKER                  KI ID = 1663;
    elseif (pwr == 110) then -- dsp.ki.ATMA_OF_THE_AZURE_SKY                    KI ID = 1664;
    elseif (pwr == 111) then -- dsp.ki.ATMA_OF_ECHOES                           KI ID = 1665;
    elseif (pwr == 112) then -- dsp.ki.ATMA_OF_DREAD                            KI ID = 1666;
    elseif (pwr == 113) then -- dsp.ki.ATMA_OF_AMBITION                         KI ID = 1667;
    elseif (pwr == 114) then -- dsp.ki.ATMA_OF_THE_BEAST_KING                   KI ID = 1668;
    elseif (pwr == 115) then -- dsp.ki.ATMA_OF_THE_KIRIN                        KI ID = 1669;
    elseif (pwr == 116) then -- dsp.ki.ATMA_OF_HELLS_GUARDIAN                   KI ID = 1670;
    elseif (pwr == 117) then -- dsp.ki.ATMA_OF_LUMINOUS_WINGS                   KI ID = 1671;
    elseif (pwr == 118) then -- dsp.ki.ATMA_OF_THE_DRAGON_RIDER                 KI ID = 1672;
    elseif (pwr == 119) then -- dsp.ki.ATMA_OF_THE_IMPENETRABLE                 KI ID = 1673;
    elseif (pwr == 120) then -- dsp.ki.ATMA_OF_ALPHA_AND_OMEGA                  KI ID = 1674;
    elseif (pwr == 121) then -- dsp.ki.ATMA_OF_THE_ULTIMATE                     KI ID = 1675;
    elseif (pwr == 122) then -- dsp.ki.ATMA_OF_THE_HYBRID_BEAST                 KI ID = 1676;
    elseif (pwr == 123) then -- dsp.ki.ATMA_OF_THE_DARK_DEPTHS                  KI ID = 1677;
    elseif (pwr == 124) then -- dsp.ki.ATMA_OF_THE_ZENITH                       KI ID = 1678;
    elseif (pwr == 125) then -- dsp.ki.ATMA_OF_PERFECT_ATTENDANCE               KI ID = 1679;
    elseif (pwr == 126) then -- dsp.ki.ATMA_OF_THE_RESCUER                      KI ID = 1680;
    elseif (pwr == 127) then -- dsp.ki.ATMA_OF_NIGHTMARES                       KI ID = 1681;
    elseif (pwr == 128) then -- dsp.ki.ATMA_OF_THE_EINHERJAR                    KI ID = 1682;
    elseif (pwr == 129) then -- dsp.ki.ATMA_OF_THE_ILLUMINATOR                  KI ID = 1683;
    elseif (pwr == 130) then -- dsp.ki.ATMA_OF_THE_BUSHIN                       KI ID = 1684;
    elseif (pwr == 131) then -- dsp.ki.ATMA_OF_THE_ACE_ANGLER                   KI ID = 1685;
    elseif (pwr == 132) then -- dsp.ki.ATMA_OF_THE_MASTER_CRAFTER               KI ID = 1686;
    elseif (pwr == 133) then -- dsp.ki.ATMA_OF_INGENUITY                        KI ID = 1687;
    elseif (pwr == 134) then -- dsp.ki.ATMA_OF_THE_GRIFFONS_CLAW                KI ID = 1688;
    elseif (pwr == 135) then -- dsp.ki.ATMA_OF_THE_FETCHING_FOOTPAD             KI ID = 1689;
    elseif (pwr == 136) then -- dsp.ki.ATMA_OF_UNDYING_LOYALTY                  KI ID = 1690;
    elseif (pwr == 137) then -- dsp.ki.ATMA_OF_THE_ROYAL_LINEAGE                KI ID = 1691;
    elseif (pwr == 138) then -- dsp.ki.ATMA_OF_THE_SHATTERING_STAR              KI ID = 1692;
    elseif (pwr == 139) then -- dsp.ki.ATMA_OF_THE_COBRA_COMMANDER              KI ID = 1693;
    elseif (pwr == 140) then -- dsp.ki.ATMA_OF_ROARING_LAUGHTER                 KI ID = 1694;
    elseif (pwr == 141) then -- dsp.ki.ATMA_OF_THE_DARK_BLADE                   KI ID = 1695;
    elseif (pwr == 142) then -- dsp.ki.ATMA_OF_THE_DUCAL_GUARD                  KI ID = 1696;
    elseif (pwr == 143) then -- dsp.ki.ATMA_OF_HARMONY                          KI ID = 1697;
    elseif (pwr == 144) then -- dsp.ki.ATMA_OF_REVELATIONS                      KI ID = 1698;
    elseif (pwr == 145) then -- dsp.ki.ATMA_OF_THE_SAVIOR                       KI ID = 1699;
    end
end;

function atmaEffectLose(target, effect)
    local pwr = effect:getPower();
    if (pwr == 1) then -- ATMA of the Lion
        target:delMod(dsp.mod.TRIPLE_ATTACK, 7);
        target:delMod(dsp.mod.DMGPHYS, -10);
        target:delMod(dsp.mod.THUNDERATT, 30);
    elseif (pwr == 2) then -- dsp.ki.ATMA_OF_THE_STOUT_ARM
        target:delMod(dsp.mod.STR, 40);
        target:delMod(dsp.mod.ATT, 50);
        target:delMod(dsp.mod.RATT, 40);
    elseif (pwr == 3) then -- dsp.ki.ATMA_OF_THE_TWIN_CLAW
        target:delMod(dsp.mod.DEF, 40);
        target:delMod(dsp.mod.MDEF, 20);
        target:delMod(dsp.mod.CHARMRES, 20);
    elseif (pwr == 4) then -- dsp.ki.ATMA_OF_ALLURE
        target:delMod(dsp.mod.MPP, 30);
        target:delMod(dsp.mod.MND, 30);
        target:delMod(dsp.mod.ENMITY, -30);
    elseif (pwr == 5) then -- dsp.ki.ATMA_OF_ETERNITY
        target:delMod(dsp.mod.ENEMYCRITRATE, -20);
        target:delMod(dsp.mod.SLOWRES, 30);
        target:delMod(dsp.mod.CURSERES, 30);
    elseif (pwr == 6) then -- dsp.ki.ATMA_OF_THE_HEAVENS
        target:delMod(dsp.mod.MACC, 30);
        target:delMod(dsp.mod.DMGPHYS, -10);
        target:delMod(dsp.mod.PARALYZERES, 30);
    elseif (pwr == 7) then -- dsp.ki.ATMA_OF_THE_BAYING_MOON
        target:delMod(dsp.mod.ATT, 30);
        target:delMod(dsp.mod.MATT, 30);
    elseif (pwr == 8) then -- dsp.ki.ATMA_OF_THE_EBON_HOOF
        target:delMod(dsp.mod.HPP, 30);
        target:delMod(dsp.mod.SLEEPRES, 50);
    elseif (pwr == 9) then -- dsp.ki.ATMA_OF_TREMORS
        target:delMod(dsp.mod.DMG, -20);
        target:delMod(dsp.mod.SILENCERES, 40);
    elseif (pwr == 10) then -- dsp.ki.ATMA_OF_THE_SAVAGE_TIGER
        target:delMod(dsp.mod.AGI, 30);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 10);
    elseif (pwr == 11) then -- dsp.ki.ATMA_OF_THE_VORACIOUS_VIOLET
        target:delMod(dsp.mod.STR, 50);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:delMod(dsp.mod.REGAIN, 20);
    elseif (pwr == 12) then -- dsp.ki.ATMA_OF_CLOAK_AND_DAGGER
        target:delMod(dsp.mod.ACC, 40);
        target:delMod(dsp.mod.EVA, 40);
    elseif (pwr == 13) then -- dsp.ki.ATMA_OF_THE_STORMBIRD
        target:delMod(dsp.mod.ACC, 40);
        target:delMod(dsp.mod.THUNDERATT, 40);
        target:delMod(dsp.mod.REFRESH, 5);
    elseif (pwr == 14) then -- dsp.ki.ATMA_OF_THE_NOXIOUS_FANG
        target:delMod(dsp.mod.SUBTLE_BLOW, 40);
        target:delMod(dsp.mod.WATERATT, 40);
        target:delMod(dsp.mod.POISONRES, 40);
    elseif (pwr == 15) then -- dsp.ki.ATMA_OF_VICISSITUDE
        target:delMod(dsp.mod.DEF, 40);
        target:delMod(dsp.mod.MDEF, 20);
        target:delMod(dsp.mod.REGEN, 15);
    elseif (pwr == 16) then -- dsp.ki.ATMA_OF_THE_BEYOND
        target:delMod(dsp.mod.MATT, 30);
        target:delMod(dsp.mod.ICEATT, 30);
        target:delMod(dsp.mod.LIGHTATT, 30);
    elseif (pwr == 17) then -- dsp.ki.ATMA_OF_STORMBREATH
        target:delMod(dsp.mod.VIT, 30);
        target:delMod(dsp.mod.DMGBREATH, -30);
    elseif (pwr == 18) then -- dsp.ki.ATMA_OF_GALES
        target:delMod(dsp.mod.WINDATT, 30);
        target:delMod(dsp.mod.WINDACC, 30);
    elseif (pwr == 19) then -- dsp.ki.ATMA_OF_THRASHING_TENDRILS
        target:delMod(dsp.mod.CHR, 30);
        target:delMod(dsp.mod.CRITHITRATE, 20);
    elseif (pwr == 20) then -- dsp.ki.ATMA_OF_THE_DRIFTER
        target:delMod(dsp.mod.RATT, 30);
        target:delMod(dsp.mod.RACC, 40);
    elseif (pwr == 21) then -- dsp.ki.ATMA_OF_THE_STRONGHOLD
        target:delMod(dsp.mod.ATT, 40);
        target:delMod(dsp.mod.DEF, 40);
        target:delMod(dsp.mod.REGEN, 15);
    elseif (pwr == 22) then -- dsp.ki.ATMA_OF_THE_HARVESTER
        target:delMod(dsp.mod.STR, 30);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:delMod(dsp.mod.SLEEPRES, 40);
    elseif (pwr == 23) then -- dsp.ki.ATMA_OF_DUNES
        target:delMod(dsp.mod.STORETP, 20);
        target:delMod(dsp.mod.SLOWRES, 40);
    elseif (pwr == 24) then -- dsp.ki.ATMA_OF_THE_COSMOS
        target:delMod(dsp.mod.DARKATT, 40);
        target:delMod(dsp.mod.AMNESIARES, 40);
        target:delMod(dsp.mod.SILENCERES, 40);
    elseif (pwr == 25) then -- dsp.ki.ATMA_OF_THE_SIREN_SHADOW
        target:delMod(dsp.mod.ATT, 40);
        target:delMod(dsp.mod.EVA, 40);
        target:delMod(dsp.mod.PARALYZERES, 40);
    elseif (pwr == 26) then -- dsp.ki.ATMA_OF_THE_IMPALER
        target:delMod(dsp.mod.DOUBLE_ATTACK, 20);
        target:delMod(dsp.mod.BINDRES, 40);
        target:delMod(dsp.mod.BLINDRES, 40);
    elseif (pwr == 27) then -- dsp.ki.ATMA_OF_THE_ADAMANTINE
        target:delMod(dsp.mod.VIT, 20);
        target:delMod(dsp.mod.DEF, 40);
    elseif (pwr == 28) then -- dsp.ki.ATMA_OF_CALAMITY
        target:delMod(dsp.mod.SLOWRES, 40);
        target:delMod(dsp.mod.BLINDRES, 40);
    elseif (pwr == 29) then -- dsp.ki.ATMA_OF_THE_CLAW
        target:delMod(dsp.mod.EARTHATT, 30);
        target:delMod(dsp.mod.EARTHACC, 40);
    elseif (pwr == 30) then -- dsp.ki.ATMA_OF_BALEFUL_BONES
        target:delMod(dsp.mod.STR, 20);
        target:delMod(dsp.mod.DARKACC, 40)
    elseif (pwr == 31) then -- dsp.ki.ATMA_OF_THE_CLAWED_BUTTERFLY
        target:delMod(dsp.mod.FIREACC, 40);
        target:delMod(dsp.mod.INT, 30);
    elseif (pwr == 32) then -- dsp.ki.ATMA_OF_THE_DESERT_WORM
        target:delMod(dsp.mod.MND, 20);
        target:delMod(dsp.mod.ACC, 40);
        target:delMod(dsp.mod.MAGIC_NULL, 5);
    elseif (pwr == 33) then -- dsp.ki.ATMA_OF_THE_UNDYING
        target:delMod(dsp.mod.MND, 40);
        target:delMod(dsp.mod.CONSERVE_MP, 10);
        target:delMod(dsp.mod.ICEATT, 20);
    elseif (pwr == 34) then -- dsp.ki.ATMA_OF_THE_IMPREGNABLE_TOWER
        target:delMod(dsp.mod.HPP, 30);
        target:delMod(dsp.mod.MACC, 40);
        target:delMod(dsp.mod.MATT, 40);
    elseif (pwr == 35) then -- dsp.ki.ATMA_OF_THE_SMOLDERING_SKY
        target:delMod(dsp.mod.ATT, 20);
        target:delMod(dsp.mod.MACC, 40);
        target:delMod(dsp.mod.FIREATT, 30);
    elseif (pwr == 36) then -- dsp.ki.ATMA_OF_THE_DEMONIC_SKEWER
        target:delMod(dsp.mod.STR, 20);
        target:delMod(dsp.mod.TP_BONUS, 20);
        target:delMod(dsp.mod.NULL_PHYSICAL_DAMAGE, 5);
    elseif (pwr == 37) then -- dsp.ki.ATMA_OF_THE_GOLDEN_CLAW
        target:delMod(dsp.mod.SKILLCHAINBONUS, 20);
        target:delMod(dsp.mod.STR, 20);
    elseif (pwr == 38) then -- dsp.ki.ATMA_OF_THE_GLUTINOUS_OOZE
        target:delMod(dsp.mod.MND, 20);
        target:delMod(dsp.mod.WATERACC, 20);
    elseif (pwr == 39) then -- dsp.ki.ATMA_OF_THE_LIGHTNING_BEAST
        target:delMod(dsp.mod.FASTCAST, 20);
        target:delMod(dsp.mod.SPELLINTERRUPT, 20);
    elseif (pwr == 40) then -- dsp.ki.ATMA_OF_THE_NOXIOUS_BLOOM
        target:delMod(dsp.mod.STORETP, 20);
        target:delMod(dsp.mod.WALTZ_POTENTCY, 10);
    elseif (pwr == 41) then -- dsp.ki.ATMA_OF_THE_GNARLED_HORN
        target:delMod(dsp.mod.AGI, 50);
        target:delMod(dsp.mod.CRITHITRATE, 20);
        target:delMod(dsp.mod.COUNTER, 10);
    elseif (pwr == 42) then -- dsp.ki.ATMA_OF_THE_STRANGLING_WIND
        target:delMod(dsp.mod.STR, 20);
        target:delMod(dsp.mod.VIT, 20);
        target:delMod(dsp.mod.AGI, 30);
    elseif (pwr == 43) then -- dsp.ki.ATMA_OF_THE_DEEP_DEVOURER
        target:delMod(dsp.mod.SUBTLE_BLOW, 5);
        target:delMod(dsp.mod.STORETP, 5);
        target:delMod(dsp.mod.SONG_SPELLCASTING_TIME, 20);
    elseif (pwr == 44) then -- dsp.ki.ATMA_OF_THE_MOUNTED_CHAMPION
        target:delMod(dsp.mod.VIT, 50);
        target:delMod(dsp.mod.REGEN, 20);
        target:delMod(dsp.mod.ENMITY_REDUCTION_PHYSICAL, -20);
    elseif (pwr == 45) then -- dsp.ki.ATMA_OF_THE_RAZED_RUINS
        target:delMod(dsp.mod.DEX, 50);
        target:delMod(dsp.mod.CRITHITRATE, 30);
        target:delMod(dsp.mod.CRIT_DMG_INCREASE, 30);
    elseif (pwr == 46) then -- dsp.ki.ATMA_OF_THE_BLUDGEONING_BRUTE
        target:delMod(dsp.mod.REGAIN, 10);
        target:delMod(dsp.mod.THUNDERRES, 50);
        target:delMod(dsp.mod.WATERRES, 50);
    elseif (pwr == 47) then -- dsp.ki.ATMA_OF_THE_RAPID_REPTILIAN
        target:delMod(dsp.mod.TRIPLE_ATTACK, 5);
        target:delMod(dsp.mod.DMGBREATH, -40);
    elseif (pwr == 48) then -- dsp.ki.ATMA_OF_THE_WINGED_ENIGMA
        target:delMod(dsp.mod.HASTE_GEAR, 5);
    elseif (pwr == 49) then -- dsp.ki.ATMA_OF_THE_CRADLE
        target:delMod(dsp.mod.VIT, 20);
        target:delMod(dsp.mod.DEX, 20);
    elseif (pwr == 50) then -- dsp.ki.ATMA_OF_THE_UNTOUCHED
        target:delMod(dsp.mod.CHR, 20);
        target:delMod(dsp.mod.TRIPLE_ATTACK, 5);
    elseif (pwr == 51) then -- dsp.ki.ATMA_OF_THE_SANGUINE_SCYTHE
        target:delMod(dsp.mod.HPP, 20);
        target:delMod(dsp.mod.CRIT_DMG_INCREASE, 30);
        target:delMod(dsp.mod.ENMITY, 20);
    elseif (pwr == 52) then -- dsp.ki.ATMA_OF_THE_TUSKED_TERROR
        target:delMod(dsp.mod.FASTCAST, 20);
        target:delMod(dsp.mod.WATERATT, 20);
        target:delMod(dsp.mod.WATERACC, 20);
    elseif (pwr == 53) then -- dsp.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY
        target:delMod(dsp.mod.REFRESH, 10);
        target:delMod(dsp.mod.INT, 50);
        target:delMod(dsp.mod.ENMITY, -20);
    elseif (pwr == 54) then -- dsp.ki.ATMA_OF_THE_WOULD_BE_KING
        target:delMod(dsp.mod.REGAIN, 100);
        target:delMod(dsp.mod.STORETP, 20);
        target:delMod(dsp.mod.TP_BONUS, 20);
    elseif (pwr == 55) then -- dsp.ki.ATMA_OF_THE_BLINDING_HORN
        target:delMod(dsp.mod.CONSERVE_MP, 20);
        target:delMod(dsp.mod.THUNDERATT, 30);
        target:delMod(dsp.mod.DMGMAGIC, -20);
    elseif (pwr == 56) then -- dsp.ki.ATMA_OF_THE_DEMONIC_LASH
        target:delMod(dsp.mod.ATT, 40);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 10);
        target:delMod(dsp.mod.MAGIC_ABSORB, 20);
    elseif (pwr == 57) then -- dsp.ki.ATMA_OF_APPARITIONS
        target:delMod(dsp.mod.EVA, 20);
        target:delMod(dsp.mod.WINDRES, 50);
    elseif (pwr == 58) then -- dsp.ki.ATMA_OF_THE_SHIMMERING_SHELL
        target:delMod(dsp.mod.AGI, 20);
        target:delMod(dsp.mod.FIRERES, 50);
    elseif (pwr == 59) then -- dsp.ki.ATMA_OF_THE_MURKY_MIASMA
        target:delMod(dsp.mod.DARKRES, 50);
        target:delMod(dsp.mod.STUNRES, 30);
    elseif (pwr == 60) then -- dsp.ki.ATMA_OF_THE_AVARICIOUS_APE
        target:delMod(dsp.mod.HASTE_GEAR, 5);
        -- not implemented: Monster Correlation
    elseif (pwr == 61) then -- dsp.ki.ATMA_OF_THE_MERCILESS_MATRIARCH
        target:delMod(dsp.mod.MACC, 50);
        target:delMod(dsp.mod.FASTCAST, 20);
        target:delMod(dsp.mod.ENMITY, -50);
    elseif (pwr == 62) then -- dsp.ki.ATMA_OF_THE_BROTHER_WOLF
        target:delMod(dsp.mod.MATT, 20);
        target:delMod(dsp.mod.MDEF, 20);
        target:delMod(dsp.mod.FIRERES, 100);
    elseif (pwr == 63) then -- dsp.ki.ATMA_OF_THE_EARTH_WYRM
        target:delMod(dsp.mod.EARTHRES, 100);
        target:delMod(dsp.mod.DMG, -20);
        target:delMod(dsp.mod.FORCE_EARTH_DWBONUS, 1);
    elseif (pwr == 64) then -- dsp.ki.ATMA_OF_THE_ASCENDING_ONE
        target:delMod(dsp.mod.WINDRES, 100);
        target:delMod(dsp.mod.HASTE_GEAR, 5);
        target:delMod(dsp.mod.SNAP_SHOT, 5);
    elseif (pwr == 65) then -- dsp.ki.ATMA_OF_THE_SCORPION_QUEEN
        target:delMod(dsp.mod.STORETP, 20);
        target:delMod(dsp.mod.CRITHITRATE, 30);
        target:delMod(dsp.mod.BINDRES, 50);
    elseif (pwr == 66) then -- dsp.ki.ATMA_OF_A_THOUSAND_NEEDLES
        target:delMod(dsp.mod.HPP, 20);
        target:delMod(dsp.mod.MPP, 20);
        target:delMod(dsp.mod.DEX, 10);
    elseif (pwr == 67) then -- dsp.ki.ATMA_OF_THE_BURNING_EFFIGY
        target:delMod(dsp.mod.STR, 20);
        -- fire based ws + 0.2 fTP
        target:delMod(dsp.mod.FORCE_FIRE_DWBONUS, 1);
    elseif (pwr == 68) then -- dsp.ki.ATMA_OF_THE_SMITING_BLOW
        target:delMod(dsp.mod.TP_BONUS, 50);
        target:delMod(dsp.mod.WSACC, 50);
    elseif (pwr == 69) then -- dsp.ki.ATMA_OF_THE_LONE_WOLF
        target:delMod(dsp.mod.ATT, 20);
        target:delMod(dsp.mod.FIREATT, 30);
    elseif (pwr == 70) then -- dsp.ki.ATMA_OF_THE_CRIMSON_SCALE
        target:delMod(dsp.mod.HASTE_GEAR, 5);
        target:delMod(dsp.mod.ENMITY, -20);
    elseif (pwr == 71) then -- dsp.ki.ATMA_OF_THE_SCARLET_WING
        target:delMod(dsp.mod.ELEM, 10);
        target:delMod(dsp.mod.FORCE_WIND_DWBONUS, 1);
    elseif (pwr == 72) then -- dsp.ki.ATMA_OF_THE_RAISED_TAIL
        target:delMod(dsp.mod.ATT, 40);
        target:delMod(dsp.mod.EVA, 40);
    elseif (pwr == 73) then -- dsp.ki.ATMA_OF_THE_SAND_EMPEROR
        target:delMod(dsp.mod.ACC, 40);
        target:delMod(dsp.mod.EVA, 40);
    elseif (pwr == 74) then -- dsp.ki.ATMA_OF_THE_OMNIPOTENT
        target:delMod(dsp.mod.DEX, 50);
        target:delMod(dsp.mod.HASTE_GEAR, 10);
        target:delMod(dsp.mod.ENMITY, 20);
    elseif (pwr == 75) then -- dsp.ki.ATMA_OF_THE_WAR_LION
        target:delMod(dsp.mod.DEX, 20);
        target:delMod(dsp.mod.THUNDERRES, 100);
        target:delMod(dsp.mod.FORCE_LIGHTNING_DWBONUS, 1);
    elseif (pwr == 76) then -- dsp.ki.ATMA_OF_THE_FROZEN_FETTERS
        target:delMod(dsp.mod.INT, 20);
        target:delMod(dsp.mod.ICERES, 100);
        target:delMod(dsp.mod.FORCE_ICE_DWBONUS, 1);
    elseif (pwr == 77) then -- dsp.ki.ATMA_OF_THE_PLAGUEBRINGER
        target:delMod(dsp.mod.REGEN, 10);
        target:delMod(dsp.mod.STORETP, 20);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 7);
    elseif (pwr == 78) then -- dsp.ki.ATMA_OF_THE_SHRIEKING_ONE
        target:delMod(dsp.mod.DEF, 60);
        target:delMod(dsp.mod.MDEF, 20);
        target:delMod(dsp.mod.STORETP, 20);
    elseif (pwr == 79) then -- dsp.ki.ATMA_OF_THE_HOLY_MOUNTAIN
        target:delMod(dsp.mod.LIGHTRES, 100);
        target:delMod(dsp.mod.LIGHTACC, 50);
        target:delMod(dsp.mod.FORCE_LIGHT_DWBONUS, 1);
    elseif (pwr == 80) then -- dsp.ki.ATMA_OF_THE_LAKE_LURKER
        target:delMod(dsp.mod.MND, 20);
        target:delMod(dsp.mod.WATERRES, 100);
        target:delMod(dsp.mod.FORCE_WATER_DWBONUS, 1);
    elseif (pwr == 81) then -- dsp.ki.ATMA_OF_THE_CRUSHING_CUDGEL
        target:delMod(dsp.mod.ACC, 20);
        target:delMod(dsp.mod.SKILLCHAINDMG, 5);
    elseif (pwr == 82) then -- dsp.ki.ATMA_OF_PURGATORY
        target:delMod(dsp.mod.VIT, 40);
        target:delMod(dsp.mod.INT, 40);
    elseif (pwr == 83) then -- dsp.ki.ATMA_OF_BLIGHTED_BREATH
        target:delMod(dsp.mod.SONG_SPELLCASTING_TIME, 40);
        target:delMod(dsp.mod.LIGHTACC, 40);
    elseif (pwr == 84) then -- dsp.ki.ATMA_OF_THE_PERSISTENT_PREDATOR
        target:delMod(dsp.mod.STORETP, 40);
        target:delMod(dsp.mod.TP_BONUS, 10);
    elseif (pwr == 85) then -- dsp.ki.ATMA_OF_THE_STONE_GOD
        target:delMod(dsp.mod.SUBTLE_BLOW, 40);
        target:delMod(dsp.mod.ENMITY, 40);
    elseif (pwr == 86) then -- dsp.ki.ATMA_OF_THE_SUN_EATER
        target:delMod(dsp.mod.STORETP, 40);
        target:delMod(dsp.mod.TP_BONUS, 40);
    elseif (pwr == 87) then -- dsp.ki.ATMA_OF_THE_DESPOT
        target:delMod(dsp.mod.CHR, 50);
        target:delMod(dsp.mod.MAGIC_ABSORB, 15);
        target:delMod(dsp.mod.TP_BONUS, 40);
    elseif (pwr == 88) then -- dsp.ki.ATMA_OF_THE_SOLITARY_ONE
        target:delMod(dsp.mod.TRIPLE_ATTACK, 7);
        target:delMod(dsp.mod.DMGBREATH, -25);
        target:delMod(dsp.mod.ZANSHIN, 10);
    elseif (pwr == 89) then -- dsp.ki.ATMA_OF_THE_WINGED_GLOOM
        target:delMod(dsp.mod.DMG, -25);
        target:delMod(dsp.mod.REGEN, 2);
    elseif (pwr == 90) then -- dsp.ki.ATMA_OF_THE_SEA_DAUGHTER
        target:delMod(dsp.mod.REGAIN, 50);
        target:delMod(dsp.mod.HASTE_GEAR, -12);
        target:delMod(dsp.mod.REGEN, 30);
    elseif (pwr == 91) then -- dsp.ki.ATMA_OF_THE_HATEFUL_STREAM
        -- Not yet implemented
        -- http://wiki.ffxiclopedia.org/wiki/Atma_of_the_Hateful_Stream
        -- No easy way to do this ATMA, no way I am doing bit crap in onTick for it..
    elseif (pwr == 92) then -- dsp.ki.ATMA_OF_THE_FOE_FLAYER
        target:delMod(dsp.mod.MPP, 20);
        target:delMod(dsp.mod.REFRESH, 20);
        target:delMod(dsp.mod.FASTCAST, 20);
        target:delMod(dsp.mod.MACC, 50);
    elseif (pwr == 93) then -- dsp.ki.ATMA_OF_THE_ENDLESS_NIGHTMARE
        target:delMod(dsp.mod.MND, 20);
        target:delMod(dsp.mod.DARKRES, 100);
        target:delMod(dsp.mod.FORCE_DARK_DWBONUS, 1);
    elseif (pwr == 94) then -- dsp.ki.ATMA_OF_THE_SUNDERING_SLASH
        target:delMod(dsp.mod.ATT, 20);
        target:delMod(dsp.mod.REGAIN, 30);
    elseif (pwr == 95) then -- dsp.ki.ATMA_OF_ENTWINED_SERPENTS
        target:delMod(dsp.mod.ATT, 20);
        target:delMod(dsp.mod.DOUBLE_ATTACK, 15);
    elseif (pwr == 96) then -- dsp.ki.ATMA_OF_THE_HORNED_BEAST
        target:delMod(dsp.mod.ACC, 60);
        target:delMod(dsp.mod.PETRIFYRES, 50);
    elseif (pwr == 97) then -- dsp.ki.ATMA_OF_AQUATIC_ARDOR
        target:delMod(dsp.mod.ABSORB_DMG_CHANCE, 6);
        target:delMod(dsp.mod.MAGIC_ABSORB, 6);
    elseif (pwr == 98) then -- dsp.ki.ATMA_OF_THE_FALLEN_ONE
        target:delMod(dsp.mod.INT, 30);
        target:delMod(dsp.mod.MND, 30);
    elseif (pwr == 99) then -- dsp.ki.ATMA_OF_FIRES_AND_FLARES
        target:delMod(dsp.mod.AGI, 20);
        target:delMod(dsp.mod.RATT, 40);
    elseif (pwr == 100) then -- dsp.ki.ATMA_OF_THE_APOCALYPSE
        target:delMod(dsp.mod.TRIPLE_ATTACK, 15);
        -- target:delMod(dsp.mod.GRIMOIRE_INSTANT_CAST, 10); -- Wrong modifier, correct one not yet implimented.
        target:delMod(dsp.mod.RERAISE_III, 1);
    elseif (pwr == 101) then -- dsp.ki.ATMA_OF_THE_HEIR                         KI ID = 1655;
    elseif (pwr == 102) then -- dsp.ki.ATMA_OF_THE_HERO                         KI ID = 1656;
    elseif (pwr == 103) then -- dsp.ki.ATMA_OF_THE_FULL_MOON                    KI ID = 1657;
    elseif (pwr == 104) then -- dsp.ki.ATMA_OF_ILLUSIONS                        KI ID = 1658;
    elseif (pwr == 105) then -- dsp.ki.ATMA_OF_THE_BANISHER                     KI ID = 1659;
    elseif (pwr == 106) then -- dsp.ki.ATMA_OF_THE_SELLSWORD                    KI ID = 1660;
    elseif (pwr == 107) then -- dsp.ki.ATMA_OF_A_FUTURE_FABULOUS                KI ID = 1661;
    elseif (pwr == 108) then -- dsp.ki.ATMA_OF_CAMARADERIE                      KI ID = 1662;
    elseif (pwr == 109) then -- dsp.ki.ATMA_OF_THE_TRUTHSEEKER                  KI ID = 1663;
    elseif (pwr == 110) then -- dsp.ki.ATMA_OF_THE_AZURE_SKY                    KI ID = 1664;
    elseif (pwr == 111) then -- dsp.ki.ATMA_OF_ECHOES                           KI ID = 1665;
    elseif (pwr == 112) then -- dsp.ki.ATMA_OF_DREAD                            KI ID = 1666;
    elseif (pwr == 113) then -- dsp.ki.ATMA_OF_AMBITION                         KI ID = 1667;
    elseif (pwr == 114) then -- dsp.ki.ATMA_OF_THE_BEAST_KING                   KI ID = 1668;
    elseif (pwr == 115) then -- dsp.ki.ATMA_OF_THE_KIRIN                        KI ID = 1669;
    elseif (pwr == 116) then -- dsp.ki.ATMA_OF_HELLS_GUARDIAN                   KI ID = 1670;
    elseif (pwr == 117) then -- dsp.ki.ATMA_OF_LUMINOUS_WINGS                   KI ID = 1671;
    elseif (pwr == 118) then -- dsp.ki.ATMA_OF_THE_DRAGON_RIDER                 KI ID = 1672;
    elseif (pwr == 119) then -- dsp.ki.ATMA_OF_THE_IMPENETRABLE                 KI ID = 1673;
    elseif (pwr == 120) then -- dsp.ki.ATMA_OF_ALPHA_AND_OMEGA                  KI ID = 1674;
    elseif (pwr == 121) then -- dsp.ki.ATMA_OF_THE_ULTIMATE                     KI ID = 1675;
    elseif (pwr == 122) then -- dsp.ki.ATMA_OF_THE_HYBRID_BEAST                 KI ID = 1676;
    elseif (pwr == 123) then -- dsp.ki.ATMA_OF_THE_DARK_DEPTHS                  KI ID = 1677;
    elseif (pwr == 124) then -- dsp.ki.ATMA_OF_THE_ZENITH                       KI ID = 1678;
    elseif (pwr == 125) then -- dsp.ki.ATMA_OF_PERFECT_ATTENDANCE               KI ID = 1679;
    elseif (pwr == 126) then -- dsp.ki.ATMA_OF_THE_RESCUER                      KI ID = 1680;
    elseif (pwr == 127) then -- dsp.ki.ATMA_OF_NIGHTMARES                       KI ID = 1681;
    elseif (pwr == 128) then -- dsp.ki.ATMA_OF_THE_EINHERJAR                    KI ID = 1682;
    elseif (pwr == 129) then -- dsp.ki.ATMA_OF_THE_ILLUMINATOR                  KI ID = 1683;
    elseif (pwr == 130) then -- dsp.ki.ATMA_OF_THE_BUSHIN                       KI ID = 1684;
    elseif (pwr == 131) then -- dsp.ki.ATMA_OF_THE_ACE_ANGLER                   KI ID = 1685;
    elseif (pwr == 132) then -- dsp.ki.ATMA_OF_THE_MASTER_CRAFTER               KI ID = 1686;
    elseif (pwr == 133) then -- dsp.ki.ATMA_OF_INGENUITY                        KI ID = 1687;
    elseif (pwr == 134) then -- dsp.ki.ATMA_OF_THE_GRIFFONS_CLAW                KI ID = 1688;
    elseif (pwr == 135) then -- dsp.ki.ATMA_OF_THE_FETCHING_FOOTPAD             KI ID = 1689;
    elseif (pwr == 136) then -- dsp.ki.ATMA_OF_UNDYING_LOYALTY                  KI ID = 1690;
    elseif (pwr == 137) then -- dsp.ki.ATMA_OF_THE_ROYAL_LINEAGE                KI ID = 1691;
    elseif (pwr == 138) then -- dsp.ki.ATMA_OF_THE_SHATTERING_STAR              KI ID = 1692;
    elseif (pwr == 139) then -- dsp.ki.ATMA_OF_THE_COBRA_COMMANDER              KI ID = 1693;
    elseif (pwr == 140) then -- dsp.ki.ATMA_OF_ROARING_LAUGHTER                 KI ID = 1694;
    elseif (pwr == 141) then -- dsp.ki.ATMA_OF_THE_DARK_BLADE                   KI ID = 1695;
    elseif (pwr == 142) then -- dsp.ki.ATMA_OF_THE_DUCAL_GUARD                  KI ID = 1696;
    elseif (pwr == 143) then -- dsp.ki.ATMA_OF_HARMONY                          KI ID = 1697;
    elseif (pwr == 144) then -- dsp.ki.ATMA_OF_REVELATIONS                      KI ID = 1698;
    elseif (pwr == 145) then -- dsp.ki.ATMA_OF_THE_SAVIOR                       KI ID = 1699;
    end
end;
