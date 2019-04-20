------------------------------------
-- WEAPONSKILL IDs
--
-- Contains readable values for Weaponskill IDs
------------------------------------


dsp = dsp or {}

dsp.weaponskill =
{
    ------------------------------------
    -- H2H
    ------------------------------------
    COMBO               = 1,
    SHOULDER_TACKLE     = 2,
    ONE_INCH_PUNCH      = 3,
    BACKHAND_BLOW       = 4,
    RAGING_FISTS        = 5,
    SPINNING_ATTACK     = 6,
    HOWLING_FIST        = 7,
    DRAGON_KICK         = 8,
    ASURAN_FISTS        = 9,
    FINAL_HEAVEN        = 10,
    ASCETICS_FURY       = 11,
    STRINGING_PUMMEL    = 12,
    TORNADO_KICK        = 13,
    VICTORY_SMITE       = 14,
    SHIJIN_SPIRAL       = 15,

    ------------------------------------
    -- DAGGER
    ------------------------------------
    WASP_STING          = 16,
    VIPER_BITE          = 17,
    GUST_SLASH          = 19,
    SHADOWSTICH         = 18,
    CYCLONE             = 20,
    ENERGY_STEAL        = 21,
    ENERGY_DRAIN        = 22,
    DANCING_EDGE        = 23,
    SHARK_BITE          = 24,
    EVISCERATION        = 25,
    MERCY_STROKE        = 26,
    MANDALIC_STAB       = 27,
    MORDANT_RIME        = 28,
    PYRRHIC_KLEOS       = 29,
    AEOLIAN_EDGE        = 30,
    RUDRAS_STORM        = 31,
    EXENTERATOR         = 224,

    ------------------------------------
    -- SWORD
    ------------------------------------
    FAST_BLADE          = 32,
    BURNING_BLADE       = 33,
    RED_LOTUS_BLADE     = 34,
    FLAT_BLADE          = 35,
    SHINING_BLADE       = 36,
    SERAPH_BLADE        = 37,
    CIRCLE_BLADE        = 38,
    SPIRIT_WITHIN       = 39,
    VORPAL_BLADE        = 40,
    SWIFT_BLADE         = 41,
    SAVAGE_BLADE        = 42,
    KNIGHTS_OF_ROUND    = 43,
    DEATH_BLOSSOM       = 44,
    ATONEMENT           = 45,
    EXPIACION           = 46,
    SANGUINE_BLADE      = 47,
    CHANT_DU_CYGNE      = 225,
    REQUIESCAT          = 226,
    URIEL_BLADE         = 238,
    GLORY_SLASH         = 239,

    ------------------------------------
    -- GREAT SWORD
    ------------------------------------
    HARD_SLASH          = 48,
    POWER_SLASH         = 49,
    FROSTBITE           = 50,
    FREEZEBITE          = 51,
    SHOCKWAVE           = 52,
    CRESCENT_MOON       = 53,
    SICKLE_MOON         = 54,
    SPINNING_SLASH      = 55,
    GROUND_STRIKE       = 56,
    HERCULEAN_STRIKE    = 58,
    SCOURGE             = 57,
    TORCLEAVER          = 59,
    RESOLUTION          = 60,

    ------------------------------------
    -- AXE
    ------------------------------------
    RAGING_AXE          = 64,
    SMASH_AXE           = 65,
    GALE_AXE            = 66,
    AVALANCHE_AXE       = 67,
    SPINNING_AXE        = 68,
    RAMPAGE             = 69,
    CALAMITY            = 70,
    MISTRAL_AXE         = 71,
    DECIMATION          = 72,
    ONSLAUGHT           = 73,
    PRIMAL_REND         = 74,
    BORA_AXE            = 75,
    CLOUDSPLITTER       = 76,
    RUINATOR            = 77,

    ------------------------------------
    -- GREAT AXE
    ------------------------------------
    SHIELD_BREAK        = 80,
    IRON_TEMPEST        = 81,
    STURMWIND           = 82,
    ARMOR_BREAK         = 83,
    KEEN_EDGE           = 84,
    WEAPON_BREAK        = 85,
    RAGING_RUSH         = 86,
    FULL_BREAK          = 87,
    STEEL_CYCLONE       = 88,
    METATRON_TORMENT    = 89,
    KINGS_JUSTICE       = 90,
    FELL_CLEAVE         = 91,
    UKKOS_FURY          = 92,
    UPHEAVAL            = 93,

    ------------------------------------
    -- SCYTHE
    ------------------------------------
    SLICE               = 96,
    DARK_HARVEST        = 97,
    SHADOW_OF_DEATH     = 98,
    NIGHTMARE_SCYTHE    = 99,
    SPINNING_SCYTHE     = 100,
    VORPAL_SCYTHE       = 101,
    GUILLOTINE          = 102,
    CROSS_REAPER        = 103,
    SPIRAL_HELL         = 104,
    CATASTROPHE         = 105,
    INSURGENCY          = 106,
    INFERNAL_SCYTHE     = 107,
    QUIETUS             = 108,
    ENTROPY             = 109,

    ------------------------------------
    -- POLEARM
    ------------------------------------
    DOUBLE_THRUST       = 112,
    THUNDER_THRUST      = 113,
    RAIDEN_THRUST       = 114,
    LEG_SWEEP           = 115,
    PENTA_THRUST        = 116,
    VORPAL_THRUST       = 117,
    SKEWER              = 118,
    WHEELING_THRUST     = 119,
    IMPULSE_DRIVE       = 120,
    GEIRSKOGUL          = 121,
    DRAKESBANE          = 122,
    SONIC_THRUST        = 123,
    CAMLANNS_TORMENT    = 124,
    STARDIVER           = 125,

    ------------------------------------
    -- KATANA
    ------------------------------------
    BLADE_RIN           = 128,
    BLADE_RETSU         = 129,
    BLADE_TEKI          = 130,
    BLADE_TO            = 131,
    BLADE_CHI           = 132,
    BLADE_EI            = 133,
    BLADE_JIN           = 134,
    BLADE_TEN           = 135,
    BLADE_KU            = 136,
    BLADE_METSU         = 137,
    BLADE_KAMU          = 138,
    BLADE_YU            = 139,
    BLADE_HI            = 140,
    BLADE_SHUN          = 141,

    ------------------------------------
    -- GREAT KATANA
    ------------------------------------
    TACHI_ENPI          = 144,
    TACHI_HOBAKU        = 145,
    TACHI_GOTEN         = 146,
    TACHI_KAGERO        = 147,
    TACHI_JINPU         = 148,
    TACHI_KOKI          = 149,
    TACHI_YUKIKAZE      = 150,
    TACHI_GEKKO         = 151,
    TACHI_KASHA         = 152,
    TACHI_KAITEN        = 153,
    TACHI_RANA          = 154,
    TACHI_AGEHA         = 155,
    TACHI_FUDO          = 156,
    TACHI_SHOHA         = 157,

    ------------------------------------
    -- CLUB
    ------------------------------------
    SHINING_STRIKE      = 160,
    SERAPH_STRIKE       = 161,
    BRAINSHAKER         = 162,
    STARLIGHT           = 163,
    MOONLIGHT           = 164,
    SKULLBREAKER        = 165,
    TRUE_STRIKE         = 166,
    JUDGMENT            = 167,
    HEXA_STRIKE         = 168,
    BLACK_HALO          = 169,
    RANDGRITH           = 170,
    MYSTIC_BOON         = 171,
    FLASH_NOVA          = 172,
    DAGAN               = 173,
    REALMRAZER          = 174,

    ------------------------------------
    -- STAFF
    ------------------------------------
    HEAVY_SWING         = 176,
    ROCK_CRUSHER        = 177,
    EARTH_CRUSHER       = 178,
    STARBURST           = 179,
    SUNBURST            = 180,
    SHELL_CRUSHER       = 181,
    FULL_SWING          = 182,
    SPIRIT_TAKER        = 183,
    RETRIBUTION         = 184,
    GATE_OF_TARTARUS    = 185,
    VIDOHUNIR           = 186,
    GARLAND_OF_BLISS    = 187,
    OMNISCIENCE         = 188,
    CATACLYSM           = 189,
    MYRKR               = 190,
    SHATTERSOUL         = 191,
    TARTARUS_TORPOR     = 240,

    ------------------------------------
    -- ARCHERY
    ------------------------------------
    FLAMING_ARROW       = 192,
    PIERCING_ARROW      = 193,
    DULLING_ARROW       = 194,
    SIDEWINDER          = 196,
    BLAST_ARROW         = 197,
    ARCHING_ARROW       = 198,
    EMPYREAL_ARROW      = 199,
    NAMAS_ARROW         = 200,
    REFULGENT_ARROW     = 201,
    JISHNUS_RADIANCE    = 202,
    APEX_ARROW          = 203,

    ------------------------------------
    -- MARKSMANSHIP
    ------------------------------------
    HOT_SHOT            = 208,
    SPLIT_SHOT          = 209,
    SNIPER_SHOT         = 210,
    SLUG_SHOT           = 212,
    BLAST_SHOT          = 213,
    HEAVY_SHOT          = 214,
    DETONATOR           = 215,
    CORONACH            = 216,
    TRUEFLIGHT          = 217,
    LEADEN_SALUTE       = 218,
    NUMBING_SHOT        = 219,
    WILDFIRE            = 220,
    LAST_STAND          = 221,
}
dsp.ws = dsp.weaponskill


dsp.ws.ele = 
{
    FIRE            = 1,
    FIRE_LIGHT      = 2,
    EARTH           = 3,
    WATER           = 4, 
    WIND            = 5,
    ICE             = 6,
    ICE_WATER       = 7,
    THUNDER         = 8,
    THUNDER_WIND    = 9,
    LIGHT           = 10,
    LIGHT_LIGHT     = 11,
    DARK            = 12,
    DARK_EARTH      = 13,
    DARK_DARK       = 14,

}


ele = dsp.ws.ele

dsp.ws.chain =  
{
    --                                          LEVEL 1                         LEVEL 2                 LEVEL 3
    [ele.FIRE]          = {{ele.FIRE},          {ele.EARTH},                     {ele.FIRE_LIGHT},           {}},
    [ele.FIRE_LIGHT]    = {{ele.FIRE_LIGHT},    {},                              {ele.DARK_EARTH},       {ele.THUNDER_WIND}}, 
    [ele.EARTH]         = {{ele.EARTH},         {ele.FIRE, ele.WIND, ele.WATER},         {},                 {}},
    [ele.WATER]         = {{ele.WATER},         {ele.ICE, ele.THUNDER},                  {},                 {}}, 
    [ele.WIND]          = {{ele.WIND},          {ele.EARTH},                     {ele.DARK_EARTH},           {}},
    [ele.ICE]           = {{ele.ICE},           {ele.THUNDER, ele.DARK},         {ele.THUNDER_WIND},         {}},
    [ele.ICE_WATER]     = {{ele.ICE_WATER},     {},                              {ele.FIRE_LIGHT},       {ele.DARK_EARTH}}, 
    [ele.THUNDER]       = {{ele.THUNDER},       {ele.FIRE, ele.WIND},                    {},                 {}}, 
    [ele.THUNDER_WIND]  = {{ele.THUNDER_WIND},  {},                              {ele.ICE_WATER},        {ele.FIRE_LIGHT}}, 
    [ele.LIGHT]         = {{ele.LIGHT},         {ele.WATER, ele.DARK},           {ele.ICE_WATER},            {}}, 
    [ele.LIGHT_LIGHT]   = {{ele.LIGHT_LIGHT},   {},                                      {},             {ele.LIGHT_LIGHT}},
    [ele.DARK]          = {{ele.DARK},          {ele.WIND, ele.LIGHT},                   {},                 {}},  
    [ele.DARK_EARTH]    = {{ele.DARK_EARTH},    {},                              {ele.THUNDER_WIND},     {ele.ICE_WATER}}, 
    [ele.DARK_DARK]     = {{ele.DARK_DARK},     {},                                      {},             {ele.DARK_DARK}},

}

dsp.ws.sc = 
{
    ------------------------------------
    -- H2H
    ------------------------------------

    [dsp.ws.COMBO]                          = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.SHOULDER_TACKLE]                = dsp.ws.chain[ele.WATER],
    [dsp.ws.ONE_INCH_PUNCH]                 = dsp.ws.chain[ele.DARK],
    [dsp.ws.BACKHAND_BLOW]                  = dsp.ws.chain[ele.WIND],
    [dsp.ws.RAGING_FISTS]                   = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.SPINNING_ATTACK]                = dsp.ws.chain[ele.FIRE],
    [dsp.ws.HOWLING_FIST]                   = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.DRAGON_KICK]                    = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.ASURAN_FISTS]                   = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.FINAL_HEAVEN]                   = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.ASCETICS_FURY]                  = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.STRINGING_PUMMEL]               = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.TORNADO_KICK]                   = dsp.ws.chain[ele.ICE],
    [dsp.ws.VICTORY_SMITE]                  = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.SHIJIN_SPIRAL]                  = dsp.ws.chain[ele.FIRE_LIGHT],

    ------------------------------------
    -- DAGGER
    ------------------------------------

    [dsp.ws.WASP_STING]                     = dsp.ws.chain[ele.EARTH],
    [dsp.ws.VIPER_BITE]                     = dsp.ws.chain[ele.EARTH],
    [dsp.ws.GUST_SLASH]                     = dsp.ws.chain[ele.WIND],
    [dsp.ws.SHADOWSTICH]                    = dsp.ws.chain[ele.WATER],
    [dsp.ws.CYCLONE]                        = dsp.ws.chain[ele.WIND],
    [dsp.ws.ENERGY_STEAL]                   = {{}, {}, {}},
    [dsp.ws.ENERGY_DRAIN]                   = {{}, {}, {}},
    [dsp.ws.DANCING_EDGE]                   = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SHARK_BITE]                     = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.EVISCERATION]                   = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.MERCY_STROKE]                   = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.MANDALIC_STAB]                  = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.MORDANT_RIME]                   = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.PYRRHIC_KLEOS]                  = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.AEOLIAN_EDGE]                   = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.RUDRAS_STORM]                   = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.EXENTERATOR]                    = dsp.ws.chain[ele.THUNDER_WIND],

    ------------------------------------
    -- SWORD
    ------------------------------------

    [dsp.ws.FAST_BLADE]                     = dsp.ws.chain[ele.EARTH],
    [dsp.ws.BURNING_BLADE]                  = dsp.ws.chain[ele.FIRE],
    [dsp.ws.RED_LOTUS_BLADE]                = dsp.ws.chain[ele.FIRE],
    [dsp.ws.FLAT_BLADE]                     = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.SHINING_BLADE]                  = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SERAPH_BLADE]                   = dsp.ws.chain[ele.EARTH],
    [dsp.ws.CIRCLE_BLADE]                   = dsp.ws.chain[ele.WATER],
    [dsp.ws.SPIRIT_WITHIN]                  = {{}, {}, {}}, 
    [dsp.ws.VORPAL_BLADE]                   = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SWIFT_BLADE]                    = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.SAVAGE_BLADE]                   = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.KNIGHTS_OF_ROUND]               = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.DEATH_BLOSSOM]                  = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.ATONEMENT]                      = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.EXPIACION]                      = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.SANGUINE_BLADE]                 = {{}, {}, {}},
    [dsp.ws.CHANT_DU_CYGNE]                 = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.REQUIESCAT]                     = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.URIEL_BLADE]                    = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.GLORY_SLASH]                    = dsp.ws.chain[ele.LIGHT_LIGHT],

    ------------------------------------
    -- GREAT SWORD
    ------------------------------------

    [dsp.ws.HARD_SLASH]                     = dsp.ws.chain[ele.HARD_SLASH],
    [dsp.ws.POWER_SLASH]                    = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.FROSTBITE]                      = dsp.ws.chain[ele.ICE],
    [dsp.ws.SHOCKWAVE]                      = dsp.ws.chain[ele.WATER],
    [dsp.ws.CRESCENT_MOON]                  = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SICKLE_MOON]                    = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SPINNING_SLASH]                 = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.GROUND_STRIKE]                  = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.HERCULEAN_STRIKE]               = dsp.ws.chain[ele.ICE],
    [dsp.ws.SCOURGE]                        = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.TORCLEAVER]                     = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.RESOLUTION]                     = dsp.ws.chain[ele.THUNDER_WIND],

    ------------------------------------
    -- AXE
    ------------------------------------

    [dsp.ws.RAGING_AXE]                     = dsp.ws.chain[ele.WIND],
    [dsp.ws.SMASH_AXE]                      = dsp.ws.chain[ele.WATER],
    [dsp.ws.GALE_AXE]                       = dsp.ws.chain[ele.WIND],
    [dsp.ws.AVALANCHE_AXE]                  = dsp.ws.chain[ele.EARTH],
    [dsp.ws.SPINNING_ATTACK]                = dsp.ws.chain[ele.FIRE],
    [dsp.ws.RAMPAGE]                        = dsp.ws.chain[ele.EARTH],
    [dsp.ws.CALAMITY]                       = dsp.ws.chain[ele.EARTH],
    [dsp.ws.MISTRAL_AXE]                    = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.DECIMATION]                     = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.ONSLAUGHT]                      = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.PRIMAL_REND]                    = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.BORA_AXE]                       = dsp.ws.chain[ele.EARTH],
    [dsp.ws.CLOUDSPLITTER]                  = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.RUINATOR]                       = dsp.ws.chain[ele.ICE_WATER],

    ------------------------------------
    -- GREAT AXE
    ------------------------------------

    [dsp.ws.SHIELD_BREAK]                   = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.IRON_TEMPEST]                   = dsp.ws.chain[ele.EARTH],
    [dsp.ws.STURMWIND]                      = dsp.ws.chain[ele.EARTH],
    [dsp.ws.ARMOR_BREAK]                    = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.KEEN_EDGE]                      = dsp.ws.chain[ele.DARK],
    [dsp.ws.WEAPON_BREAK]                   = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.RAGING_RUSH]                    = dsp.ws.chain[ele.ICE],
    [dsp.ws.FULL_BREAK]                     = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.STEEL_CYCLONE]                  = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.METATRON_TORMENT]               = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.KINGS_JUSTICE]                  = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.FELL_CLEAVE]                    = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.UKKOS_FURY]                     = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.UPHEAVAL]                       = dsp.ws.chain[ele.FIRE_LIGHT],

    ------------------------------------
    -- SCYTHE
    ------------------------------------

    [dsp.ws.SLICE]                          = dsp.ws.chain[ele.EARTH],
    [dsp.ws.DARK_HARVEST]                   = dsp.ws.chain[ele.WATER],
    [dsp.ws.SHADOW_OF_DEATH]                = dsp.ws.chain[ele.ICE],
    [dsp.ws.NIGHTMARE_SCYTHE]               = dsp.ws.chain[ele.DARK],
    [dsp.ws.SPINNING_SCYTHE]                = dsp.ws.chain[ele.WATER],
    [dsp.ws.VORPAL_SCYTHE]                  = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.GUILLOTINE]                     = dsp.ws.chain[ele.ICE],
    [dsp.ws.CROSS_REAPER]                   = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.SPIRAL_HELL]                    = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.CATASTROPHE]                    = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.INSURGENCY]                     = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.INFERNAL_SCYTHE]                = dsp.ws.chain[ele.DARK],
    [dsp.ws.QUIETUS]                        = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.ENTROPY]                        = dsp.ws.chain[ele.DARK_EARTH],

    ------------------------------------
    -- POLEARM
    ------------------------------------

    [dsp.ws.DOUBLE_THRUST]                  = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.THUNDER_THRUST]                 = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.RAIDEN_THRUST]                  = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.LEG_SWEEP]                      = dsp.ws.chain[ele.THUDNER],
    [dsp.ws.PENTA_THRUST]                   = dsp.ws.chain[ele.DARK],
    [dsp.ws.VORPAL_THRUST]                  = dsp.ws.chain[ele.WATER],
    [dsp.ws.SKEWER]                         = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.WHEELING_THRUST]                = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.IMPULSE_DRIVE]                  = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.GEIRSKOGUL]                     = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.DRAKESBANE]                     = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.SONIC_THRUST]                   = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.CAMLANNS_TORMENT]               = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.STARDIVER]                      = dsp.ws.chain[ele.DARK_EARTH],

    ------------------------------------
    -- KATANA
    ------------------------------------

    [dsp.ws.BLADE_RIN]                      = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.BLADE_RETSU]                    = dsp.ws.chain[ele.EARTH],
    [dsp.ws.BLADE_TEKI]                     = dsp.ws.chain[ele.WATER],
    [dsp.ws.BLADE_TO]                       = dsp.ws.chain[ele.ICE],
    [dsp.ws.BLADE_CHI]                      = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.BLADE_EI]                       = dsp.ws.chain[ele.DARK],
    [dsp.ws.BLADE_JIN]                      = dsp.ws.chain[ele.WIND],
    [dsp.ws.BLADE_TEN]                      = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.BLADE_KU]                       = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.BLADE_METSU]                    = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.BLADE_KAMU]                     = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.BLADE_YU]                       = dsp.ws.chain[ele.WATER],
    [dsp.ws.BLADE_HI]                       = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.BLADE_SHUN]                     = dsp.ws.chain[ele.FIRE_LIGHT],

    ------------------------------------
    -- GREAT KATANA
    ------------------------------------

    [dsp.ws.TACHI_ENPI]                     = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.TACHI_HOBAKU]                   = dsp.ws.chain[ele.ICE],
    [dsp.ws.TACHI_GOTEN]                    = dsp.ws.chain[ele.LIGHT],
    [dsp.ws.TACHI_KAGERO]                   = dsp.ws.chain[ele.FIRE],
    [dsp.ws.TACHI_JINPU]                    = dsp.ws.chain[ele.EARTH],
    [dsp.ws.TACHI_KOKI]                     = dsp.ws.chain[ele.WATER],
    [dsp.ws.TACHI_YUKIKAZE]                 = dsp.ws.chain[ele.ICE],
    [dsp.ws.TACHI_GEKKO]                    = dsp.ws.chain[ele.ICE_WATER],
    [dsp.ws.TACHI_KASHA]                    = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.TACHI_KAITEN]                   = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.TACHI_RANA]                     = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.TACHI_AGEHA]                    = dsp.ws.chain[ele.DARK],
    [dsp.ws.TACHI_FUDO]                     = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.TACHI_SHOHA]                    = dsp.ws.chain[ele.THUNDER_WIND],

    ------------------------------------
    -- CLUB
    ------------------------------------

    [dsp.ws.SHINING_STRIKE]                 = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.SERAPH_STRIKE]                  = dsp.ws.chain[ele.THUDNER],
    [dsp.ws.BRAINSHAKER]                    = dsp.ws.chain[ele.WATER],
    [dsp.ws.STARLIGHT]                      = {{}, {}, {}}, 
    [dsp.ws.MOONLIGHT]                      = {{}, {}, {}},
    [dsp.ws.SKULLBREAKER]                   = dsp.ws.chain[ele.ICE],
    [dsp.ws.TRUE_STRIKE]                    = dsp.ws.chain[ele.WIND],
    [dsp.ws.JUDGMENT]                       = dsp.ws.chain[ele.THUDNER],
    [dsp.ws.HEXA_STRIKE]                    = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.BLACK_HALO]                     = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.RANDGRITH]                      = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.MYSTIC_BOON]                    = {{}, {}, {}},
    [dsp.ws.FLASH_NOVA]                     = dsp.ws.chain[ele.ICE],
    [dsp.ws.DAGAN]                          = {{}, {}, {}},
    [dsp.ws.REALMRAZER]                     = dsp.ws.chain[ele.FIRE_LIGHT],

    ------------------------------------
    -- STAFF
    ------------------------------------

    [dsp.ws.HEAVY_SWING]                    = dsp.ws.chain[ele.THUDNER],
    [dsp.ws.ROCK_CRUSHER]                   = dsp.ws.chain[ele.THUNDER],
    [dsp.ws.EARTH_CRUSHER]                  = dsp.ws.chain[ele.WIND],
    [dsp.ws.STARBURST]                      = dsp.ws.chain[ele.DARK],
    [dsp.ws.SUNBURST]                       = dsp.ws.chain[ele.DARK],
    [dsp.ws.SHELL_CRUSHER]                  = dsp.ws.chain[ele.WIND],
    [dsp.ws.FULL_SWING]                     = dsp.ws.chain[ele.FIRE],
    [dsp.ws.SPIRIT_TAKER]                   = {{}, {}, {}},
    [dsp.ws.RETRIBUTION]                    = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.GATE_OF_TARTARUS]               = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.VIDOHUNIR]                      = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.GARLAND_OF_BLISS]               = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.OMNISCIENCE]                    = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.CATACLYSM]                      = dsp.ws.chain[ele.DARK],
    [dsp.ws.MYRKR]                          = {{}, {}, {}},
    [dsp.ws.SHATTERSOUL]                    = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.TARTARUS_TORPOR]                = {{}, {}, {}},

    ------------------------------------
    -- ARCHERY
    ------------------------------------

    [dsp.ws.FLAMING_ARROW]                  = dsp.ws.chain[ele.FIRE],
    [dsp.ws.PIERCING_ARROW]                 = dsp.ws.chain[ele.WATER],
    [dsp.ws.DULLING_ARROW]                  = dsp.ws.chain[ele.FIRE],
    [dsp.ws.SIDEWINDER]                     = dsp.ws.chain[ele.WATER],
    [dsp.ws.BLAST_ARROW]                    = dsp.ws.chain[ele.ICE],
    [dsp.ws.ARCHING_ARROW]                  = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.EMPYREAL_ARROW]                 = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.NAMAS_ARROW]                    = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.REFULGENT_ARROW]                = dsp.ws.chain[ele.WATER],
    [dsp.ws.JISHNUS_RADIANCE]               = dsp.ws.chain[ele.LIGHT_LIGHT],
    [dsp.ws.APEX_ARROW]                     = dsp.ws.chain[ele.THUNDER_WIND],

    ------------------------------------
    -- MARKSMANSHIP
    ------------------------------------

    [dsp.ws.HOT_SHOT]                       = dsp.ws.chain[ele.FIRE],
    [dsp.ws.SPLIT_SHOT]                     = dsp.ws.chain[ele.WATER],
    [dsp.ws.SNIPER_SHOT]                    = dsp.ws.chain[ele.FIRE],
    [dsp.ws.SLUG_SHOT]                      = dsp.ws.chain[ele.WATER],
    [dsp.ws.BLAST_SHOT]                     = dsp.ws.chain[ele.ICE],
    [dsp.ws.HEAVY_SHOT]                     = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.DETONATOR]                      = dsp.ws.chain[ele.FIRE_LIGHT],
    [dsp.ws.CORONACH]                       = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.TRUEFLIGHT]                     = dsp.ws.chain[ele.THUNDER_WIND],
    [dsp.ws.LEADEN_SALUTE]                  = dsp.ws.chain[ele.DARK_EARTH],
    [dsp.ws.NUMBING_SHOT]                   = dsp.ws.chain[ele.ICE],
    [dsp.ws.WILDFIRE]                       = dsp.ws.chain[ele.DARK_DARK],
    [dsp.ws.LAST_STAND]                     = dsp.ws.chain[ele.FIRE_LIGHT],

}
