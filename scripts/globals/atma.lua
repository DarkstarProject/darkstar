-----------------------------------
--
-- EFFECT_ATMA
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
        target:addMod(MOD_TRIPLE_ATTACK, 7);
        target:addMod(MOD_DMGPHYS, -10);
        target:addMod(MOD_THUNDERATT, 30);
    elseif (pwr == 2) then -- ATMA_OF_THE_STOUT_ARM
        target:addMod(MOD_STR, 40);
        target:addMod(MOD_ATT, 50);
        target:addMod(MOD_RATT, 40);
    elseif (pwr == 3) then -- ATMA_OF_THE_TWIN_CLAW
        target:addMod(MOD_DEF, 40);
        target:addMod(MOD_MDEF, 20);
        target:addMod(MOD_CHARMRES, 20);
    elseif (pwr == 4) then -- ATMA_OF_ALLURE
        target:addMod(MOD_MPP, 30);
        target:addMod(MOD_MND, 30);
        target:addMod(MOD_ENMITY, -30);
    elseif (pwr == 5) then -- ATMA_OF_ETERNITY
        target:addMod(MOD_ENEMYCRITRATE, -20);
        target:addMod(MOD_SLOWRES, 30);
        target:addMod(MOD_CURSERES, 30);
    elseif (pwr == 6) then -- ATMA_OF_THE_HEAVENS
        target:addMod(MOD_MACC, 30);
        target:addMod(MOD_DMGPHYS, -10);
        target:addMod(MOD_PARALYZERES, 30);
    elseif (pwr == 7) then -- ATMA_OF_THE_BAYING_MOON
        target:addMod(MOD_ATT, 30);
        target:addMod(MOD_MATT, 30);
    elseif (pwr == 8) then -- ATMA_OF_THE_EBON_HOOF
        target:addMod(MOD_HPP, 30);
        target:addMod(MOD_SLEEPRES, 50);
    elseif (pwr == 9) then -- ATMA_OF_TREMORS
        target:addMod(MOD_DMG, -20);
        target:addMod(MOD_SILENCERES, 40);
    elseif (pwr == 10) then -- ATMA_OF_THE_SAVAGE_TIGER
        target:addMod(MOD_AGI, 30);
        target:addMod(MOD_DOUBLE_ATTACK, 10);
    elseif (pwr == 11) then -- ATMA_OF_THE_VORACIOUS_VIOLET
        target:addMod(MOD_STR, 50);
        target:addMod(MOD_DOUBLE_ATTACK, 10);
        target:addMod(MOD_REGAIN, 20);
    elseif (pwr == 12) then -- ATMA_OF_CLOAK_AND_DAGGER
        target:addMod(MOD_ACC, 40);
        target:addMod(MOD_EVA, 40);
    elseif (pwr == 13) then -- ATMA_OF_THE_STORMBIRD
        target:addMod(MOD_ACC, 40);
        target:addMod(MOD_THUNDERATT, 40);
        target:addMod(MOD_REFRESH, 5);
    elseif (pwr == 14) then -- ATMA_OF_THE_NOXIOUS_FANG
        target:addMod(MOD_SUBTLE_BLOW, 40);
        target:addMod(MOD_WATERATT, 40);
        target:addMod(MOD_POISONRES, 40);
    elseif (pwr == 15) then -- ATMA_OF_VICISSITUDE
        target:addMod(MOD_DEF, 40);
        target:addMod(MOD_MDEF, 20);
        target:addMod(MOD_REGEN, 15);
    elseif (pwr == 16) then -- ATMA_OF_THE_BEYOND
        target:addMod(MOD_MATT, 30);
        target:addMod(MOD_ICEATT, 30);
        target:addMod(MOD_LIGHTATT, 30);
    elseif (pwr == 17) then -- ATMA_OF_STORMBREATH
        target:addMod(MOD_VIT, 30);
        target:addMod(MOD_DMGBREATH, -30);
    elseif (pwr == 18) then -- ATMA_OF_GALES
        target:addMod(MOD_WINDATT, 30);
        target:addMod(MOD_WINDACC, 30);
    elseif (pwr == 19) then -- ATMA_OF_THRASHING_TENDRILS
        target:addMod(MOD_CHR, 30);
        target:addMod(MOD_CRITHITRATE, 20);
    elseif (pwr == 20) then -- ATMA_OF_THE_DRIFTER
        target:addMod(MOD_RATT, 30);
        target:addMod(MOD_RACC, 40);
    elseif (pwr == 21) then -- ATMA_OF_THE_STRONGHOLD
        target:addMod(MOD_ATT, 40);
        target:addMod(MOD_DEF, 40);
        target:addMod(MOD_REGEN, 15);
    elseif (pwr == 22) then -- ATMA_OF_THE_HARVESTER
        target:addMod(MOD_STR, 30);
        target:addMod(MOD_DOUBLE_ATTACK, 10);
        target:addMod(MOD_SLEEPRES, 40);
    elseif (pwr == 23) then -- ATMA_OF_DUNES
        target:addMod(MOD_STORETP, 20);
        target:addMod(MOD_SLOWRES, 40);
    elseif (pwr == 24) then -- ATMA_OF_THE_COSMOS
        target:addMod(MOD_DARKATT, 40);
        target:addMod(MOD_AMNESIARES, 40);
        target:addMod(MOD_SILENCERES, 40);
    elseif (pwr == 25) then -- ATMA_OF_THE_SIREN_SHADOW
        target:addMod(MOD_ATT, 40);
        target:addMod(MOD_EVA, 40);
        target:addMod(MOD_PARALYZERES, 40);
    elseif (pwr == 26) then -- ATMA_OF_THE_IMPALER
        target:addMod(MOD_DOUBLE_ATTACK, 20);
        target:addMod(MOD_BINDRES, 40);
        target:addMod(MOD_BLINDRES, 40);
    elseif (pwr == 27) then -- ATMA_OF_THE_ADAMANTINE
        target:addMod(MOD_VIT, 20);
        target:addMod(MOD_DEF, 40);
    elseif (pwr == 28) then -- ATMA_OF_CALAMITY
        target:addMod(MOD_SLOWRES, 40);
        target:addMod(MOD_BLINDRES, 40);
    elseif (pwr == 29) then -- ATMA_OF_THE_CLAW
        target:addMod(MOD_EARTHATT, 30);
        target:addMod(MOD_EARTHACC, 40);
    elseif (pwr == 30) then -- ATMA_OF_BALEFUL_BONES
        target:addMod(MOD_STR, 20);
        target:addMod(MOD_DARKACC, 40)
    elseif (pwr == 31) then -- ATMA_OF_THE_CLAWED_BUTTERFLY
        target:addMod(MOD_FIREACC, 40);
        target:addMod(MOD_INT, 30);
    elseif (pwr == 32) then -- ATMA_OF_THE_DESERT_WORM
        target:addMod(MOD_MND, 20);
        target:addMod(MOD_ACC, 40);
        target:addMod(MOD_MAGIC_NULL, 5);
    elseif (pwr == 33) then -- ATMA_OF_THE_UNDYING
        target:addMod(MOD_MND, 40);
        target:addMod(MOD_CONSERVE_MP, 10);
        target:addMod(MOD_ICEATT, 20);
    elseif (pwr == 34) then -- ATMA_OF_THE_IMPREGNABLE_TOWER
        target:addMod(MOD_HP, 50);
        target:addMod(MOD_MACC, 40);
        target:addMod(MOD_MATT, 40);
    elseif (pwr == 35) then -- ATMA_OF_THE_SMOLDERING_SKY
        target:addMod(MOD_ATT, 20);
        target:addMod(MOD_MACC, 40);
        target:addMod(MOD_FIREATT, 30);
    elseif (pwr == 36) then -- ATMA_OF_THE_DEMONIC_SKEWER
        target:addMod(MOD_STR, 20);
        target:addMod(MOD_TP_BONUS, 20);
        target:addMod(MOD_NULL_PHYSICAL_DAMAGE, 5);
    elseif (pwr == 37) then -- ATMA_OF_THE_GOLDEN_CLAW
        target:addMod(MOD_SKILLCHAINBONUS, 20);
        target:addMod(MOD_STR, 20);
    elseif (pwr == 38) then -- ATMA_OF_THE_GLUTINOUS_OOZE
        target:addMod(MOD_MND, 20);
        target:addMod(MOD_WATERACC, 20);
    elseif (pwr == 39) then -- ATMA_OF_THE_LIGHTNING_BEAST
        target:addMod(MOD_UFASTCAST, 20);
        target:addMod(MOD_SPELLINTERRUPT, 20);
    elseif (pwr == 40) then -- ATMA_OF_THE_NOXIOUS_BLOOM
        target:addMod(MOD_STORETP, 20);
        target:addMod(MOD_WALTZ_POTENTCY, 10);
    elseif (pwr == 41) then -- ATMA_OF_THE_GNARLED_HORN
        target:addMod(MOD_AGI, 50);
        target:addMod(MOD_CRITHITRATE, 20);
        target:addMod(MOD_COUNTER, 10);
    elseif (pwr == 42) then -- ATMA_OF_THE_STRANGLING_WIND
        target:addMod(MOD_STR, 20);
        target:addMod(MOD_VIT, 20);
        target:addMod(MOD_AGI, 30);
    elseif (pwr == 43) then -- ATMA_OF_THE_DEEP_DEVOURER
        target:addMod(MOD_SUBTLE_BLOW, 5);
        target:addMod(MOD_STORETP, 5);
        -- target:addMod(MOD_SONG_CASTING_TIME, -20); Doesnt exist
    elseif (pwr == 44) then -- ATMA_OF_THE_MOUNTED_CHAMPION
        target:addMod(MOD_VIT, 50);
        target:addMod(MOD_REGEN, 20);
        target:addMod(MOD_ENMITY_REDUCTION_PHYSICAL, -20);
    elseif (pwr == 45) then -- ATMA_OF_THE_RAZED_RUINS
        target:addMod(MOD_DEX, 50);
        target:addMod(MOD_CRITHITRATE, 30);
        target:addMod(MOD_CRIT_DMG_INCREASE, 10);
    elseif (pwr == 46) then -- ATMA_OF_THE_BLUDGEONING_BRUTE
        target:addMod(MOD_REGAIN, 1);
        target:addMod(MOD_THUNDERRES, 50);
        target:addMod(MOD_WATERRES, 50);
    elseif (pwr == 47) then -- ATMA_OF_THE_RAPID_REPTILIAN
        target:addMod(MOD_TRIPLE_ATTACK, 5);
        target:addMod(MOD_DMGBREATH, -40);
    elseif (pwr == 48) then -- ATMA_OF_THE_WINGED_ENIGMA
        target:addMod(MOD_HASTE_GEAR, 5);
    elseif (pwr == 49) then -- ATMA_OF_THE_CRADLE
        target:addMod(MOD_VIT, 20);
        target:addMod(MOD_DEX, 20);
    elseif (pwr == 50) then -- ATMA_OF_THE_UNTOUCHED
        target:addMod(MOD_CHR, 20);
        target:addMod(MOD_TRIPLE_ATTACK, 5);
    elseif (pwr == 51) then -- ATMA_OF_THE_SANGUINE_SCYTHE
        target:addMod(MOD_HPP, 20);
        target:addMod(MOD_CRIT_DMG_INCREASE, 10);
        target:addMod(MOD_ENMITY, 20);
    elseif (pwr == 52) then -- ATMA_OF_THE_TUSKED_TERROR
        target:addMod(MOD_UFASTCAST, 20);
        target:addMod(MOD_WATERATT, 20);
        target:addMod(MOD_WATERACC, 20);
    elseif (pwr == 53) then -- ATMA_OF_THE_MINIKIN_MONSTROSITY
        target:addMod(MOD_REFRESH, 10);
        target:addMod(MOD_INT, 50);
        target:addMod(MOD_ENMITY, -20);
    elseif (pwr == 54) then -- ATMA_OF_THE_WOULD_BE_KING
        target:addMod(MOD_REGAIN, 10);
        target:addMod(MOD_STORETP, 20);
        target:addMod(MOD_TP_BONUS, 20);
    elseif (pwr == 55) then -- ATMA_OF_THE_BLINDING_HORN
        target:addMod(MOD_CONSERVE_MP, 20);
        target:addMod(MOD_THUNDERATT, 30);
        target:addMod(MOD_DMGMAGIC, -20);
    elseif (pwr == 56) then -- ATMA_OF_THE_DEMONIC_LASH
        target:addMod(MOD_ATT, 40);
        target:addMod(MOD_DOUBLE_ATTACK, 10);
        target:addMod(MOD_MAGIC_ABSORB, 20);
    elseif (pwr == 57) then -- ATMA_OF_APPARITIONS
        target:addMod(MOD_EVA, 20);
        target:addMod(MOD_WINDRES, 50);
    elseif (pwr == 58) then -- ATMA_OF_THE_SHIMMERING_SHELL
        target:addMod(MOD_AGI, 20);
        target:addMod(MOD_FIRERES, 50);
    elseif (pwr == 59) then -- ATMA_OF_THE_MURKY_MIASMA
        target:addMod(MOD_DARKRES, 50);
        target:addMod(MOD_STUNRES, 30);
    elseif (pwr == 60) then -- ATMA_OF_THE_AVARICIOUS_APE
        target:addMod(MOD_HASTE_GEAR, 5);
        -- not implemented: Monster Correlation
    elseif (pwr == 61) then -- ATMA_OF_THE_MERCILESS_MATRIARCH
        target:addMod(MOD_MACC, 50);
        target:addMod(MOD_FASTCAST, 20);
        target:addMod(MOD_ENMITY, -50);
    elseif (pwr == 62) then -- ATMA_OF_THE_BROTHER_WOLF
        target:addMod(MOD_MATT, 20);
        target:addMod(MOD_MDEF, 20);
        target:addMod(MOD_FIRERES, 100);
    elseif (pwr == 63) then -- ATMA_OF_THE_EARTH_WYRM
        target:addMod(MOD_EARTHRES, 100);
        target:addMod(MOD_DMG, -20);
        target:addMod(MOD_FORCE_EARTH_DWBONUS, 1);
    elseif (pwr == 64) then -- ATMA_OF_THE_ASCENDING_ONE
        target:addMod(MOD_WINDRES, 100);
        target:addMod(MOD_HASTE_GEAR, 5);
        target:addMod(MOD_SNAP_SHOT, 5);
    elseif (pwr == 65) then -- ATMA_OF_THE_SCORPION_QUEEN
        target:addMod(MOD_STORETP, 20);
        target:addMod(MOD_CRITHITRATE, 30);
        target:addMod(MOD_BINDRES, 50);
    elseif (pwr == 66) then -- ATMA_OF_A_THOUSAND_NEEDLES
        target:addMod(MOD_HPP, 20);
        target:addMod(MOD_MPP, 20);
        target:addMod(MOD_DEX, 10);
    elseif (pwr == 67) then -- ATMA_OF_THE_BURNING_EFFIGY
        target:addMod(MOD_STR, 20);
        -- fire based ws + 0.2 fTP
        target:addMod(MOD_FORCE_FIRE_DWBONUS, 1);
    elseif (pwr == 68) then -- ATMA_OF_THE_SMITING_BLOW
        target:addMod(MOD_TP_BONUS, 50);
        target:addMod(MOD_WSACC, 50);
    elseif (pwr == 69) then -- ATMA_OF_THE_LONE_WOLF
        target:addMod(MOD_ATT, 20);
        target:addMod(MOD_FIREATT, 30);
    elseif (pwr == 70) then -- ATMA_OF_THE_CRIMSON_SCALE
        target:addMod(MOD_HASTE_GEAR, 5);
        target:addMod(MOD_ENMITY, -20);
    elseif (pwr == 71) then -- ATMA_OF_THE_SCARLET_WING
        target:addMod(MOD_ELEM, 10);
        target:addMod(MOD_FORCE_WIND_DWBONUS, 1);
    elseif (pwr == 72) then -- ATMA_OF_THE_RAISED_TAIL
        target:addMod(MOD_ATT, 40);
        target:addMod(MOD_EVA, 40);
    elseif (pwr == 73) then -- ATMA_OF_THE_SAND_EMPEROR
        target:addMod(MOD_ACC, 40);
        target:addMod(MOD_EVA, 40);
    elseif (pwr == 74) then -- ATMA_OF_THE_OMNIPOTENT
        target:addMod(MOD_DEX, 50);
        target:addMod(MOD_HASTE_GEAR, 10);
        target:addMod(MOD_ENMITY, 20);
    elseif (pwr == 75) then -- ATMA_OF_THE_WAR_LION
        target:addMod(MOD_DEX, 20);
        target:addMod(MOD_THUNDERRES, 100);
        target:addMod(MOD_FORCE_LIGHTNING_DWBONUS, 1);
    elseif (pwr == 76) then -- ATMA_OF_THE_FROZEN_FETTERS
        target:addMod(MOD_INT, 20);
        target:addMod(MOD_ICERES, 100);
        target:addMod(MOD_FORCE_ICE_DWBONUS, 1);
    elseif (pwr == 77) then -- ATMA_OF_THE_PLAGUEBRINGER
        target:addMod(MOD_REGEN, 10);
        target:addMod(MOD_STORETP, 20);
        target:addMod(MOD_DOUBLE_ATTACK, 7);
    elseif (pwr == 78) then -- ATMA_OF_THE_SHRIEKING_ONE
        target:addMod(MOD_DEF, 60);
        target:addMod(MOD_MDEF, 20);
        target:addMod(MOD_STORETP, 20);
    elseif (pwr == 79) then -- ATMA_OF_THE_HOLY_MOUNTAIN
        target:addMod(MOD_LIGHTRES, 100);
        target:addMod(MOD_LIGHTACC, 50);
        target:addMod(MOD_FORCE_LIGHT_DWBONUS, 1);
    elseif (pwr == 80) then -- ATMA_OF_THE_LAKE_LURKER
        target:addMod(MOD_MND, 20);
        target:addMod(MOD_WATERRES, 100);
        target:addMod(MOD_FORCE_WATER_DWBONUS, 1);
    elseif (pwr == 81) then -- ATMA_OF_THE_CRUSHING_CUDGEL
        target:addMod(MOD_ACC, 20);
        target:addMod(MOD_SKILLCHAINDMG, 5);
    elseif (pwr == 82) then -- ATMA_OF_PURGATORY
        target:addMod(MOD_VIT, 40);
        target:addMod(MOD_INT, 40);
    elseif (pwr == 83) then -- ATMA_OF_BLIGHTED_BREATH
        -- target:addMod(MOD_SONG_CASTING_TIME, -40); Doesnt exist
        target:addMod(MOD_LIGHTACC, 40);
    elseif (pwr == 84) then -- ATMA_OF_THE_PERSISTENT_PREDATOR
        target:addMod(MOD_STORETP, 40);
        target:addMod(MOD_TP_BONUS, 10);
    elseif (pwr == 85) then -- ATMA_OF_THE_STONE_GOD
        target:addMod(MOD_SUBTLE_BLOW, 40);
        target:addMod(MOD_ENMITY, 40);
    elseif (pwr == 86) then -- ATMA_OF_THE_SUN_EATER
        target:addMod(MOD_STORETP, 40);
        target:addMod(MOD_TP_BONUS, 40);
    elseif (pwr == 87) then -- ATMA_OF_THE_DESPOT
        target:addMod(MOD_CHR, 50);
        target:addMod(MOD_MAGIC_ABSORB, 15);
        target:addMod(MOD_TP_BONUS, 40);
    elseif (pwr == 88) then -- ATMA_OF_THE_SOLITARY_ONE
        target:addMod(MOD_TRIPLE_ATTACK, 7);
        target:addMod(MOD_DMGBREATH, -25);
        target:addMod(MOD_ZANSHIN, 10);
    elseif (pwr == 89) then -- ATMA_OF_THE_WINGED_GLOOM
        target:addMod(MOD_DMG, -25);
        target:addMod(MOD_REGEN, 2);
    elseif (pwr == 90) then -- ATMA_OF_THE_SEA_DAUGHTER
        target:addMod(MOD_REGAIN, 5);
        target:addMod(MOD_HASTE_GEAR, -12);
        target:addMod(MOD_REGEN, 30);
    elseif (pwr == 91) then -- ATMA_OF_THE_HATEFUL_STREAM
        -- Not yet implemented
        -- http://wiki.ffxiclopedia.org/wiki/Atma_of_the_Hateful_Stream
        -- No easy way to do this ATMA, no way I am doing bit crap in onTick for it..
    elseif (pwr == 92) then -- ATMA_OF_THE_FOE_FLAYER
        target:addMod(MOD_MPP, 20);
        target:addMod(MOD_REFRESH, 20);
        target:addMod(MOD_FASTCAST, 20);
        target:addMod(MOD_MACC, 50);
    elseif (pwr == 93) then -- ATMA_OF_THE_ENDLESS_NIGHTMARE
        target:addMod(MOD_MND, 20);
        target:addMod(MOD_DARKRES, 100);
        target:addMod(MOD_FORCE_DARK_DWBONUS, 1);
    elseif (pwr == 94) then -- ATMA_OF_THE_SUNDERING_SLASH
        target:addMod(MOD_ATT, 20);
        target:addMod(MOD_REGAIN, 3);
    elseif (pwr == 95) then -- ATMA_OF_ENTWINED_SERPENTS
        target:addMod(MOD_ATT, 20);
        target:addMod(MOD_DOUBLE_ATTACK, 15);
    elseif (pwr == 96) then -- ATMA_OF_THE_HORNED_BEAST
        target:addMod(MOD_ACC, 60);
        target:addMod(MOD_PETRIFYRES, 50);
    elseif (pwr == 97) then -- ATMA_OF_AQUATIC_ARDOR
        target:addMod(MOD_ABSORB_DMG_CHANCE, 6);
        target:addMod(MOD_MAGIC_ABSORB, 6);
    elseif (pwr == 98) then -- ATMA_OF_THE_FALLEN_ONE
        target:addMod(MOD_INT, 30);
        target:addMod(MOD_MND, 30);
    elseif (pwr == 99) then -- ATMA_OF_FIRES_AND_FLARES
        target:addMod(MOD_AGI, 20);
        target:addMod(MOD_RATT, 40);
    elseif (pwr == 100) then -- ATMA_OF_THE_APOCALYPSE
        target:addMod(MOD_TRIPLE_ATTACK, 15);
        -- target:addMod(MOD_GRIMOIRE_INSTANT_CAST, 10); -- Wrong modifier, correct one not yet implimented.
        target:addMod(MOD_RERAISE_III, 1);
    elseif (pwr == 101) then -- ATMA_OF_THE_HEIR                         KI ID = 1655;
    elseif (pwr == 102) then -- ATMA_OF_THE_HERO                         KI ID = 1656;
    elseif (pwr == 103) then -- ATMA_OF_THE_FULL_MOON                    KI ID = 1657;
    elseif (pwr == 104) then -- ATMA_OF_ILLUSIONS                        KI ID = 1658;
    elseif (pwr == 105) then -- ATMA_OF_THE_BANISHER                     KI ID = 1659;
    elseif (pwr == 106) then -- ATMA_OF_THE_SELLSWORD                    KI ID = 1660;
    elseif (pwr == 107) then -- ATMA_OF_A_FUTURE_FABULOUS                KI ID = 1661;
    elseif (pwr == 108) then -- ATMA_OF_CAMARADERIE                      KI ID = 1662;
    elseif (pwr == 109) then -- ATMA_OF_THE_TRUTHSEEKER                  KI ID = 1663;
    elseif (pwr == 110) then -- ATMA_OF_THE_AZURE_SKY                    KI ID = 1664;
    elseif (pwr == 111) then -- ATMA_OF_ECHOES                           KI ID = 1665;
    elseif (pwr == 112) then -- ATMA_OF_DREAD                            KI ID = 1666;
    elseif (pwr == 113) then -- ATMA_OF_AMBITION                         KI ID = 1667;
    elseif (pwr == 114) then -- ATMA_OF_THE_BEAST_KING                   KI ID = 1668;
    elseif (pwr == 115) then -- ATMA_OF_THE_KIRIN                        KI ID = 1669;
    elseif (pwr == 116) then -- ATMA_OF_HELLS_GUARDIAN                   KI ID = 1670;
    elseif (pwr == 117) then -- ATMA_OF_LUMINOUS_WINGS                   KI ID = 1671;
    elseif (pwr == 118) then -- ATMA_OF_THE_DRAGON_RIDER                 KI ID = 1672;
    elseif (pwr == 119) then -- ATMA_OF_THE_IMPENETRABLE                 KI ID = 1673;
    elseif (pwr == 120) then -- ATMA_OF_ALPHA_AND_OMEGA                  KI ID = 1674;
    elseif (pwr == 121) then -- ATMA_OF_THE_ULTIMATE                     KI ID = 1675;
    elseif (pwr == 122) then -- ATMA_OF_THE_HYBRID_BEAST                 KI ID = 1676;
    elseif (pwr == 123) then -- ATMA_OF_THE_DARK_DEPTHS                  KI ID = 1677;
    elseif (pwr == 124) then -- ATMA_OF_THE_ZENITH                       KI ID = 1678;
    elseif (pwr == 125) then -- ATMA_OF_PERFECT_ATTENDANCE               KI ID = 1679;
    elseif (pwr == 126) then -- ATMA_OF_THE_RESCUER                      KI ID = 1680;
    elseif (pwr == 127) then -- ATMA_OF_NIGHTMARES                       KI ID = 1681;
    elseif (pwr == 128) then -- ATMA_OF_THE_EINHERJAR                    KI ID = 1682;
    elseif (pwr == 129) then -- ATMA_OF_THE_ILLUMINATOR                  KI ID = 1683;
    elseif (pwr == 130) then -- ATMA_OF_THE_BUSHIN                       KI ID = 1684;
    elseif (pwr == 131) then -- ATMA_OF_THE_ACE_ANGLER                   KI ID = 1685;
    elseif (pwr == 132) then -- ATMA_OF_THE_MASTER_CRAFTER               KI ID = 1686;
    elseif (pwr == 133) then -- ATMA_OF_INGENUITY                        KI ID = 1687;
    elseif (pwr == 134) then -- ATMA_OF_THE_GRIFFONS_CLAW                KI ID = 1688;
    elseif (pwr == 135) then -- ATMA_OF_THE_FETCHING_FOOTPAD             KI ID = 1689;
    elseif (pwr == 136) then -- ATMA_OF_UNDYING_LOYALTY                  KI ID = 1690;
    elseif (pwr == 137) then -- ATMA_OF_THE_ROYAL_LINEAGE                KI ID = 1691;
    elseif (pwr == 138) then -- ATMA_OF_THE_SHATTERING_STAR              KI ID = 1692;
    elseif (pwr == 139) then -- ATMA_OF_THE_COBRA_COMMANDER              KI ID = 1693;
    elseif (pwr == 140) then -- ATMA_OF_ROARING_LAUGHTER                 KI ID = 1694;
    elseif (pwr == 141) then -- ATMA_OF_THE_DARK_BLADE                   KI ID = 1695;
    elseif (pwr == 142) then -- ATMA_OF_THE_DUCAL_GUARD                  KI ID = 1696;
    elseif (pwr == 143) then -- ATMA_OF_HARMONY                          KI ID = 1697;
    elseif (pwr == 144) then -- ATMA_OF_REVELATIONS                      KI ID = 1698;
    elseif (pwr == 145) then -- ATMA_OF_THE_SAVIOR                       KI ID = 1699;
    end
end;

function atmaEffectLose(target, effect)
    local pwr = effect:getPower();
    if (pwr == 1) then -- ATMA of the Lion
        target:delMod(MOD_TRIPLE_ATTACK, 7);
        target:delMod(MOD_DMGPHYS, -10);
        target:delMod(MOD_THUNDERATT, 30);
    elseif (pwr == 2) then -- ATMA_OF_THE_STOUT_ARM
        target:delMod(MOD_STR, 40);
        target:delMod(MOD_ATT, 50);
        target:delMod(MOD_RATT, 40);
    elseif (pwr == 3) then -- ATMA_OF_THE_TWIN_CLAW
        target:delMod(MOD_DEF, 40);
        target:delMod(MOD_MDEF, 20);
        target:delMod(MOD_CHARMRES, 20);
    elseif (pwr == 4) then -- ATMA_OF_ALLURE
        target:delMod(MOD_MPP, 30);
        target:delMod(MOD_MND, 30);
        target:delMod(MOD_ENMITY, -30);
    elseif (pwr == 5) then -- ATMA_OF_ETERNITY
        target:delMod(MOD_ENEMYCRITRATE, -20);
        target:delMod(MOD_SLOWRES, 30);
        target:delMod(MOD_CURSERES, 30);
    elseif (pwr == 6) then -- ATMA_OF_THE_HEAVENS
        target:delMod(MOD_MACC, 30);
        target:delMod(MOD_DMGPHYS, -10);
        target:delMod(MOD_PARALYZERES, 30);
    elseif (pwr == 7) then -- ATMA_OF_THE_BAYING_MOON
        target:delMod(MOD_ATT, 30);
        target:delMod(MOD_MATT, 30);
    elseif (pwr == 8) then -- ATMA_OF_THE_EBON_HOOF
        target:delMod(MOD_HPP, 30);
        target:delMod(MOD_SLEEPRES, 50);
    elseif (pwr == 9) then -- ATMA_OF_TREMORS
        target:delMod(MOD_DMG, -20);
        target:delMod(MOD_SILENCERES, 40);
    elseif (pwr == 10) then -- ATMA_OF_THE_SAVAGE_TIGER
        target:delMod(MOD_AGI, 30);
        target:delMod(MOD_DOUBLE_ATTACK, 10);
    elseif (pwr == 11) then -- ATMA_OF_THE_VORACIOUS_VIOLET
        target:delMod(MOD_STR, 50);
        target:delMod(MOD_DOUBLE_ATTACK, 10);
        target:delMod(MOD_REGAIN, 20);
    elseif (pwr == 12) then -- ATMA_OF_CLOAK_AND_DAGGER
        target:delMod(MOD_ACC, 40);
        target:delMod(MOD_EVA, 40);
    elseif (pwr == 13) then -- ATMA_OF_THE_STORMBIRD
        target:delMod(MOD_ACC, 40);
        target:delMod(MOD_THUNDERATT, 40);
        target:delMod(MOD_REFRESH, 5);
    elseif (pwr == 14) then -- ATMA_OF_THE_NOXIOUS_FANG
        target:delMod(MOD_SUBTLE_BLOW, 40);
        target:delMod(MOD_WATERATT, 40);
        target:delMod(MOD_POISONRES, 40);
    elseif (pwr == 15) then -- ATMA_OF_VICISSITUDE
        target:delMod(MOD_DEF, 40);
        target:delMod(MOD_MDEF, 20);
        target:delMod(MOD_REGEN, 15);
    elseif (pwr == 16) then -- ATMA_OF_THE_BEYOND
        target:delMod(MOD_MATT, 30);
        target:delMod(MOD_ICEATT, 30);
        target:delMod(MOD_LIGHTATT, 30);
    elseif (pwr == 17) then -- ATMA_OF_STORMBREATH
        target:delMod(MOD_VIT, 30);
        target:delMod(MOD_DMGBREATH, -30);
    elseif (pwr == 18) then -- ATMA_OF_GALES
        target:delMod(MOD_WINDATT, 30);
        target:delMod(MOD_WINDACC, 30);
    elseif (pwr == 19) then -- ATMA_OF_THRASHING_TENDRILS
        target:delMod(MOD_CHR, 30);
        target:delMod(MOD_CRITHITRATE, 20);
    elseif (pwr == 20) then -- ATMA_OF_THE_DRIFTER
        target:delMod(MOD_RATT, 30);
        target:delMod(MOD_RACC, 40);
    elseif (pwr == 21) then -- ATMA_OF_THE_STRONGHOLD
        target:delMod(MOD_ATT, 40);
        target:delMod(MOD_DEF, 40);
        target:delMod(MOD_REGEN, 15);
    elseif (pwr == 22) then -- ATMA_OF_THE_HARVESTER
        target:delMod(MOD_STR, 30);
        target:delMod(MOD_DOUBLE_ATTACK, 10);
        target:delMod(MOD_SLEEPRES, 40);
    elseif (pwr == 23) then -- ATMA_OF_DUNES
        target:delMod(MOD_STORETP, 20);
        target:delMod(MOD_SLOWRES, 40);
    elseif (pwr == 24) then -- ATMA_OF_THE_COSMOS
        target:delMod(MOD_DARKATT, 40);
        target:delMod(MOD_AMNESIARES, 40);
        target:delMod(MOD_SILENCERES, 40);
    elseif (pwr == 25) then -- ATMA_OF_THE_SIREN_SHADOW
        target:delMod(MOD_ATT, 40);
        target:delMod(MOD_EVA, 40);
        target:delMod(MOD_PARALYZERES, 40);
    elseif (pwr == 26) then -- ATMA_OF_THE_IMPALER
        target:delMod(MOD_DOUBLE_ATTACK, 20);
        target:delMod(MOD_BINDRES, 40);
        target:delMod(MOD_BLINDRES, 40);
    elseif (pwr == 27) then -- ATMA_OF_THE_ADAMANTINE
        target:delMod(MOD_VIT, 20);
        target:delMod(MOD_DEF, 40);
    elseif (pwr == 28) then -- ATMA_OF_CALAMITY
        target:delMod(MOD_SLOWRES, 40);
        target:delMod(MOD_BLINDRES, 40);
    elseif (pwr == 29) then -- ATMA_OF_THE_CLAW
        target:delMod(MOD_EARTHATT, 30);
        target:delMod(MOD_EARTHACC, 40);
    elseif (pwr == 30) then -- ATMA_OF_BALEFUL_BONES
        target:delMod(MOD_STR, 20);
        target:delMod(MOD_DARKACC, 40)
    elseif (pwr == 31) then -- ATMA_OF_THE_CLAWED_BUTTERFLY
        target:delMod(MOD_FIREACC, 40);
        target:delMod(MOD_INT, 30);
    elseif (pwr == 32) then -- ATMA_OF_THE_DESERT_WORM
        target:delMod(MOD_MND, 20);
        target:delMod(MOD_ACC, 40);
        target:delMod(MOD_MAGIC_NULL, 5);
    elseif (pwr == 33) then -- ATMA_OF_THE_UNDYING
        target:delMod(MOD_MND, 40);
        target:delMod(MOD_CONSERVE_MP, 10);
        target:delMod(MOD_ICEATT, 20);
    elseif (pwr == 34) then -- ATMA_OF_THE_IMPREGNABLE_TOWER
        target:delMod(MOD_HP, 50);
        target:delMod(MOD_MACC, 40);
        target:delMod(MOD_MATT, 40);
    elseif (pwr == 35) then -- ATMA_OF_THE_SMOLDERING_SKY
        target:delMod(MOD_ATT, 20);
        target:delMod(MOD_MACC, 40);
        target:delMod(MOD_FIREATT, 30);
    elseif (pwr == 36) then -- ATMA_OF_THE_DEMONIC_SKEWER
        target:delMod(MOD_STR, 20);
        target:delMod(MOD_TP_BONUS, 20);
        target:delMod(MOD_NULL_PHYSICAL_DAMAGE, 5);
    elseif (pwr == 37) then -- ATMA_OF_THE_GOLDEN_CLAW
        target:delMod(MOD_SKILLCHAINBONUS, 20);
        target:delMod(MOD_STR, 20);
    elseif (pwr == 38) then -- ATMA_OF_THE_GLUTINOUS_OOZE
        target:delMod(MOD_MND, 20);
        target:delMod(MOD_WATERACC, 20);
    elseif (pwr == 39) then -- ATMA_OF_THE_LIGHTNING_BEAST
        target:delMod(MOD_UFASTCAST, 20);
        target:delMod(MOD_SPELLINTERRUPT, 20);
    elseif (pwr == 40) then -- ATMA_OF_THE_NOXIOUS_BLOOM
        target:delMod(MOD_STORETP, 20);
        target:delMod(MOD_WALTZ_POTENTCY, 10);
    elseif (pwr == 41) then -- ATMA_OF_THE_GNARLED_HORN
        target:delMod(MOD_AGI, 50);
        target:delMod(MOD_CRITHITRATE, 20);
        target:delMod(MOD_COUNTER, 10);
    elseif (pwr == 42) then -- ATMA_OF_THE_STRANGLING_WIND
        target:delMod(MOD_STR, 20);
        target:delMod(MOD_VIT, 20);
        target:delMod(MOD_AGI, 30);
    elseif (pwr == 43) then -- ATMA_OF_THE_DEEP_DEVOURER
        target:delMod(MOD_SUBTLE_BLOW, 5);
        target:delMod(MOD_STORETP, 5);
        -- target:delMod(MOD_SONG_CASTING_TIME, -20); Doesnt exist
    elseif (pwr == 44) then -- ATMA_OF_THE_MOUNTED_CHAMPION
        target:delMod(MOD_VIT, 50);
        target:delMod(MOD_REGEN, 20);
        target:delMod(MOD_ENMITY_REDUCTION_PHYSICAL, -20);
    elseif (pwr == 45) then -- ATMA_OF_THE_RAZED_RUINS
        target:delMod(MOD_DEX, 50);
        target:delMod(MOD_CRITHITRATE, 30);
        target:delMod(MOD_CRIT_DMG_INCREASE, 10);
    elseif (pwr == 46) then -- ATMA_OF_THE_BLUDGEONING_BRUTE
        target:delMod(MOD_REGAIN, 1);
        target:delMod(MOD_THUNDERRES, 50);
        target:delMod(MOD_WATERRES, 50);
    elseif (pwr == 47) then -- ATMA_OF_THE_RAPID_REPTILIAN
        target:delMod(MOD_TRIPLE_ATTACK, 5);
        target:delMod(MOD_DMGBREATH, -40);
    elseif (pwr == 48) then -- ATMA_OF_THE_WINGED_ENIGMA
        target:delMod(MOD_HASTE_GEAR, 5);
    elseif (pwr == 49) then -- ATMA_OF_THE_CRADLE
        target:delMod(MOD_VIT, 20);
        target:delMod(MOD_DEX, 20);
    elseif (pwr == 50) then -- ATMA_OF_THE_UNTOUCHED
        target:delMod(MOD_CHR, 20);
        target:delMod(MOD_TRIPLE_ATTACK, 5);
    elseif (pwr == 51) then -- ATMA_OF_THE_SANGUINE_SCYTHE
        target:delMod(MOD_HPP, 20);
        target:delMod(MOD_CRIT_DMG_INCREASE, 10);
        target:delMod(MOD_ENMITY, 20);
    elseif (pwr == 52) then -- ATMA_OF_THE_TUSKED_TERROR
        target:delMod(MOD_UFASTCAST, 20);
        target:delMod(MOD_WATERATT, 20);
        target:delMod(MOD_WATERACC, 20);
    elseif (pwr == 53) then -- ATMA_OF_THE_MINIKIN_MONSTROSITY
        target:delMod(MOD_REFRESH, 10);
        target:delMod(MOD_INT, 50);
        target:delMod(MOD_ENMITY, -20);
    elseif (pwr == 54) then -- ATMA_OF_THE_WOULD_BE_KING
        target:delMod(MOD_REGAIN, 10);
        target:delMod(MOD_STORETP, 20);
        target:delMod(MOD_TP_BONUS, 20);
    elseif (pwr == 55) then -- ATMA_OF_THE_BLINDING_HORN
        target:delMod(MOD_CONSERVE_MP, 20);
        target:delMod(MOD_THUNDERATT, 30);
        target:delMod(MOD_DMGMAGIC, -20);
    elseif (pwr == 56) then -- ATMA_OF_THE_DEMONIC_LASH
        target:delMod(MOD_ATT, 40);
        target:delMod(MOD_DOUBLE_ATTACK, 10);
        target:delMod(MOD_MAGIC_ABSORB, 20);
    elseif (pwr == 57) then -- ATMA_OF_APPARITIONS
        target:delMod(MOD_EVA, 20);
        target:delMod(MOD_WINDRES, 50);
    elseif (pwr == 58) then -- ATMA_OF_THE_SHIMMERING_SHELL
        target:delMod(MOD_AGI, 20);
        target:delMod(MOD_FIRERES, 50);
    elseif (pwr == 59) then -- ATMA_OF_THE_MURKY_MIASMA
        target:delMod(MOD_DARKRES, 50);
        target:delMod(MOD_STUNRES, 30);
    elseif (pwr == 60) then -- ATMA_OF_THE_AVARICIOUS_APE
        target:delMod(MOD_HASTE_GEAR, 5);
        -- not implemented: Monster Correlation
    elseif (pwr == 61) then -- ATMA_OF_THE_MERCILESS_MATRIARCH
        target:delMod(MOD_MACC, 50);
        target:delMod(MOD_FASTCAST, 20);
        target:delMod(MOD_ENMITY, -50);
    elseif (pwr == 62) then -- ATMA_OF_THE_BROTHER_WOLF
        target:delMod(MOD_MATT, 20);
        target:delMod(MOD_MDEF, 20);
        target:delMod(MOD_FIRERES, 100);
    elseif (pwr == 63) then -- ATMA_OF_THE_EARTH_WYRM
        target:delMod(MOD_EARTHRES, 100);
        target:delMod(MOD_DMG, -20);
        target:delMod(MOD_FORCE_EARTH_DWBONUS, 1);
    elseif (pwr == 64) then -- ATMA_OF_THE_ASCENDING_ONE
        target:delMod(MOD_WINDRES, 100);
        target:delMod(MOD_HASTE_GEAR, 5);
        target:delMod(MOD_SNAP_SHOT, 5);
    elseif (pwr == 65) then -- ATMA_OF_THE_SCORPION_QUEEN
        target:delMod(MOD_STORETP, 20);
        target:delMod(MOD_CRITHITRATE, 30);
        target:delMod(MOD_BINDRES, 50);
    elseif (pwr == 66) then -- ATMA_OF_A_THOUSAND_NEEDLES
        target:delMod(MOD_HPP, 20);
        target:delMod(MOD_MPP, 20);
        target:delMod(MOD_DEX, 10);
    elseif (pwr == 67) then -- ATMA_OF_THE_BURNING_EFFIGY
        target:delMod(MOD_STR, 20);
        -- fire based ws + 0.2 fTP
        target:delMod(MOD_FORCE_FIRE_DWBONUS, 1);
    elseif (pwr == 68) then -- ATMA_OF_THE_SMITING_BLOW
        target:delMod(MOD_TP_BONUS, 50);
        target:delMod(MOD_WSACC, 50);
    elseif (pwr == 69) then -- ATMA_OF_THE_LONE_WOLF
        target:delMod(MOD_ATT, 20);
        target:delMod(MOD_FIREATT, 30);
    elseif (pwr == 70) then -- ATMA_OF_THE_CRIMSON_SCALE
        target:delMod(MOD_HASTE_GEAR, 5);
        target:delMod(MOD_ENMITY, -20);
    elseif (pwr == 71) then -- ATMA_OF_THE_SCARLET_WING
        target:delMod(MOD_ELEM, 10);
        target:delMod(MOD_FORCE_WIND_DWBONUS, 1);
    elseif (pwr == 72) then -- ATMA_OF_THE_RAISED_TAIL
        target:delMod(MOD_ATT, 40);
        target:delMod(MOD_EVA, 40);
    elseif (pwr == 73) then -- ATMA_OF_THE_SAND_EMPEROR
        target:delMod(MOD_ACC, 40);
        target:delMod(MOD_EVA, 40);
    elseif (pwr == 74) then -- ATMA_OF_THE_OMNIPOTENT
        target:delMod(MOD_DEX, 50);
        target:delMod(MOD_HASTE_GEAR, 10);
        target:delMod(MOD_ENMITY, 20);
    elseif (pwr == 75) then -- ATMA_OF_THE_WAR_LION
        target:delMod(MOD_DEX, 20);
        target:delMod(MOD_THUNDERRES, 100);
        target:delMod(MOD_FORCE_LIGHTNING_DWBONUS, 1);
    elseif (pwr == 76) then -- ATMA_OF_THE_FROZEN_FETTERS
        target:delMod(MOD_INT, 20);
        target:delMod(MOD_ICERES, 100);
        target:delMod(MOD_FORCE_ICE_DWBONUS, 1);
    elseif (pwr == 77) then -- ATMA_OF_THE_PLAGUEBRINGER
        target:delMod(MOD_REGEN, 10);
        target:delMod(MOD_STORETP, 20);
        target:delMod(MOD_DOUBLE_ATTACK, 7);
    elseif (pwr == 78) then -- ATMA_OF_THE_SHRIEKING_ONE
        target:delMod(MOD_DEF, 60);
        target:delMod(MOD_MDEF, 20);
        target:delMod(MOD_STORETP, 20);
    elseif (pwr == 79) then -- ATMA_OF_THE_HOLY_MOUNTAIN
        target:delMod(MOD_LIGHTRES, 100);
        target:delMod(MOD_LIGHTACC, 50);
        target:delMod(MOD_FORCE_LIGHT_DWBONUS, 1);
    elseif (pwr == 80) then -- ATMA_OF_THE_LAKE_LURKER
        target:delMod(MOD_MND, 20);
        target:delMod(MOD_WATERRES, 100);
        target:delMod(MOD_FORCE_WATER_DWBONUS, 1);
    elseif (pwr == 81) then -- ATMA_OF_THE_CRUSHING_CUDGEL
        target:delMod(MOD_ACC, 20);
        target:delMod(MOD_SKILLCHAINDMG, 5);
    elseif (pwr == 82) then -- ATMA_OF_PURGATORY
        target:delMod(MOD_VIT, 40);
        target:delMod(MOD_INT, 40);
    elseif (pwr == 83) then -- ATMA_OF_BLIGHTED_BREATH
        -- target:delMod(MOD_SONG_CASTING_TIME, -40); Doesnt exist
        target:delMod(MOD_LIGHTACC, 40);
    elseif (pwr == 84) then -- ATMA_OF_THE_PERSISTENT_PREDATOR
        target:delMod(MOD_STORETP, 40);
        target:delMod(MOD_TP_BONUS, 10);
    elseif (pwr == 85) then -- ATMA_OF_THE_STONE_GOD
        target:delMod(MOD_SUBTLE_BLOW, 40);
        target:delMod(MOD_ENMITY, 40);
    elseif (pwr == 86) then -- ATMA_OF_THE_SUN_EATER
        target:delMod(MOD_STORETP, 40);
        target:delMod(MOD_TP_BONUS, 40);
    elseif (pwr == 87) then -- ATMA_OF_THE_DESPOT
        target:delMod(MOD_CHR, 50);
        target:delMod(MOD_MAGIC_ABSORB, 15);
        target:delMod(MOD_TP_BONUS, 40);
    elseif (pwr == 88) then -- ATMA_OF_THE_SOLITARY_ONE
        target:delMod(MOD_TRIPLE_ATTACK, 7);
        target:delMod(MOD_DMGBREATH, -25);
        target:delMod(MOD_ZANSHIN, 10);
    elseif (pwr == 89) then -- ATMA_OF_THE_WINGED_GLOOM
        target:delMod(MOD_DMG, -25);
        target:delMod(MOD_REGEN, 2);
    elseif (pwr == 90) then -- ATMA_OF_THE_SEA_DAUGHTER
        target:delMod(MOD_REGAIN, 5);
        target:delMod(MOD_HASTE_GEAR, -12);
        target:delMod(MOD_REGEN, 30);
    elseif (pwr == 91) then -- ATMA_OF_THE_HATEFUL_STREAM
        -- Not yet implemented
        -- http://wiki.ffxiclopedia.org/wiki/Atma_of_the_Hateful_Stream
        -- No easy way to do this ATMA, no way I am doing bit crap in onTick for it..
    elseif (pwr == 92) then -- ATMA_OF_THE_FOE_FLAYER
        target:delMod(MOD_MPP, 20);
        target:delMod(MOD_REFRESH, 20);
        target:delMod(MOD_FASTCAST, 20);
        target:delMod(MOD_MACC, 50);
    elseif (pwr == 93) then -- ATMA_OF_THE_ENDLESS_NIGHTMARE
        target:delMod(MOD_MND, 20);
        target:delMod(MOD_DARKRES, 100);
        target:delMod(MOD_FORCE_DARK_DWBONUS, 1);
    elseif (pwr == 94) then -- ATMA_OF_THE_SUNDERING_SLASH
        target:delMod(MOD_ATT, 20);
        target:delMod(MOD_REGAIN, 3);
    elseif (pwr == 95) then -- ATMA_OF_ENTWINED_SERPENTS
        target:delMod(MOD_ATT, 20);
        target:delMod(MOD_DOUBLE_ATTACK, 15);
    elseif (pwr == 96) then -- ATMA_OF_THE_HORNED_BEAST
        target:delMod(MOD_ACC, 60);
        target:delMod(MOD_PETRIFYRES, 50);
    elseif (pwr == 97) then -- ATMA_OF_AQUATIC_ARDOR
        target:delMod(MOD_ABSORB_DMG_CHANCE, 6);
        target:delMod(MOD_MAGIC_ABSORB, 6);
    elseif (pwr == 98) then -- ATMA_OF_THE_FALLEN_ONE
        target:delMod(MOD_INT, 30);
        target:delMod(MOD_MND, 30);
    elseif (pwr == 99) then -- ATMA_OF_FIRES_AND_FLARES
        target:delMod(MOD_AGI, 20);
        target:delMod(MOD_RATT, 40);
    elseif (pwr == 100) then -- ATMA_OF_THE_APOCALYPSE
        target:delMod(MOD_TRIPLE_ATTACK, 15);
        -- target:delMod(MOD_GRIMOIRE_INSTANT_CAST, 10); -- Wrong modifier, correct one not yet implimented.
        target:delMod(MOD_RERAISE_III, 1);
    elseif (pwr == 101) then -- ATMA_OF_THE_HEIR                         KI ID = 1655;
    elseif (pwr == 102) then -- ATMA_OF_THE_HERO                         KI ID = 1656;
    elseif (pwr == 103) then -- ATMA_OF_THE_FULL_MOON                    KI ID = 1657;
    elseif (pwr == 104) then -- ATMA_OF_ILLUSIONS                        KI ID = 1658;
    elseif (pwr == 105) then -- ATMA_OF_THE_BANISHER                     KI ID = 1659;
    elseif (pwr == 106) then -- ATMA_OF_THE_SELLSWORD                    KI ID = 1660;
    elseif (pwr == 107) then -- ATMA_OF_A_FUTURE_FABULOUS                KI ID = 1661;
    elseif (pwr == 108) then -- ATMA_OF_CAMARADERIE                      KI ID = 1662;
    elseif (pwr == 109) then -- ATMA_OF_THE_TRUTHSEEKER                  KI ID = 1663;
    elseif (pwr == 110) then -- ATMA_OF_THE_AZURE_SKY                    KI ID = 1664;
    elseif (pwr == 111) then -- ATMA_OF_ECHOES                           KI ID = 1665;
    elseif (pwr == 112) then -- ATMA_OF_DREAD                            KI ID = 1666;
    elseif (pwr == 113) then -- ATMA_OF_AMBITION                         KI ID = 1667;
    elseif (pwr == 114) then -- ATMA_OF_THE_BEAST_KING                   KI ID = 1668;
    elseif (pwr == 115) then -- ATMA_OF_THE_KIRIN                        KI ID = 1669;
    elseif (pwr == 116) then -- ATMA_OF_HELLS_GUARDIAN                   KI ID = 1670;
    elseif (pwr == 117) then -- ATMA_OF_LUMINOUS_WINGS                   KI ID = 1671;
    elseif (pwr == 118) then -- ATMA_OF_THE_DRAGON_RIDER                 KI ID = 1672;
    elseif (pwr == 119) then -- ATMA_OF_THE_IMPENETRABLE                 KI ID = 1673;
    elseif (pwr == 120) then -- ATMA_OF_ALPHA_AND_OMEGA                  KI ID = 1674;
    elseif (pwr == 121) then -- ATMA_OF_THE_ULTIMATE                     KI ID = 1675;
    elseif (pwr == 122) then -- ATMA_OF_THE_HYBRID_BEAST                 KI ID = 1676;
    elseif (pwr == 123) then -- ATMA_OF_THE_DARK_DEPTHS                  KI ID = 1677;
    elseif (pwr == 124) then -- ATMA_OF_THE_ZENITH                       KI ID = 1678;
    elseif (pwr == 125) then -- ATMA_OF_PERFECT_ATTENDANCE               KI ID = 1679;
    elseif (pwr == 126) then -- ATMA_OF_THE_RESCUER                      KI ID = 1680;
    elseif (pwr == 127) then -- ATMA_OF_NIGHTMARES                       KI ID = 1681;
    elseif (pwr == 128) then -- ATMA_OF_THE_EINHERJAR                    KI ID = 1682;
    elseif (pwr == 129) then -- ATMA_OF_THE_ILLUMINATOR                  KI ID = 1683;
    elseif (pwr == 130) then -- ATMA_OF_THE_BUSHIN                       KI ID = 1684;
    elseif (pwr == 131) then -- ATMA_OF_THE_ACE_ANGLER                   KI ID = 1685;
    elseif (pwr == 132) then -- ATMA_OF_THE_MASTER_CRAFTER               KI ID = 1686;
    elseif (pwr == 133) then -- ATMA_OF_INGENUITY                        KI ID = 1687;
    elseif (pwr == 134) then -- ATMA_OF_THE_GRIFFONS_CLAW                KI ID = 1688;
    elseif (pwr == 135) then -- ATMA_OF_THE_FETCHING_FOOTPAD             KI ID = 1689;
    elseif (pwr == 136) then -- ATMA_OF_UNDYING_LOYALTY                  KI ID = 1690;
    elseif (pwr == 137) then -- ATMA_OF_THE_ROYAL_LINEAGE                KI ID = 1691;
    elseif (pwr == 138) then -- ATMA_OF_THE_SHATTERING_STAR              KI ID = 1692;
    elseif (pwr == 139) then -- ATMA_OF_THE_COBRA_COMMANDER              KI ID = 1693;
    elseif (pwr == 140) then -- ATMA_OF_ROARING_LAUGHTER                 KI ID = 1694;
    elseif (pwr == 141) then -- ATMA_OF_THE_DARK_BLADE                   KI ID = 1695;
    elseif (pwr == 142) then -- ATMA_OF_THE_DUCAL_GUARD                  KI ID = 1696;
    elseif (pwr == 143) then -- ATMA_OF_HARMONY                          KI ID = 1697;
    elseif (pwr == 144) then -- ATMA_OF_REVELATIONS                      KI ID = 1698;
    elseif (pwr == 145) then -- ATMA_OF_THE_SAVIOR                       KI ID = 1699;
    end
end;