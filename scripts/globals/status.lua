------------------------------------
--
-- STATUSES AND MODS
--
-- Contains variable-ized definitions of things like core enums for use in lua scripts.
------------------------------------
dsp = dsp or {}


------------------------------------
-- Zone Misc Flags
------------------------------------

dsp.zoneMisc =
{
    NONE       = 0x0000, -- Able to be used in any area
    ESCAPE     = 0x0001, -- Ability to use Escape Spell
    FELLOW     = 0x0002, -- Ability to summon Fellow NPC
    MOUNT      = 0x0004, -- Ability to use Chocobos and mounts
    MAZURKA    = 0x0008, -- Ability to use Mazurka Spell
    TRACTOR    = 0x0010, -- Ability to use Tractor Spell
    MOGMENU    = 0x0020, -- Ability to communicate with Nomad Moogle (menu access mog house)
    COSTUME    = 0x0040, -- Ability to use a Costumes
    PET        = 0x0080, -- Ability to summon Pets
    TREASURE   = 0x0100, -- Presence in the global zone TreasurePool
    YELL       = 0x0400  -- Send and receive /yell commands
}

------------------------------------
-- Job IDs
------------------------------------

dsp.jobs =
{
    NONE            =  0,
    WAR             =  1,
    MNK             =  2,
    WHM             =  3,
    BLM             =  4,
    RDM             =  5,
    THF             =  6,
    PLD             =  7,
    DRK             =  8,
    BST             =  9,
    BRD             = 10,
    RNG             = 11,
    SAM             = 12,
    NIN             = 13,
    DRG             = 14,
    SMN             = 15,
    BLU             = 16,
    COR             = 17,
    PUP             = 18,
    DNC             = 19,
    SCH             = 20,
    GEO             = 21,
    RUN             = 22,
}
dsp.MAX_JOB_TYPE = 23;


------------------------------------
-- STATUSES
------------------------------------

STATUS_NORMAL        = 0;
STATUS_UPDATE        = 1;
STATUS_DISAPPEAR     = 2;
STATUS_3             = 3;
STATUS_4             = 4;
STATUS_CUTSCENE_ONLY = 6;
STATUS_18            = 18;
STATUS_SHUTDOWN      = 20;

------------------------------------
-- These codes represent the subeffects for
-- additional effects animations from battleentity.h
------------------------------------

-- ATTACKS
SUBEFFECT_FIRE_DAMAGE       = 1;   -- 110000        3
SUBEFFECT_ICE_DAMAGE        = 2;   -- 1-01000       5
SUBEFFECT_WIND_DAMAGE       = 3;   -- 111000        7
SUBEFFECT_CHOKE             = 3;   -- Shares subeffect
SUBEFFECT_EARTH_DAMAGE      = 4;   -- 1-00100       9
SUBEFFECT_LIGHTNING_DAMAGE  = 5;   -- 110100       11
SUBEFFECT_WATER_DAMAGE      = 6;   -- 1-01100      13
SUBEFFECT_LIGHT_DAMAGE      = 7;   -- 111100       15
SUBEFFECT_DARKNESS_DAMAGE   = 8;   -- 1-00010      17
SUBEFFECT_DISPEL            = 8;   -- Verified with video of Lockheart Greatsword proc.
SUBEFFECT_SLEEP             = 9;   -- 110010       19
SUBEFFECT_POISON            = 10;  -- 1-01010      21
SUBEFFECT_PARALYSIS         = 11;
SUBEFFECT_AMNESIA           = 11;  -- Verified uses same animation as para
SUBEFFECT_BLIND             = 12;  -- 1-00110      25
SUBEFFECT_SILENCE           = 13;
SUBEFFECT_PETRIFY           = 14;
SUBEFFECT_PLAGUE            = 15;
SUBEFFECT_STUN              = 16;
SUBEFFECT_CURSE             = 17;
SUBEFFECT_DEFENSE_DOWN      = 18;  -- 1-01001      37
SUBEFFECT_EVASION_DOWN      = 18;  -- Same subeffect as DEFENSE_DOWN
SUBEFFECT_ATTACK_DOWN       = 18;  -- Same subeffect as DEFENSE_DOWN
SUBEFFECT_DEATH             = 19;
SUBEFFECT_SHIELD            = 20;
SUBEFFECT_HP_DRAIN          = 21;  -- 1-10101      43
SUBEFFECT_MP_DRAIN          = 22;  -- This is correct animation
SUBEFFECT_TP_DRAIN          = 22;  -- Verified this should look exactly like Aspir Samba.
SUBEFFECT_HASTE             = 23;
-- There are no additional attack effect animations beyond 23. Some effects share subeffect/animations.

-- SPIKES
SUBEFFECT_BLAZE_SPIKES      = 1;   -- 01-1000       6
SUBEFFECT_ICE_SPIKES        = 2;   -- 01-0100      10
SUBEFFECT_DREAD_SPIKES      = 3;   -- 01-1100      14
SUBEFFECT_CURSE_SPIKES      = 4;   -- 01-0010      18
SUBEFFECT_SHOCK_SPIKES      = 5;   -- 01-1010      22
SUBEFFECT_REPRISAL          = 6;   -- 01-0110      26
SUBEFFECT_GLINT_SPIKES      = 6;   --
SUBEFFECT_GALE_SPIKES       = 7;   -- Used by enchantment "Cool Breeze" http://www.ffxiah.com/item/22018/
SUBEFFECT_CLOD_SPIKES       = 8;   --
SUBEFFECT_DELUGE_SPIKES     = 9;   --
SUBEFFECT_DEATH_SPIKES      = 10;  -- yes really: http://www.ffxiah.com/item/26944/
SUBEFFECT_COUNTER           = 63;
-- There are no spikes effect animations beyond 63. Some effects share subeffect/animations.
-- "Damage Spikes" use the Blaze Spikes animation even though they are different status.

-- SKILLCHAINS
SUBEFFECT_NONE          = 0;
SUBEFFECT_LIGHT         = 1;
SUBEFFECT_DARKNESS      = 2;
SUBEFFECT_GRAVITATION   = 3;
SUBEFFECT_FRAGMENTATION = 4;
SUBEFFECT_DISTORTION    = 5;
SUBEFFECT_FUSION        = 6;
SUBEFFECT_COMPRESSION   = 7;
SUBEFFECT_LIQUEFACATION = 8;
SUBEFFECT_INDURATION    = 9;
SUBEFFECT_REVERBERATION = 10;
SUBEFFECT_TRANSFIXION   = 11;
SUBEFFECT_SCISSION      = 12;
SUBEFFECT_DETONATION    = 13;
SUBEFFECT_IMPACTION     = 14;

------------------------------------
-- These codes represent the actual status effects.
-- They are simply for convenience.
------------------------------------
dsp.effects =
{
    KO                       = 0,
    WEAKNESS                 = 1,
    SLEEP_I                  = 2,
    POISON                   = 3,
    PARALYSIS                = 4,
    BLINDNESS                = 5,
    SILENCE                  = 6,
    PETRIFICATION            = 7,
    DISEASE                  = 8,
    CURSE_I                  = 9,
    STUN                     = 10,
    BIND                     = 11,
    WEIGHT                   = 12,
    SLOW                     = 13,
    CHARM_I                  = 14,
    DOOM                     = 15,
    AMNESIA                  = 16,
    CHARM_II                 = 17,
    GRADUAL_PETRIFICATION    = 18,
    SLEEP_II                 = 19,
    CURSE_II                 = 20,
    ADDLE                    = 21,
    INTIMIDATE               = 22,
    KAUSTRA                  = 23,
    TERROR                   = 28,
    MUTE                     = 29,
    BANE                     = 30,
    PLAGUE                   = 31,
    FLEE                     = 32,
    HASTE                    = 33,
    BLAZE_SPIKES             = 34,
    ICE_SPIKES               = 35,
    BLINK                    = 36,
    STONESKIN                = 37,
    SHOCK_SPIKES             = 38,
    AQUAVEIL                 = 39,
    PROTECT                  = 40,
    SHELL                    = 41,
    REGEN                    = 42,
    REFRESH                  = 43,
    MIGHTY_STRIKES           = 44,
    BOOST                    = 45,
    HUNDRED_FISTS            = 46,
    MANAFONT                 = 47,
    CHAINSPELL               = 48,
    PERFECT_DODGE            = 49,
    INVINCIBLE               = 50,
    BLOOD_WEAPON             = 51,
    SOUL_VOICE               = 52,
    EAGLE_EYE_SHOT           = 53,
    MEIKYO_SHISUI            = 54,
    ASTRAL_FLOW              = 55,
    BERSERK                  = 56,
    DEFENDER                 = 57,
    AGGRESSOR                = 58,
    FOCUS                    = 59,
    DODGE                    = 60,
    COUNTERSTANCE            = 61,
    SENTINEL                 = 62,
    SOULEATER                = 63,
    LAST_RESORT              = 64,
    SNEAK_ATTACK             = 65,
    COPY_IMAGE               = 66,
    THIRD_EYE                = 67,
    WARCRY                   = 68,
    INVISIBLE                = 69,
    DEODORIZE                = 70,
    SNEAK                    = 71,
    SHARPSHOT                = 72,
    BARRAGE                  = 73,
    HOLY_CIRCLE              = 74,
    ARCANE_CIRCLE            = 75,
    HIDE                     = 76,
    CAMOUFLAGE               = 77,
    DIVINE_SEAL              = 78,
    ELEMENTAL_SEAL           = 79,
    STR_BOOST                = 80,
    DEX_BOOST                = 81,
    VIT_BOOST                = 82,
    AGI_BOOST                = 83,
    INT_BOOST                = 84,
    MND_BOOST                = 85,
    CHR_BOOST                = 86,
    TRICK_ATTACK             = 87,
    MAX_HP_BOOST             = 88,
    MAX_MP_BOOST             = 89,
    ACCURACY_BOOST           = 90,
    ATTACK_BOOST             = 91,
    EVASION_BOOST            = 92,
    DEFENSE_BOOST            = 93,
    ENFIRE                   = 94,
    ENBLIZZARD               = 95,
    ENAERO                   = 96,
    ENSTONE                  = 97,
    ENTHUNDER                = 98,
    ENWATER                  = 99,
    BARFIRE                  = 100,
    BARBLIZZARD              = 101,
    BARAERO                  = 102,
    BARSTONE                 = 103,
    BARTHUNDER               = 104,
    BARWATER                 = 105,
    BARSLEEP                 = 106,
    BARPOISON                = 107,
    BARPARALYZE              = 108,
    BARBLIND                 = 109,
    BARSILENCE               = 110,
    BARPETRIFY               = 111,
    BARVIRUS                 = 112,
    RERAISE                  = 113,
    COVER                    = 114,
    UNLIMITED_SHOT           = 115,
    PHALANX                  = 116,
    WARDING_CIRCLE           = 117,
    ANCIENT_CIRCLE           = 118,
    STR_BOOST_II             = 119,
    DEX_BOOST_II             = 120,
    VIT_BOOST_II             = 121,
    AGI_BOOST_II             = 122,
    INT_BOOST_II             = 123,
    MND_BOOST_II             = 124,
    CHR_BOOST_II             = 125,
    SPIRIT_SURGE             = 126,
    COSTUME                  = 127,
    BURN                     = 128,
    FROST                    = 129,
    CHOKE                    = 130,
    RASP                     = 131,
    SHOCK                    = 132,
    DROWN                    = 133,
    DIA                      = 134,
    BIO                      = 135,
    STR_DOWN                 = 136,
    DEX_DOWN                 = 137,
    VIT_DOWN                 = 138,
    AGI_DOWN                 = 139,
    INT_DOWN                 = 140,
    MND_DOWN                 = 141,
    CHR_DOWN                 = 142,
    LEVEL_RESTRICTION        = 143,
    MAX_HP_DOWN              = 144,
    MAX_MP_DOWN              = 145,
    ACCURACY_DOWN            = 146,
    ATTACK_DOWN              = 147,
    EVASION_DOWN             = 148,
    DEFENSE_DOWN             = 149,
    PHYSICAL_SHIELD          = 150,
    ARROW_SHIELD             = 151,
    MAGIC_SHIELD             = 152,
    DAMAGE_SPIKES            = 153,
    SHINING_RUBY             = 154,
    MEDICINE                 = 155,
    FLASH                    = 156,
    SJ_RESTRICTION           = 157,
    PROVOKE                  = 158,
    PENALTY                  = 159,
    PREPARATIONS             = 160,
    SPRINT                   = 161,
    ENCHANTMENT              = 162,
    AZURE_LORE               = 163,
    CHAIN_AFFINITY           = 164,
    BURST_AFFINITY           = 165,
    OVERDRIVE                = 166,
    MAGIC_DEF_DOWN           = 167,
    INHIBIT_TP               = 168,
    POTENCY                  = 169,
    REGAIN                   = 170,
    PAX                      = 171,
    INTENSION                = 172,
    DREAD_SPIKES             = 173,
    MAGIC_ACC_DOWN           = 174,
    MAGIC_ATK_DOWN           = 175,
    QUICKENING               = 176,
    ENCUMBRANCE_II           = 177,
    FIRESTORM                = 178,
    HAILSTORM                = 179,
    WINDSTORM                = 180,
    SANDSTORM                = 181,
    THUNDERSTORM             = 182,
    RAINSTORM                = 183,
    AURORASTORM              = 184,
    VOIDSTORM                = 185,
    HELIX                    = 186,
    SUBLIMATION_ACTIVATED    = 187,
    SUBLIMATION_COMPLETE     = 188,
    MAX_TP_DOWN              = 189,
    MAGIC_ATK_BOOST          = 190,
    MAGIC_DEF_BOOST          = 191,
    REQUIEM                  = 192,
    LULLABY                  = 193,
    ELEGY                    = 194,
    PAEON                    = 195,
    BALLAD                   = 196,
    MINNE                    = 197,
    MINUET                   = 198,
    MADRIGAL                 = 199,
    PRELUDE                  = 200,
    MAMBO                    = 201,
    AUBADE                   = 202,
    PASTORAL                 = 203,
    HUM                      = 204,
    FANTASIA                 = 205,
    OPERETTA                 = 206,
    CAPRICCIO                = 207,
    SERENADE                 = 208,
    ROUND                    = 209,
    GAVOTTE                  = 210,
    FUGUE                    = 211,
    RHAPSODY                 = 212,
    ARIA                     = 213,
    MARCH                    = 214,
    ETUDE                    = 215,
    CAROL                    = 216,
    THRENODY                 = 217,
    HYMNUS                   = 218,
    MAZURKA                  = 219,
    SIRVENTE                 = 220,
    DIRGE                    = 221,
    SCHERZO                  = 222,
    NOCTURNE                 = 223,
    STORE_TP                 = 227,
    EMBRAVA                  = 228,
    MANAWELL                 = 229,
    SPONTANEITY              = 230,
    MARCATO                  = 231,
    NA                       = 232,
    AUTO_REGEN               = 233,
    AUTO_REFRESH             = 234,
    FISHING_IMAGERY          = 235,
    WOODWORKING_IMAGERY      = 236,
    SMITHING_IMAGERY         = 237,
    GOLDSMITHING_IMAGERY     = 238,
    CLOTHCRAFT_IMAGERY       = 239,
    LEATHERCRAFT_IMAGERY     = 240,
    BONECRAFT_IMAGERY        = 241,
    ALCHEMY_IMAGERY          = 242,
    COOKING_IMAGERY          = 243,
    IMAGERY_1                = 244,
    IMAGERY_2                = 245,
    IMAGERY_3                = 246,
    IMAGERY_4                = 247,
    IMAGERY_5                = 248,
    DEDICATION               = 249,
    EF_BADGE                 = 250,
    FOOD                     = 251,
    MOUNTED                  = 252,
    SIGNET                   = 253,
    BATTLEFIELD              = 254,
    NONE                     = 255,
    SANCTION                 = 256,
    BESIEGED                 = 257,
    ILLUSION                 = 258,
    ENCUMBRANCE_I            = 259,
    OBLIVISCENCE             = 260,
    IMPAIRMENT               = 261,
    OMERTA                   = 262,
    DEBILITATION             = 263,
    PATHOS                   = 264,
    FLURRY                   = 265,
    CONCENTRATION            = 266,
    ALLIED_TAGS              = 267,
    SIGIL                    = 268,
    LEVEL_SYNC               = 269,
    AFTERMATH_LV1            = 270,
    AFTERMATH_LV2            = 271,
    AFTERMATH_LV3            = 272,
    AFTERMATH                = 273,
    ENLIGHT                  = 274,
    AUSPICE                  = 275,
    CONFRONTATION            = 276,
    ENFIRE_II                = 277,
    ENBLIZZARD_II            = 278,
    ENAERO_II                = 279,
    ENSTONE_II               = 280,
    ENTHUNDER_II             = 281,
    ENWATER_II               = 282,
    PERFECT_DEFENSE          = 283,
    EGG                      = 284,
    VISITANT                 = 285,
    BARAMNESIA               = 286,
    ATMA                     = 287,
    ENDARK                   = 288,
    ENMITY_BOOST             = 289,
    SUBTLE_BLOW_PLUS         = 290,
    ENMITY_DOWN              = 291,
    PENNANT                  = 292,
    NEGATE_PETRIFY           = 293,
    NEGATE_TERROR            = 294,
    NEGATE_AMNESIA           = 295,
    NEGATE_DOOM              = 296,
    NEGATE_POISON            = 297,
    CRIT_HIT_EVASION_DOWN    = 298,
    OVERLOAD                 = 299,
    FIRE_MANEUVER            = 300,
    ICE_MANEUVER             = 301,
    WIND_MANEUVER            = 302,
    EARTH_MANEUVER           = 303,
    THUNDER_MANEUVER         = 304,
    WATER_MANEUVER           = 305,
    LIGHT_MANEUVER           = 306,
    DARK_MANEUVER            = 307,
    DOUBLE_UP_CHANCE         = 308,
    BUST                     = 309,
    FIGHTERS_ROLL            = 310,
    MONKS_ROLL               = 311,
    HEALERS_ROLL             = 312,
    WIZARDS_ROLL             = 313,
    WARLOCKS_ROLL            = 314,
    ROGUES_ROLL              = 315,
    GALLANTS_ROLL            = 316,
    CHAOS_ROLL               = 317,
    BEAST_ROLL               = 318,
    CHORAL_ROLL              = 319,
    HUNTERS_ROLL             = 320,
    SAMURAI_ROLL             = 321,
    NINJA_ROLL               = 322,
    DRACHEN_ROLL             = 323,
    EVOKERS_ROLL             = 324,
    MAGUSS_ROLL              = 325,
    CORSAIRS_ROLL            = 326,
    PUPPET_ROLL              = 327,
    DANCERS_ROLL             = 328,
    SCHOLARS_ROLL            = 329,
    BOLTERS_ROLL             = 330,
    CASTERS_ROLL             = 331,
    COURSERS_ROLL            = 332,
    BLITZERS_ROLL            = 333,
    TACTICIANS_ROLL          = 334,
    ALLIES_ROLL              = 335,
    MISERS_ROLL              = 336,
    COMPANIONS_ROLL          = 337,
    AVENGERS_ROLL            = 338,
    NATURALISTS_ROLL         = 339,
    WARRIOR_S_CHARGE         = 340,
    FORMLESS_STRIKES         = 341,
    ASSASSINS_CHARGE         = 342,
    FEINT                    = 343,
    FEALTY                   = 344,
    DARK_SEAL                = 345,
    DIABOLIC_EYE             = 346,
    NIGHTINGALE              = 347,
    TROUBADOUR               = 348,
    KILLER_INSTINCT          = 349,
    STEALTH_SHOT             = 350,
    FLASHY_SHOT              = 351,
    SANGE                    = 352,
    HASSO                    = 353,
    SEIGAN                   = 354,
    CONVERGENCE              = 355,
    DIFFUSION                = 356,
    SNAKE_EYE                = 357,
    LIGHT_ARTS               = 358,
    DARK_ARTS                = 359,
    PENURY                   = 360,
    PARSIMONY                = 361,
    CELERITY                 = 362,
    ALACRITY                 = 363,
    RAPTURE                  = 364,
    EBULLIENCE               = 365,
    ACCESSION                = 366,
    MANIFESTATION            = 367,
    DRAIN_SAMBA              = 368,
    ASPIR_SAMBA              = 369,
    HASTE_SAMBA              = 370,
    VELOCITY_SHOT            = 371,
    BUILDING_FLOURISH        = 375,
    TRANCE                   = 376,
    TABULA_RASA              = 377,
    DRAIN_DAZE               = 378,
    ASPIR_DAZE               = 379,
    HASTE_DAZE               = 380,
    FINISHING_MOVE_1         = 381,
    FINISHING_MOVE_2         = 382,
    FINISHING_MOVE_3         = 383,
    FINISHING_MOVE_4         = 384,
    FINISHING_MOVE_5         = 385,
    LETHARGIC_DAZE_1         = 386,
    LETHARGIC_DAZE_2         = 387,
    LETHARGIC_DAZE_3         = 388,
    LETHARGIC_DAZE_4         = 389,
    LETHARGIC_DAZE_5         = 390,
    SLUGGISH_DAZE_1          = 391,
    SLUGGISH_DAZE_2          = 392,
    SLUGGISH_DAZE_3          = 393,
    SLUGGISH_DAZE_4          = 394,
    SLUGGISH_DAZE_5          = 395,
    WEAKENED_DAZE_1          = 396,
    WEAKENED_DAZE_2          = 397,
    WEAKENED_DAZE_3          = 398,
    WEAKENED_DAZE_4          = 399,
    WEAKENED_DAZE_5          = 400,
    ADDENDUM_WHITE           = 401,
    ADDENDUM_BLACK           = 402,
    REPRISAL                 = 403,
    MAGIC_EVASION_DOWN       = 404,
    RETALIATION              = 405,
    FOOTWORK                 = 406,
    KLIMAFORM                = 407,
    SEKKANOKI                = 408,
    PIANISSIMO               = 409,
    SABER_DANCE              = 410,
    FAN_DANCE                = 411,
    ALTRUISM                 = 412,
    FOCALIZATION             = 413,
    TRANQUILITY              = 414,
    EQUANIMITY               = 415,
    ENLIGHTENMENT            = 416,
    AFFLATUS_SOLACE          = 417,
    AFFLATUS_MISERY          = 418,
    COMPOSURE                = 419,
    YONIN                    = 420,
    INNIN                    = 421,
    CARBUNCLE_S_FAVOR        = 422,
    IFRIT_S_FAVOR            = 423,
    SHIVA_S_FAVOR            = 424,
    GARUDA_S_FAVOR           = 425,
    TITAN_S_FAVOR            = 426,
    RAMUH_S_FAVOR            = 427,
    LEVIATHAN_S_FAVOR        = 428,
    FENRIR_S_FAVOR           = 429,
    DIABOLOS_S_FAVOR         = 430,
    AVATAR_S_FAVOR           = 431,
    MULTI_STRIKES            = 432,
    DOUBLE_SHOT              = 433,
    TRANSCENDENCY            = 434,
    RESTRAINT                = 435,
    PERFECT_COUNTER          = 436,
    MANA_WALL                = 437,
    DIVINE_EMBLEM            = 438,
    NETHER_VOID              = 439,
    SENGIKORI                = 440,
    FUTAE                    = 441,
    PRESTO                   = 442,
    CLIMACTIC_FLOURISH       = 443,
    COPY_IMAGE_2             = 444,
    COPY_IMAGE_3             = 445,
    COPY_IMAGE_4             = 446,
    MULTI_SHOTS              = 447,
    BEWILDERED_DAZE_1        = 448,
    BEWILDERED_DAZE_2        = 449,
    BEWILDERED_DAZE_3        = 450,
    BEWILDERED_DAZE_4        = 451,
    BEWILDERED_DAZE_5        = 452,
    DIVINE_CARESS_I          = 453,
    SABOTEUR                 = 454,
    TENUTO                   = 455,
    SPUR                     = 456,
    EFFLUX                   = 457,
    EARTHEN_ARMOR            = 458,
    DIVINE_CARESS_II         = 459,
    BLOOD_RAGE               = 460,
    IMPETUS                  = 461,
    CONSPIRATOR              = 462,
    SEPULCHER                = 463,
    ARCANE_CREST             = 464,
    HAMANOHA                 = 465,
    DRAGON_BREAKER           = 466,
    TRIPLE_SHOT              = 467,
    STRIKING_FLOURISH        = 468,
    PERPETUANCE              = 469,
    IMMANENCE                = 470,
    MIGAWARI                 = 471,
    TERNARY_FLOURISH         = 472, -- DNC 93
    MUDDLE                   = 473, -- MOB EFFECT
    PROWESS                  = 474, -- GROUNDS OF VALOR
    VOIDWATCHER              = 475, -- VOIDWATCH
    ENSPHERE                 = 476, -- ATMACITE
    SACROSANCTITY            = 477, -- WHM 95
    PALISADE                 = 478, -- PLD 95
    SCARLET_DELIRIUM         = 479, -- DRK 95
    SCARLET_DELIRIUM_1       = 480, -- DRK 95
    -- NONE                      = 481, -- NONE
    DECOY_SHOT               = 482, -- RNG 95
    HAGAKURE                 = 483, -- SAM 95
    ISSEKIGAN                = 484, -- NIN 95
    UNBRIDLED_LEARNING       = 485, -- BLU 95
    COUNTER_BOOST            = 486, --
    ENDRAIN                  = 487, -- FENRIR 96
    ENASPIR                  = 488, -- FENRIR 96
    AFTERGLOW                = 489, -- WS AFTEREFFECT
    BRAZEN_STRENGTH          = 490, --
    INNER_STRENGTH           = 491,
    ASYLUM                   = 492,
    SUBTLE_SORCERY           = 493,
    STYMIE                   = 494,
    -- NONE                       = 495,
    INTERVENE                = 496,
    SOUL_ENSLAVEMENT         = 497,
    UNLEASH                  = 498,
    CLARION_CALL             = 499,
    OVERKILL                 = 500,
    YAEGASUMI                = 501,
    MIKAGE                   = 502,
    FLY_HIGH                 = 503,
    ASTRAL_CONDUIT           = 504,
    UNBRIDLED_WISDOM         = 505,
    -- NONE                      = 506,
    GRAND_PAS                = 507,
    WIDENED_COMPASS          = 508,
    ODYLLIC_SUBTERFUGE       = 509,
    ERGON_MIGHT              = 510,
    REIVE_MARK               = 511,
    IONIS                    = 512,
    BOLSTER                  = 513,
    -- NONE                      = 514,
    LASTING_EMANATION        = 515,
    ECLIPTIC_ATTRITION       = 516,
    COLLIMATED_FERVOR        = 517,
    DEMATERIALIZE            = 518,
    THEURGIC_FOCUS           = 519,
    -- NONE                      = 520,
    -- NONE                      = 521,
    ELEMENTAL_SFORZO         = 522,
    IGNIS                    = 523,
    GELUS                    = 524,
    FLABRA                   = 525,
    TELLUS                   = 526,
    SULPOR                   = 527,
    UNDA                     = 528,
    LUX                      = 529,
    TENEBRAE                 = 530,
    VALLATION                = 531,
    SWORDPLAY                = 532,
    PFLUG                    = 533,
    EMBOLDEN                 = 534,
    VALIANCE                 = 535,
    GAMBIT                   = 536,
    LIEMENT                  = 537,
    ONE_FOR_ALL              = 538,
    REGEN_II                 = 539,
    POISON_II                = 540,
    REFRESH_II               = 541,
    STR_BOOST_III            = 542,
    DEX_BOOST_III            = 543,
    VIT_BOOST_III            = 544,
    AGI_BOOST_III            = 545,
    INT_BOOST_III            = 546,
    MND_BOOST_III            = 547,
    CHR_BOOST_III            = 548,
    ATTACK_BOOST_II          = 549,
    DEFENSE_BOOST_II         = 550,
    MAGIC_ATK_BOOST_II       = 551,
    MAGIC_DEF_BOOST_II       = 552,
    ACCURACY_BOOST_II        = 553,
    EVASION_BOOST_II         = 554,
    MAGIC_ACC_BOOST_II       = 555,
    MAGIC_EVASION_BOOST      = 556,
    ATTACK_DOWN_II           = 557,
    DEFENSE_DOWN_II          = 558,
    MAGIC_ATK_DOWN_II        = 559,
    MAGIC_DEF_DOWN_II        = 560,
    ACCURACY_DOWN_II         = 561,
    EVASION_DOWN_II          = 562,
    MAGIC_ACC_DOWN_II        = 563,
    MAGIC_EVASION_DOWN_II    = 564,
    SLOW_II                  = 565,
    PARALYSIS_II             = 566,
    WEIGHT_II                = 567,
    FOIL                     = 568,
    BLAZE_OF_GLORY           = 569,
    BATTUTA                  = 570,
    RAYKE                    = 571,
    AVOIDANCE_DOWN           = 572,
    DELUGE_SPIKES            = 573,
    FAST_CAST                = 574,
    GESTATION                = 575,
    DOUBT                    = 576, -- Bully: Intimidation Enfeeble status
    CAIT_SITH_S_FAVOR        = 577,
    FISHY_INTUITION          = 578,
    COMMITMENT               = 579,
    HASTE_II                 = 580,
    FLURRY_II                = 581,
    APOGEE                   = 583,
    ENTRUST                  = 584,
    COSTUME_II               = 585,
    CURING_CONDUIT           = 586,
    TP_BONUS                 = 587,
    FINISHING_MOVE_6         = 588,
    FIRESTORM_II             = 589,
    HAILSTORM_II             = 590,
    WINDSTORM_II             = 591,
    SANDSTORM_II             = 592,
    THUNDERSTORM_II          = 593,
    RAINSTORM_II             = 594,
    AURORASTORM_II           = 595,
    VOIDSTORM_II             = 596,
    INUNDATION               = 597,
    CASCADE                  = 598,
    CONSUME_MANA             = 599,
    RUNEISTS_ROLL            = 600,
    CROOKED_CARDS            = 601,
    VORSEAL                  = 602,
    ELVORSEAL                = 603,
    MIGHTY_GUARD             = 604,
    GALE_SPIKES              = 605,
    CLOD_SPIKES              = 606,
    GLINT_SPIKES             = 607,
    NEGATE_VIRUS             = 608,
    NEGATE_CURSE             = 609,
    NEGATE_CHARM             = 610,
    MAGIC_EVASION_BOOST_II   = 611,
    -- Effect icons in packet can go from 0-767, so no custom effects should go in that range.

    -- Purchased from Cruor Prospector
    ABYSSEA_STR              = 768,
    ABYSSEA_DEX              = 769,
    ABYSSEA_VIT              = 770,
    ABYSSEA_AGI              = 771,
    ABYSSEA_INT              = 772,
    ABYSSEA_MND              = 773,
    ABYSSEA_CHR              = 774,
    ABYSSEA_HP               = 775,
    ABYSSEA_MP               = 776,

    -- *Prowess increases not currently retail accurate.
    -- GoV Prowess bonus effects, real effect at ID 474
    PROWESS_CASKET_RATE      = 777, -- (Unimplemented)
    PROWESS_SKILL_RATE       = 778, -- (Unimplemented)
    PROWESS_CRYSTAL_YEILD    = 779, -- (Unimplemented)
    PROWESS_TH               = 780, -- +1 per tier
    PROWESS_ATTACK_SPEED     = 781, -- *flat 4% for now
    PROWESS_HP_MP            = 782, -- Base 3% and another 1% per tier.
    PROWESS_ACC_RACC         = 783, -- *flat 4% for now
    PROWESS_ATT_RATT         = 784, -- *flat 4% for now
    PROWESS_MACC_MATK        = 785, -- *flat 4% for now
    PROWESS_CURE_POTENCY     = 786, -- *flat 4% for now
    PROWESS_WS_DMG           = 787, -- (Unimplemented) 2% per tier.
    PROWESS_KILLER           = 788, -- *flat +4 for now
    -- End GoV Prowess fakery
    FIELD_SUPPORT_FOOD       = 789, -- Used by Fov/GoV food buff.
    MARK_OF_SEED             = 790, -- Tracks 30 min timer in ACP mission "Those Who Lurk in Shadows (II)"
    ALL_MISS                 = 791,
    SUPER_BUFF               = 792,
    NINJUTSU_ELE_DEBUFF      = 793,
    HEALING                  = 794,
    LEAVEGAME                = 795,
    HASTE_SAMBA_HASTE        = 796,
    TELEPORT                 = 797,
    CHAINBOUND               = 798,
    SKILLCHAIN               = 799,
    DYNAMIS                  = 800,
    MEDITATE                 = 801 -- Dummy effect for SAM Meditate JA
    -- PLACEHOLDER              = 802, -- Description
    -- 802-1022
    -- PLACEHOLDER             = 1023 -- The client dat file seems to have only this many "slots", results of exceeding that are untested.
    }

----------------------------------
-- SC masks
----------------------------------

EFFECT_SKILLCHAIN0    = 0x200
EFFECT_SKILLCHAIN1    = 0x400
EFFECT_SKILLCHAIN2    = 0x800
EFFECT_SKILLCHAIN3    = 0x1000
EFFECT_SKILLCHAIN4    = 0x2000
EFFECT_SKILLCHAIN5    = 0x4000
EFFECT_SKILLCHAINMASK = 0x7C00

------------------------------------
-- Effect Flags
------------------------------------

EFFECTFLAG_NONE            = 0x0000
EFFECTFLAG_DISPELABLE      = 0x0001
EFFECTFLAG_ERASABLE        = 0x0002
EFFECTFLAG_ATTACK          = 0x0004
EFFECTFLAG_DAMAGE          = 0x0010
EFFECTFLAG_DEATH           = 0x0020
EFFECTFLAG_MAGIC_BEGIN     = 0x0040
EFFECTFLAG_MAGIC_END       = 0x0080
EFFECTFLAG_ON_ZONE         = 0x0100
EFFECTFLAG_NO_LOSS_MESSAGE = 0x0200
EFFECTFLAG_INVISIBLE       = 0x0400
EFFECTFLAG_DETECTABLE      = 0x0800
EFFECTFLAG_NO_REST         = 0x1000
EFFECTFLAG_PREVENT_ACTION  = 0x2000
EFFECTFLAG_WALTZABLE       = 0x4000
EFFECTFLAG_FOOD            = 0x8000
EFFECTFLAG_SONG            = 0x10000
EFFECTFLAG_ROLL            = 0x20000
EFFECTFLAG_SYNTH_SUPPORT   = 0x40000
EFFECTFLAG_CONFRONTATION   = 0x80000
EFFECTFLAG_LOGOUT          = 0x100000
EFFECTFLAG_BLOODPACT       = 0x200000
EFFECTFLAG_ON_JOBCHANGE    = 0x400000
EFFECTFLAG_NO_CANCEL       = 0x800000

------------------------------------

function removeSleepEffects(target)
    target:delStatusEffect(dsp.effects.SLEEP_I);
    target:delStatusEffect(dsp.effects.SLEEP_II);
    target:delStatusEffect(dsp.effects.LULLABY);
end;

function hasSleepEffects(target)
    if (target:hasStatusEffect(dsp.effects.SLEEP_I) or
        target:hasStatusEffect(dsp.effects.SLEEP_II) or
        target:hasStatusEffect(dsp.effects.LULLABY)) then
        return true;
    end
    return false;
end;

------------------------------------
-- These values are the codes that represent any statistic possible on an entity.
-- These are NOT the actual status effects such as weakness or silence,
-- but rather arbitrary codes chosen to represent different modifiers to the effected characters and mobs.
--
-- Even if the particular mod is not completely (or at all) implemented yet, you can still script the effects using these codes.
--
-- Example: target:getMod(MOD_STR) will get the sum of STR bonuses/penalties from gear, food, STR Etude, Absorb-STR, and any other STR-related buff/debuff.
-- Note that the above will ignore base statistics, and that getStat() should be used for stats, Attack, and Defense, while getACC(), getRACC(), and getEVA() also exist.
------------------------------------

MOD_NONE       = 0
MOD_DEF        = 1
MOD_HP         = 2
MOD_HPP        = 3
MOD_CONVMPTOHP = 4
MOD_MP         = 5
MOD_MPP        = 6
MOD_CONVHPTOMP = 7
MOD_STR        = 8
MOD_DEX        = 9
MOD_VIT        = 10
MOD_AGI        = 11
MOD_INT        = 12
MOD_MND        = 13
MOD_CHR        = 14
MOD_FIREDEF    = 15
MOD_ICEDEF     = 16
MOD_WINDDEF    = 17
MOD_EARTHDEF   = 18
MOD_THUNDERDEF = 19
MOD_WATERDEF   = 20
MOD_LIGHTDEF   = 21
MOD_DARKDEF    = 22
MOD_ATT        = 23
MOD_RATT       = 24
MOD_ACC        = 25
MOD_RACC       = 26
MOD_ENMITY     = 27
MOD_ENMITY_LOSS_REDUCTION = 502
MOD_MATT              = 28
MOD_MDEF              = 29
MOD_MACC              = 30
MOD_MEVA              = 31
MOD_FIREATT           = 32
MOD_ICEATT            = 33
MOD_WINDATT           = 34
MOD_EARTHATT          = 35
MOD_THUNDERATT        = 36
MOD_WATERATT          = 37
MOD_LIGHTATT          = 38
MOD_DARKATT           = 39
MOD_FIREACC           = 40
MOD_ICEACC            = 41
MOD_WINDACC           = 42
MOD_EARTHACC          = 43
MOD_THUNDERACC        = 44
MOD_WATERACC          = 45
MOD_LIGHTACC          = 46
MOD_DARKACC           = 47
MOD_WSACC             = 48
MOD_SLASHRES          = 49
MOD_PIERCERES         = 50
MOD_IMPACTRES         = 51
MOD_HTHRES            = 52
MOD_FIRERES           = 54
MOD_ICERES            = 55
MOD_WINDRES           = 56
MOD_EARTHRES          = 57
MOD_THUNDERRES        = 58
MOD_WATERRES          = 59
MOD_LIGHTRES          = 60
MOD_DARKRES           = 61
MOD_ATTP              = 62
MOD_DEFP              = 63
MOD_COMBAT_SKILLUP_RATE = 64 -- % increase in skillup combat rate
MOD_MAGIC_SKILLUP_RATE  = 65 -- % increase in skillup magic rate
MOD_RATTP             = 66
MOD_EVA               = 68
MOD_RDEF              = 69
MOD_REVA              = 70
MOD_MPHEAL            = 71
MOD_HPHEAL            = 72
MOD_STORETP           = 73
MOD_HTH               = 80
MOD_DAGGER            = 81
MOD_SWORD             = 82
MOD_GSWORD            = 83
MOD_AXE               = 84
MOD_GAXE              = 85
MOD_SCYTHE            = 86
MOD_POLEARM           = 87
MOD_KATANA            = 88
MOD_GKATANA           = 89
MOD_CLUB              = 90
MOD_STAFF             = 91
MOD_RAMPART_DURATION        = 92  -- Rampart duration in seconds
MOD_FLEE_DURATION           = 93  -- Flee duration in seconds
MOD_MEDITATE_DURATION       = 94  -- Meditate duration in seconds
MOD_WARDING_CIRCLE_DURATION = 95  -- Warding Circle duration in seconds
MOD_SOULEATER_EFFECT        = 96  -- Souleater power in percents
MOD_BOOST_EFFECT            = 97  -- Boost power in tenths
MOD_CAMOUFLAGE_DURATION     = 98  -- Camouflage duration in percents
MOD_AUTO_MELEE_SKILL  = 101
MOD_AUTO_RANGED_SKILL = 102
MOD_AUTO_MAGIC_SKILL  = 103
MOD_ARCHERY           = 104
MOD_MARKSMAN          = 105
MOD_THROW             = 106
MOD_GUARD             = 107
MOD_EVASION           = 108
MOD_SHIELD            = 109
MOD_PARRY             = 110
MOD_DIVINE            = 111
MOD_HEALING           = 112
MOD_ENHANCE           = 113
MOD_ENFEEBLE          = 114
MOD_ELEM              = 115
MOD_DARK              = 116
MOD_SUMMONING         = 117
MOD_NINJUTSU          = 118
MOD_SINGING           = 119
MOD_STRING            = 120
MOD_WIND              = 121
MOD_BLUE              = 122
MOD_FISH              = 127
MOD_WOOD              = 128
MOD_SMITH             = 129
MOD_GOLDSMITH         = 130
MOD_CLOTH             = 131
MOD_LEATHER           = 132
MOD_BONE              = 133
MOD_ALCHEMY           = 134
MOD_COOK              = 135
MOD_SYNERGY           = 136
MOD_RIDING            = 137
MOD_ANTIHQ_WOOD       = 144
MOD_ANTIHQ_SMITH      = 145
MOD_ANTIHQ_GOLDSMITH  = 146
MOD_ANTIHQ_CLOTH      = 147
MOD_ANTIHQ_LEATHER    = 148
MOD_ANTIHQ_BONE       = 149
MOD_ANTIHQ_ALCHEMY    = 150
MOD_ANTIHQ_COOK       = 151
MOD_DMG               = 160
MOD_DMGPHYS           = 161
MOD_DMGBREATH         = 162
MOD_DMGMAGIC          = 163
MOD_DMGMAGIC_II       = 831 -- Magic Damage Taken II % (Aegis)
MOD_DMGRANGE          = 164
MOD_UDMGPHYS          = 387
MOD_UDMGBREATH        = 388
MOD_UDMGMAGIC         = 389
MOD_UDMGRANGE         = 390
MOD_CRITHITRATE       = 165
MOD_CRIT_DMG_INCREASE = 421
MOD_ENEMYCRITRATE     = 166
MOD_MAGIC_CRITHITRATE = 562
MOD_MAGIC_CRIT_DMG_INCREASE = 563
MOD_HASTE_MAGIC       = 167
MOD_SPELLINTERRUPT    = 168
MOD_MOVE              = 169
MOD_FASTCAST          = 170
MOD_UFASTCAST         = 407
MOD_CURE_CAST_TIME    = 519
MOD_DELAY             = 171
MOD_RANGED_DELAY      = 172
MOD_MARTIAL_ARTS      = 173
MOD_SKILLCHAINBONUS   = 174
MOD_SKILLCHAINDMG     = 175
MOD_FOOD_HPP          = 176
MOD_FOOD_HP_CAP       = 177
MOD_FOOD_MPP          = 178
MOD_FOOD_MP_CAP       = 179
MOD_FOOD_ATTP         = 180
MOD_FOOD_ATT_CAP      = 181
MOD_FOOD_DEFP         = 182
MOD_FOOD_DEF_CAP      = 183
MOD_FOOD_ACCP         = 184
MOD_FOOD_ACC_CAP      = 185
MOD_FOOD_RATTP        = 186
MOD_FOOD_RATT_CAP     = 187
MOD_FOOD_RACCP        = 188
MOD_FOOD_RACC_CAP     = 189
MOD_FOOD_MACCP        =  99
MOD_FOOD_MACC_CAP     = 100
MOD_VERMIN_KILLER     = 224
MOD_BIRD_KILLER       = 225
MOD_AMORPH_KILLER     = 226
MOD_LIZARD_KILLER     = 227
MOD_AQUAN_KILLER      = 228
MOD_PLANTOID_KILLER   = 229
MOD_BEAST_KILLER      = 230
MOD_UNDEAD_KILLER     = 231
MOD_ARCANA_KILLER     = 232
MOD_DRAGON_KILLER     = 233
MOD_DEMON_KILLER      = 234
MOD_EMPTY_KILLER      = 235
MOD_HUMANOID_KILLER   = 236
MOD_LUMORIAN_KILLER   = 237
MOD_LUMINION_KILLER   = 238
MOD_SLEEPRES          = 240
MOD_POISONRES         = 241
MOD_PARALYZERES       = 242
MOD_BLINDRES          = 243
MOD_SILENCERES        = 244
MOD_VIRUSRES          = 245
MOD_PETRIFYRES        = 246
MOD_BINDRES           = 247
MOD_CURSERES          = 248
MOD_GRAVITYRES        = 249
MOD_SLOWRES           = 250
MOD_STUNRES           = 251
MOD_CHARMRES          = 252
MOD_AMNESIARES        = 253
MOD_LULLABYRES        = 254
MOD_DEATHRES           = 255
MOD_PARALYZE           = 257
MOD_MIJIN_GAKURE       = 258
MOD_DUAL_WIELD         = 259
MOD_DOUBLE_ATTACK      = 288
MOD_SUBTLE_BLOW        = 289
MOD_COUNTER            = 291
MOD_KICK_ATTACK        = 292
MOD_AFFLATUS_SOLACE    = 293
MOD_AFFLATUS_MISERY    = 294
MOD_CLEAR_MIND         = 295
MOD_CONSERVE_MP        = 296
MOD_STEAL              = 298
MOD_DESPOIL            = 896
MOD_PERFECT_DODGE      = 883 -- Increases Perfect Dodge duration in seconds
MOD_BLINK              = 299
MOD_STONESKIN          = 300
MOD_PHALANX            = 301
MOD_TRIPLE_ATTACK      = 302
MOD_TREASURE_HUNTER    = 303
MOD_TAME               = 304
MOD_RECYCLE            = 305
MOD_ZANSHIN            = 306
MOD_UTSUSEMI           = 307
MOD_UTSUSEMI_BONUS     = 900 -- Extra shadows from gear
MOD_NINJA_TOOL         = 308
MOD_BLUE_POINTS        = 309
MOD_DMG_REFLECT        = 316
MOD_ROLL_ROGUES        = 317
MOD_ROLL_GALLANTS      = 318
MOD_ROLL_CHAOS         = 319
MOD_ROLL_BEAST         = 320
MOD_ROLL_CHORAL        = 321
MOD_ROLL_HUNTERS       = 322
MOD_ROLL_SAMURAI       = 323
MOD_ROLL_NINJA         = 324
MOD_ROLL_DRACHEN       = 325
MOD_ROLL_EVOKERS       = 326
MOD_ROLL_MAGUS         = 327
MOD_ROLL_CORSAIRS      = 328
MOD_ROLL_PUPPET        = 329
MOD_ROLL_DANCERS       = 330
MOD_ROLL_SCHOLARS      = 331
-- Corsair Rolls Level 65+
MOD_ROLL_BOLTERS       = 869
MOD_ROLL_CASTERS       = 870
MOD_ROLL_COURSERS      = 871
MOD_ROLL_BLITZERS      = 872
MOD_ROLL_TACTICIANS    = 873
MOD_ROLL_ALLIES        = 874
MOD_ROLL_MISERS        = 875
MOD_ROLL_COMPANIONS    = 876
MOD_ROLL_AVENGERS      = 877
MOD_ROLL_NATURALISTS   = 878
MOD_ROLL_RUNEISTS      = 879
MOD_BUST               = 332
MOD_FINISHING_MOVES    = 333
MOD_SAMBA_DURATION     = 490 -- Samba duration bonus
MOD_WALTZ_POTENTCY     = 491 -- Waltz Potentcy Bonus
MOD_JIG_DURATION       = 492 -- Jig duration bonus in percents
MOD_VFLOURISH_MACC     = 493 -- Violent Flourish accuracy bonus
MOD_STEP_FINISH        = 494 -- Bonus finishing moves from steps
MOD_STEP_ACCURACY      = 403 -- Accuracy bonus for steps
MOD_WALTZ_DELAY        = 497 -- Waltz Ability Delay modifier (-1 mod is -1 second)
MOD_SAMBA_PDURATION    = 498 -- Samba percent duration bonus
MOD_WIDESCAN           = 340
MOD_BARRAGE_ACC        = 420 --
MOD_ENSPELL            = 341
MOD_SPIKES             = 342
MOD_ENSPELL_DMG        = 343
MOD_ENSPELL_CHANCE     = 856
MOD_SPIKES_DMG         = 344
MOD_TP_BONUS           = 345
MOD_PERPETUATION_REDUCTION = 346
MOD_FIRE_AFFINITY_DMG     = 347
MOD_EARTH_AFFINITY_DMG    = 348
MOD_WATER_AFFINITY_DMG    = 349
MOD_ICE_AFFINITY_DMG      = 350
MOD_THUNDER_AFFINITY_DMG  = 351
MOD_WIND_AFFINITY_DMG     = 352
MOD_LIGHT_AFFINITY_DMG    = 353
MOD_DARK_AFFINITY_DMG     = 354
MOD_FIRE_AFFINITY_ACC     = 544
MOD_EARTH_AFFINITY_ACC    = 545
MOD_WATER_AFFINITY_ACC    = 546
MOD_ICE_AFFINITY_ACC      = 547
MOD_THUNDER_AFFINITY_ACC  = 548
MOD_WIND_AFFINITY_ACC     = 549
MOD_LIGHT_AFFINITY_ACC    = 550
MOD_DARK_AFFINITY_ACC     = 551
MOD_FIRE_AFFINITY_PERP    = 553
MOD_EARTH_AFFINITY_PERP   = 554
MOD_WATER_AFFINITY_PERP   = 555
MOD_ICE_AFFINITY_PERP     = 556
MOD_THUNDER_AFFINITY_PERP = 557
MOD_WIND_AFFINITY_PERP    = 558
MOD_LIGHT_AFFINITY_PERP   = 559
MOD_DARK_AFFINITY_PERP    = 560
MOD_ADDS_WEAPONSKILL = 355
MOD_ADDS_WEAPONSKILL_DYN = 356
MOD_BP_DELAY       = 357
MOD_STEALTH        = 358
MOD_RAPID_SHOT     = 359
MOD_CHARM_TIME     = 360
MOD_JUMP_TP_BONUS  = 361
MOD_JUMP_ATT_BONUS = 362
MOD_HIGH_JUMP_ENMITY_REDUCTION = 363
MOD_REWARD_HP_BONUS = 364
MOD_SNAP_SHOT       = 365
MOD_MAIN_DMG_RATING = 366
MOD_SUB_DMG_RATING  = 367
MOD_REGAIN          = 368
MOD_REFRESH         = 369
MOD_REGEN           = 370
MOD_AVATAR_PERPETUATION = 371
MOD_WEATHER_REDUCTION   = 372
MOD_DAY_REDUCTION       = 373
MOD_CURE_POTENCY        = 374
MOD_CURE_POTENCY_RCVD   = 375
MOD_RANGED_DMG_RATING   = 376
MOD_DELAYP              = 380
MOD_RANGED_DELAYP       = 381
MOD_EXP_BONUS           = 382
MOD_HASTE_ABILITY       = 383
MOD_HASTE_GEAR          = 384
MOD_SHIELD_BASH         = 385
MOD_KICK_DMG            = 386
MOD_CHARM_CHANCE        = 391
MOD_WEAPON_BASH         = 392
MOD_BLACK_MAGIC_COST    = 393
MOD_WHITE_MAGIC_COST    = 394
MOD_BLACK_MAGIC_CAST    = 395
MOD_WHITE_MAGIC_CAST    = 396
MOD_BLACK_MAGIC_RECAST  = 397
MOD_WHITE_MAGIC_RECAST  = 398
MOD_ALACRITY_CELERITY_EFFECT = 399
MOD_LIGHT_ARTS_EFFECT   = 334
MOD_DARK_ARTS_EFFECT    = 335
MOD_LIGHT_ARTS_SKILL    = 336
MOD_DARK_ARTS_SKILL     = 337
MOD_LIGHT_ARTS_REGEN    = 338 -- Regen bonus HP from Light Arts and Tabula Rasa
MOD_REGEN_DURATION      = 339
MOD_HELIX_EFFECT        = 478
MOD_HELIX_DURATION      = 477
MOD_STORMSURGE_EFFECT   = 400
MOD_SUBLIMATION_BONUS   = 401
MOD_GRIMOIRE_SPELLCASTING = 489 -- "Grimoire: Reduces spellcasting time" bonus
MOD_WYVERN_BREATH         = 402
MOD_REGEN_DOWN            = 404 -- poison
MOD_REFRESH_DOWN          = 405 -- plague, reduce mp
MOD_REGAIN_DOWN           = 406 -- plague, reduce tp
MOD_MAGIC_DAMAGE          = 311 --  Magic damage added directly to the spell's base damage

-- Gear set modifiers
MOD_DA_DOUBLE_DAMAGE         = 408 -- Double attack's double damage chance %.
MOD_TA_TRIPLE_DAMAGE         = 409 -- Triple attack's triple damage chance %.
MOD_ZANSHIN_DOUBLE_DAMAGE    = 410 -- Zanshin's double damage chance %.
MOD_RAPID_SHOT_DOUBLE_DAMAGE = 479 -- Rapid shot's double damage chance %.
MOD_ABSORB_DMG_CHANCE        = 480 -- Chance to absorb damage %
MOD_EXTRA_DUAL_WIELD_ATTACK  = 481 -- Chance to land an extra attack when dual wielding
MOD_EXTRA_KICK_ATTACK        = 482 -- Occasionally allows a second Kick Attack during an attack round without the use of Footwork.
MOD_SAMBA_DOUBLE_DAMAGE      = 415 -- Double damage chance when samba is up.
MOD_NULL_PHYSICAL_DAMAGE     = 416 -- Occasionally annuls damage from physical attacks, in percents
MOD_QUICK_DRAW_TRIPLE_DAMAGE = 417 -- Chance to do triple damage with quick draw.
MOD_BAR_ELEMENT_NULL_CHANCE  = 418 -- Bar Elemental spells will occasionally nullify damage of the same element.
MOD_GRIMOIRE_INSTANT_CAST    = 419 -- Spells that match your current Arts will occasionally cast instantly, without recast.
MOD_COUNTERSTANCE_EFFECT     = 543 -- Counterstance effect in percents
MOD_DODGE_EFFECT             = 552 -- Dodge effect in percents
MOD_FOCUS_EFFECT             = 561 -- Focus effect in percents
MOD_MUG_EFFECT               = 835 -- Mug effect as multiplier
MOD_ACC_COLLAB_EFFECT        = 884 -- Increases amount of enmity transferred
MOD_HIDE_DURATION            = 885 -- Hide duration increase (percentage based
MOD_GILFINDER                = 897 -- Gil % increase
MOD_REVERSE_FLOURISH_EFFECT  = 836 -- Reverse Flourish effect in tenths of squared term multiplier
MOD_SENTINEL_EFFECT          = 837 -- Sentinel effect in percents
MOD_REGEN_MULTIPLIER         = 838 -- Regen base multiplier

MOD_DOUBLE_SHOT_RATE          = 422 -- The rate that double shot can proc
MOD_VELOCITY_SNAPSHOT_BONUS   = 423 -- Increases Snapshot whilst Velocity Shot is up.
MOD_VELOCITY_RATT_BONUS       = 424 -- Increases Ranged Attack whilst Velocity Shot is up.
MOD_SHADOW_BIND_EXT           = 425 -- Extends the time of shadowbind
MOD_ABSORB_PHYSDMG_TO_MP      = 426 -- Absorbs a percentage of physical damage taken to MP.
MOD_ENMITY_REDUCTION_PHYSICAL = 427 -- Reduces Enmity decrease when taking physical damage
MOD_SHIELD_MASTERY_TP         = 485 -- Shield mastery TP bonus when blocking with a shield
MOD_PERFECT_COUNTER_ATT       = 428 -- Raises weapon damage by 20 when countering while under the Perfect Counter effects. This also affects Weapon Rank (though not if fighting barehanded).
MOD_FOOTWORK_ATT_BONUS        = 429 -- Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024)

MOD_MINNE_EFFECT        = 433 --
MOD_MINUET_EFFECT       = 434 --
MOD_PAEON_EFFECT        = 435 --
MOD_REQUIEM_EFFECT      = 436 --
MOD_THRENODY_EFFECT     = 437 --
MOD_MADRIGAL_EFFECT     = 438 --
MOD_MAMBO_EFFECT        = 439 --
MOD_LULLABY_EFFECT      = 440 --
MOD_ETUDE_EFFECT        = 441 --
MOD_BALLAD_EFFECT       = 442 --
MOD_MARCH_EFFECT        = 443 --
MOD_FINALE_EFFECT       = 444 --
MOD_CAROL_EFFECT        = 445 --
MOD_MAZURKA_EFFECT      = 446 --
MOD_ELEGY_EFFECT        = 447 --
MOD_PRELUDE_EFFECT      = 448 --
MOD_HYMNUS_EFFECT       = 449 --
MOD_VIRELAI_EFFECT      = 450 --
MOD_SCHERZO_EFFECT      = 451 --
MOD_ALL_SONGS_EFFECT    = 452 --
MOD_MAXIMUM_SONGS_BONUS = 453 --
MOD_SONG_DURATION_BONUS = 454 --

MOD_QUICK_DRAW_DMG            = 411 --
MOD_QUAD_ATTACK               = 430 -- Quadruple attack chance.

MOD_ADDITIONAL_EFFECT         = 431 -- All additional effects
MOD_ENSPELL_DMG_BONUS         = 432

MOD_FIRE_ABSORB  = 459 -- Occasionally absorbs fire elemental damage, in percents
MOD_EARTH_ABSORB = 460 -- Occasionally absorbs earth elemental damage, in percents
MOD_WATER_ABSORB = 461 -- Occasionally absorbs water elemental damage, in percents
MOD_WIND_ABSORB  = 462 -- Occasionally absorbs wind elemental damage, in percents
MOD_ICE_ABSORB   = 463 -- Occasionally absorbs ice elemental damage, in percents
MOD_LTNG_ABSORB  = 464 -- Occasionally absorbs thunder elemental damage, in percents
MOD_LIGHT_ABSORB = 465 -- Occasionally absorbs light elemental damage, in percents
MOD_DARK_ABSORB  = 466 -- Occasionally absorbs dark elemental damage, in percents

MOD_FIRE_NULL  = 467 --
MOD_EARTH_NULL = 468 --
MOD_WATER_NULL = 469 --
MOD_WIND_NULL  = 470 --
MOD_ICE_NULL   = 471 --
MOD_LTNG_NULL  = 472 --
MOD_LIGHT_NULL = 473 --
MOD_DARK_NULL  = 474 --

MOD_MAGIC_ABSORB     = 475 -- Occasionally absorbs magic damage taken, in percents
MOD_MAGIC_NULL       = 476 -- Occasionally annuls magic damage taken, in percents
MOD_PHYS_ABSORB      = 512 -- Occasionally absorbs physical damage taken, in percents
MOD_ABSORB_DMG_TO_MP = 516 -- Unlike PLD gear mod, works on all damage types (Ethereal Earring)

MOD_WARCRY_DURATION = 483 -- Warcy duration bonus from gear
MOD_AUSPICE_EFFECT  = 484 -- Auspice Subtle Blow Bonus
MOD_TACTICAL_PARRY  = 486 -- Tactical Parry TP Bonus
MOD_MAG_BURST_BONUS = 487 -- Magic Burst Bonus
MOD_INHIBIT_TP      = 488 -- Inhibits TP Gain (percent)

MOD_GOV_CLEARS      = 496 -- Tracks GoV page completion (for 4% bonus on rewards).

-- Reraise (Auto Reraise, will be used by ATMA)
MOD_RERAISE_I       = 456 -- Reraise.
MOD_RERAISE_II      = 457 -- Reraise II.
MOD_RERAISE_III     = 458 -- Reraise III.

MOD_ITEM_SPIKES_TYPE   = 499 -- Type spikes an item has
MOD_ITEM_SPIKES_DMG    = 500 -- Damage of an items spikes
MOD_ITEM_SPIKES_CHANCE = 501 -- Chance of an items spike proc

MOD_FERAL_HOWL_DURATION = 503 -- +20% duration per merit when wearing augmented Monster Jackcoat +2
MOD_MANEUVER_BONUS      = 504 -- Maneuver Stat Bonus
MOD_OVERLOAD_THRESH     = 505 -- Overload Threshold Bonus
MOD_BURDEN_DECAY        = 847 -- Increases amount of burden removed per tick
MOD_REPAIR_EFFECT       = 853 -- Removes # of status effects from the Automaton
MOD_REPAIR_POTENCY      = 854 -- Note: Only affects amount regenerated by a %, not the instant restore!
MOD_PREVENT_OVERLOAD    = 855 -- Overloading erases a water maneuver (except on water overloads) instead, if there is one
MOD_EXTRA_DMG_CHANCE    = 506 -- Proc rate of MOD_OCC_DO_EXTRA_DMG. 111 would be 11.1%
MOD_OCC_DO_EXTRA_DMG    = 507 -- Multiplier for "Occasionally do x times normal damage". 250 would be 2.5 times damage.

MOD_REM_OCC_DO_DOUBLE_DMG   = 863 -- Proc rate for REM Aftermaths that apply "Occasionally do double damage"
MOD_REM_OCC_DO_TRIPLE_DMG   = 864 -- Proc rate for REM Aftermaths that apply "Occasionally do triple damage"

MOD_REM_OCC_DO_DOUBLE_DMG_RANGED = 867 -- Ranged attack specific
MOD_REM_OCC_DO_TRIPLE_DMG_RANGED = 868 -- Ranged attack specific

MOD_MYTHIC_OCC_ATT_TWICE    = 865 -- Proc rate for "Occasionally attacks twice"
MOD_MYTHIC_OCC_ATT_THRICE   = 866 -- Proc rate for "Occasionally attacks thrice"

MOD_EAT_RAW_FISH         = 412 --
MOD_EAT_RAW_MEAT         = 413 --

MOD_ENHANCES_CURSNA_RCVD = 67  -- Potency of "Cursna" effects received
MOD_ENHANCES_CURSNA      = 310 -- Raises success rate of Cursna when removing effect (like Doom) that are not 100% chance to remove
MOD_ENHANCES_HOLYWATER   = 495 -- Used by gear with the "Enhances Holy Water" or "Holy Water+" attribute

MOD_RETALIATION          = 414 -- Increases damage of Retaliation hits
MOD_THIRD_EYE_COUNTER_RATE    = 508 -- Adds counter to 3rd eye anticipates & if using Seigan counter rate is increased by 15%
MOD_THIRD_EYE_ANTICIPATE_RATE = 839 -- Adds anticipate rate in percents

MOD_CLAMMING_IMPROVED_RESULTS  = 509 --
MOD_CLAMMING_REDUCED_INCIDENTS = 510 --
MOD_CHOCOBO_RIDING_TIME = 511 -- Increases chocobo riding time
MOD_HARVESTING_RESULT   = 513 -- Improves harvesting results
MOD_LOGGING_RESULT      = 514 -- Improves logging results
MOD_MINING_RESULT       = 515 -- Improves mining results
MOD_EGGHELM             = 517 -- Egg Helm (Chocobo Digging)

MOD_SHIELDBLOCKRATE           = 518 -- Affects shield block rate, percent based
MOD_SCAVENGE_EFFECT           = 312 --
MOD_DIA_DOT                   = 313 -- Increases the DoT damage of Dia
MOD_SHARPSHOT                 = 314 -- Sharpshot accuracy bonus
MOD_ENH_DRAIN_ASPIR           = 315 -- % damage boost to Drain and Aspir
MOD_SNEAK_ATK_DEX             = 874 -- % DEX boost to Sneak Attack (if gear mod, needs to be equipped on hit)
MOD_TRICK_ATK_AGI             = 520 -- % AGI boost to Trick Attack (if gear mod, needs to be equipped on hit)
MOD_NIN_NUKE_BONUS            = 522 -- magic attack bonus for NIN nukes
MOD_AMMO_SWING                = 523 -- Extra swing rate w/ ammo (ie. Jailer weapons). Use gearsets, and does nothing for non-players.
MOD_AMMO_SWING_TYPE           = 826 -- For the handedness of the weapon - 1h (1) vs. 2h/h2h (2). h2h can safely use the same function as 2h.
MOD_ROLL_RANGE                = 528 -- Additional range for COR roll abilities.
MOD_PHANTOM_ROLL              = 881 -- Phantom Roll+ Effect from SOA Rings.
MOD_PHANTOM_DURATION          = 882 -- Phantom Roll Duration +.

MOD_ENHANCES_REFRESH          = 529 -- "Enhances Refresh" adds +1 per modifier to spell's tick result.
MOD_NO_SPELL_MP_DEPLETION     = 530 -- % to not deplete MP on spellcast.
MOD_FORCE_FIRE_DWBONUS        = 531 -- Set to 1 to force fire day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_EARTH_DWBONUS       = 532 -- Set to 1 to force earth day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_WATER_DWBONUS       = 533 -- Set to 1 to force water day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_WIND_DWBONUS        = 534 -- Set to 1 to force wind day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_ICE_DWBONUS         = 535 -- Set to 1 to force ice day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_LIGHTNING_DWBONUS   = 536 -- Set to 1 to force lightning day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_LIGHT_DWBONUS       = 537 -- Set to 1 to force light day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_FORCE_DARK_DWBONUS        = 538 -- Set to 1 to force dark day/weather spell bonus/penalty. Do not have it total more than 1.
MOD_STONESKIN_BONUS_HP        = 539 -- Bonus "HP" granted to Stoneskin spell.
MOD_ENHANCES_ELEMENTAL_SIPHON = 540 -- Bonus Base MP added to Elemental Siphon skill.
MOD_BP_DELAY_II               = 541 -- Blood Pact Delay Reduction II
MOD_JOB_BONUS_CHANCE          = 542 -- Chance to apply job bonus to COR roll without having the job in the party.
MOD_DAY_NUKE_BONUS            = 565 -- Bonus damage from "Elemental magic affected by day" (Sorc. Tonban)
MOD_IRIDESCENCE               = 566 -- Iridescence trait (additional weather damage/penalty)
MOD_BARSPELL_AMOUNT           = 567 -- Additional elemental resistance granted by bar- spells
MOD_BARSPELL_MDEF_BONUS       = 827 -- Extra magic defense bonus granted to the bar- spell effect
MOD_RAPTURE_AMOUNT            = 568 -- Bonus amount added to Rapture effect
MOD_EBULLIENCE_AMOUNT         = 569 -- Bonus amount added to Ebullience effect
MOD_WYVERN_EFFECTIVE_BREATH   = 829 -- Increases the threshold for triggering healing breath
MOD_AQUAVEIL_COUNT            = 832 -- Modifies the amount of hits that Aquaveil absorbs before being removed
MOD_SONG_RECAST_DELAY         = 833 -- Reduces song recast time in seconds.
MOD_ENH_MAGIC_DURATION        = 890 -- Enhancing Magic Duration increase %
MOD_ENHANCES_COURSERS_ROLL    = 891 -- Courser's Roll Bonus % chance
MOD_ENHANCES_CASTERS_ROLL     = 892 -- Caster's Roll Bonus % chance
MOD_ENHANCES_BLITZERS_ROLL    = 893 -- Blitzer's Roll Bonus % chance
MOD_ENHANCES_ALLIES_ROLL      = 894 -- Allies' Roll Bonus % chance
MOD_ENHANCES_TACTICIANS_ROLL  = 895 -- Tactician's Roll Bonus % chance

-- Automaton mods
MOD_AUTO_DECISION_DELAY    = 842 -- Reduces the Automaton's global decision delay
MOD_AUTO_SHIELD_BASH_DELAY = 843 -- Reduces the Automaton's global shield bash delay
MOD_AUTO_MAGIC_DELAY       = 844 -- Reduces the Automaton's global magic delay
MOD_AUTO_HEALING_DELAY     = 845 -- Reduces the Automaton's global healing delay
MOD_AUTO_HEALING_THRESHOLD = 846 -- Increases the healing trigger threshold
MOD_AUTO_SHIELD_BASH_SLOW  = 848 -- Adds a slow effect to Shield Bash
MOD_AUTO_TP_EFFICIENCY     = 849 -- Causes the Automaton to wait to form a skillchain when its master is > 90% TP
MOD_AUTO_SCAN_RESISTS      = 850 -- Causes the Automaton to scan a target's resistances

-- Mythic Weapon Mods
MOD_AUGMENTS_ABSORB           = 521 -- Direct Absorb spell increase while Liberator is equipped (percentage based)
MOD_AOE_NA                    = 524 -- Set to 1 to make -na spells/erase always AoE w/ Divine Veil
MOD_AUGMENTS_CONVERT          = 525 -- Convert HP to MP Ratio Multiplier. Value = MP multiplier rate.
MOD_AUGMENTS_SA               = 526 -- Adds Critical Attack Bonus to Sneak Attack, percentage based.
MOD_AUGMENTS_TA               = 527 -- Adds Critical Attack Bonus to Trick Attack, percentage based.
MOD_AUGMENTS_FEINT            = 873 -- Feint will give another -10 Evasion per merit level
MOD_AUGMENTS_ASSASSINS_CHARGE = 886 -- Gives Assassin's Charge +1% Critical Hit Rate per merit level
MOD_AUGMENTS_AMBUSH           = 887 -- Gives +1% Triple Attack per merit level when Ambush conditions are met
MOD_AUGMENTS_AURA_STEAL       = 889 -- 20% chance of 2 effects to be dispelled or stolen per merit level
MOD_JUG_LEVEL_RANGE           = 564 -- Decreases the level range of spawned jug pets. Maxes out at 2.
MOD_FORCE_JUMP_CRIT           = 828 -- Critical hit rate bonus for jump and high jump
MOD_QUICK_DRAW_DMG_PERCENT    = 834 -- Percentage increase to QD damage

-- Crafting food effects
MOD_SYNTH_SUCCESS    = 851 -- Rate of synthesis success
MOD_SYNTH_SKILL_GAIN = 852 -- Synthesis skill gain rate
MOD_SYNTH_FAIL_RATE  = 861 -- Synthesis failure rate (percent)
MOD_SYNTH_HQ_RATE    = 862 -- High-quality success rate (not a percent)

MOD_WEAPONSKILL_DAMAGE_BASE = 570 -- Specific to 1 Weaponskill: See modifier.h for how this is used
MOD_ALL_WSDMG_ALL_HITS      = 840 -- Generic (all Weaponskills) damage, on all hits.
-- Per https://www.bg-wiki.com/bg/Weapon_Skill_Damage we need all 3..
MOD_ALL_WSDMG_FIRST_HIT     = 841 -- Generic (all Weaponskills) damage, first hit only.

-- Circle Abilities Extended Duration from AF/AF+1
MOD_HOLY_CIRCLE_DURATION    = 857
MOD_ARCANE_CIRCLE_DURATION  = 858
MOD_ANCIENT_CIRCLE_DURATION = 859

-- Other
MOD_CURE2MP_PERCENT         = 860 -- Converts % of "Cure" amount to MP
MOD_SAVETP                  = 880 -- SAVETP Effect for Miser's Roll / ATMA / Hagakure.

MOD_SMITE                   = 898 -- Att increase with H2H or 2H weapons
MOD_TACTICAL_GUARD          = 899 -- Tp gain increase when guarding


-- The spares take care of finding the next ID to use so long as we don't forget to list IDs that have been freed up by refactoring.
-- 570 - 825 used by WS DMG mods these are not spares.
-- SPARE = 900 -- stuff
-- SPARE = 901 -- stuff
-- SPARE = 902 -- stuff

------------------------------------
-- Merit Definitions
------------------------------------

MCATEGORY_HP_MP      = 0x0040
MCATEGORY_ATTRIBUTES = 0x0080
MCATEGORY_COMBAT     = 0x00C0
MCATEGORY_MAGIC      = 0x0100
MCATEGORY_OTHERS     = 0x0140

MCATEGORY_WAR_1 = 0x0180
MCATEGORY_MNK_1 = 0x01C0
MCATEGORY_WHM_1 = 0x0200
MCATEGORY_BLM_1 = 0x0240
MCATEGORY_RDM_1 = 0x0280
MCATEGORY_THF_1 = 0x02C0
MCATEGORY_PLD_1 = 0x0300
MCATEGORY_DRK_1 = 0x0340
MCATEGORY_BST_1 = 0x0380
MCATEGORY_BRD_1 = 0x03C0
MCATEGORY_RNG_1 = 0x0400
MCATEGORY_SAM_1 = 0x0440
MCATEGORY_NIN_1 = 0x0480
MCATEGORY_DRG_1 = 0x04C0
MCATEGORY_SMN_1 = 0x0500
MCATEGORY_BLU_1 = 0x0540
MCATEGORY_COR_1 = 0x0580
MCATEGORY_PUP_1 = 0x05C0
MCATEGORY_DNC_1 = 0x0600
MCATEGORY_SCH_1 = 0x0640

MCATEGORY_WS = 0x0680

MCATEGORY_UNK_0 = 0x06C0
MCATEGORY_UNK_1 = 0x0700
MCATEGORY_UNK_2 = 0x0740
MCATEGORY_UNK_3 = 0x0780
MCATEGORY_UNK_4 = 0x07C0

MCATEGORY_WAR_2 = 0x0800
MCATEGORY_MNK_2 = 0x0840
MCATEGORY_WHM_2 = 0x0880
MCATEGORY_BLM_2 = 0x08C0
MCATEGORY_RDM_2 = 0x0900
MCATEGORY_THF_2 = 0x0940
MCATEGORY_PLD_2 = 0x0980
MCATEGORY_DRK_2 = 0x09C0
MCATEGORY_BST_2 = 0x0A00
MCATEGORY_BRD_2 = 0x0A40
MCATEGORY_RNG_2 = 0x0A80
MCATEGORY_SAM_2 = 0x0AC0
MCATEGORY_NIN_2 = 0x0B00
MCATEGORY_DRG_2 = 0x0B40
MCATEGORY_SMN_2 = 0x0B80
MCATEGORY_BLU_2 = 0x0BC0
MCATEGORY_COR_2 = 0x0C00
MCATEGORY_PUP_2 = 0x0C40
MCATEGORY_DNC_2 = 0x0C80
MCATEGORY_SCH_2 = 0x0CC0

MCATEGORY_START = 0x0040
MCATEGORY_COUNT = 0x0D00

-- HP
MERIT_MAX_HP = MCATEGORY_HP_MP + 0x00
MERIT_MAX_MP = MCATEGORY_HP_MP + 0x02

-- ATTRIBUTES
MERIT_STR = MCATEGORY_ATTRIBUTES + 0x00
MERIT_DEX = MCATEGORY_ATTRIBUTES + 0x02
MERIT_VIT = MCATEGORY_ATTRIBUTES + 0x04
MERIT_AGI = MCATEGORY_ATTRIBUTES + 0x08
MERIT_INT = MCATEGORY_ATTRIBUTES + 0x0A
MERIT_MND = MCATEGORY_ATTRIBUTES + 0x0C
MERIT_CHR = MCATEGORY_ATTRIBUTES + 0x0E

-- COMBAT SKILLS
MERIT_H2H          = MCATEGORY_COMBAT + 0x00
MERIT_DAGGER       = MCATEGORY_COMBAT + 0x02
MERIT_SWORD        = MCATEGORY_COMBAT + 0x04
MERIT_GSWORD       = MCATEGORY_COMBAT + 0x06
MERIT_AXE          = MCATEGORY_COMBAT + 0x08
MERIT_GAXE         = MCATEGORY_COMBAT + 0x0A
MERIT_SCYTHE       = MCATEGORY_COMBAT + 0x0C
MERIT_POLEARM      = MCATEGORY_COMBAT + 0x0E
MERIT_KATANA       = MCATEGORY_COMBAT + 0x10
MERIT_GKATANA      = MCATEGORY_COMBAT + 0x12
MERIT_CLUB         = MCATEGORY_COMBAT + 0x14
MERIT_STAFF        = MCATEGORY_COMBAT + 0x16
MERIT_ARCHERY      = MCATEGORY_COMBAT + 0x18
MERIT_MARKSMANSHIP = MCATEGORY_COMBAT + 0x1A
MERIT_THROWING     = MCATEGORY_COMBAT + 0x1C
MERIT_GUARDING     = MCATEGORY_COMBAT + 0x1E
MERIT_EVASION      = MCATEGORY_COMBAT + 0x20
MERIT_SHIELD       = MCATEGORY_COMBAT + 0x22
MERIT_PARRYING     = MCATEGORY_COMBAT + 0x24

-- MAGIC SKILLS
MERIT_DIVINE     = MCATEGORY_MAGIC + 0x00
MERIT_HEALING    = MCATEGORY_MAGIC + 0x02
MERIT_ENHANCING  = MCATEGORY_MAGIC + 0x04
MERIT_ENFEEBLING = MCATEGORY_MAGIC + 0x06
MERIT_ELEMENTAL  = MCATEGORY_MAGIC + 0x08
MERIT_DARK       = MCATEGORY_MAGIC + 0x0A
MERIT_SUMMONING  = MCATEGORY_MAGIC + 0x0C
MERIT_NINJITSU   = MCATEGORY_MAGIC + 0x0E
MERIT_SINGING    = MCATEGORY_MAGIC + 0x10
MERIT_STRING     = MCATEGORY_MAGIC + 0x12
MERIT_WIND       = MCATEGORY_MAGIC + 0x14
MERIT_BLUE       = MCATEGORY_MAGIC + 0x16

-- OTHERS
MERIT_ENMITY_INCREASE        = MCATEGORY_OTHERS + 0x00
MERIT_ENMITY_DECREASE        = MCATEGORY_OTHERS + 0x02
MERIT_CRIT_HIT_RATE          = MCATEGORY_OTHERS + 0x04
MERIT_ENEMY_CRIT_RATE        = MCATEGORY_OTHERS + 0x06
MERIT_SPELL_INTERUPTION_RATE = MCATEGORY_OTHERS + 0x08

-- WAR 1
MERIT_BERSERK_RECAST     = MCATEGORY_WAR_1 + 0x00
MERIT_DEFENDER_RECAST    = MCATEGORY_WAR_1 + 0x02
MERIT_WARCRY_RECAST      = MCATEGORY_WAR_1 + 0x04
MERIT_AGGRESSOR_RECAST   = MCATEGORY_WAR_1 + 0x06
MERIT_DOUBLE_ATTACK_RATE = MCATEGORY_WAR_1 + 0x08

-- MNK 1
MERIT_FOCUS_RECAST     = MCATEGORY_MNK_1 + 0x00
MERIT_DODGE_RECAST     = MCATEGORY_MNK_1 + 0x02
MERIT_CHAKRA_RECAST    = MCATEGORY_MNK_1 + 0x04
MERIT_COUNTER_RATE     = MCATEGORY_MNK_1 + 0x06
MERIT_KICK_ATTACK_RATE = MCATEGORY_MNK_1 + 0x08

-- WHM 1
MERIT_DIVINE_SEAL_RECAST = MCATEGORY_WHM_1 + 0x00
MERIT_CURE_CAST_TIME     = MCATEGORY_WHM_1 + 0x02
MERIT_BAR_SPELL_EFFECT   = MCATEGORY_WHM_1 + 0x04
MERIT_BANISH_EFFECT      = MCATEGORY_WHM_1 + 0x06
MERIT_REGEN_EFFECT       = MCATEGORY_WHM_1 + 0x08

-- BLM 1
MERIT_ELEMENTAL_SEAL_RECAST   = MCATEGORY_BLM_1 + 0x00
MERIT_FIRE_MAGIC_POTENCY      = MCATEGORY_BLM_1 + 0x02
MERIT_ICE_MAGIC_POTENCY       = MCATEGORY_BLM_1 + 0x04
MERIT_WIND_MAGIC_POTENCY      = MCATEGORY_BLM_1 + 0x06
MERIT_EARTH_MAGIC_POTENCY     = MCATEGORY_BLM_1 + 0x08
MERIT_LIGHTNING_MAGIC_POTENCY = MCATEGORY_BLM_1 + 0x0A
MERIT_WATER_MAGIC_POTENCY     = MCATEGORY_BLM_1 + 0x0C

-- RDM 1
MERIT_CONVERT_RECAST           = MCATEGORY_RDM_1 + 0x00
MERIT_FIRE_MAGIC_ACCURACY      = MCATEGORY_RDM_1 + 0x02
MERIT_ICE_MAGIC_ACCURACY       = MCATEGORY_RDM_1 + 0x04
MERIT_WIND_MAGIC_ACCURACY      = MCATEGORY_RDM_1 + 0x06
MERIT_EARTH_MAGIC_ACCURACY     = MCATEGORY_RDM_1 + 0x08
MERIT_LIGHTNING_MAGIC_ACCURACY = MCATEGORY_RDM_1 + 0x0A
MERIT_WATER_MAGIC_ACCURACY     = MCATEGORY_RDM_1 + 0x0C

-- THF 1
MERIT_FLEE_RECAST         = MCATEGORY_THF_1 + 0x00
MERIT_HIDE_RECAST         = MCATEGORY_THF_1 + 0x02
MERIT_SNEAK_ATTACK_RECAST = MCATEGORY_THF_1 + 0x04
MERIT_TRICK_ATTACK_RECAST = MCATEGORY_THF_1 + 0x06
MERIT_TRIPLE_ATTACK_RATE  = MCATEGORY_THF_1 + 0x08

-- PLD 1
MERIT_SHIELD_BASH_RECAST  = MCATEGORY_PLD_1 + 0x00
MERIT_HOLY_CIRCLE_RECAST  = MCATEGORY_PLD_1 + 0x02
MERIT_SENTINEL_RECAST     = MCATEGORY_PLD_1 + 0x04
MERIT_COVER_EFFECT_LENGTH = MCATEGORY_PLD_1 + 0x06
MERIT_RAMPART_RECAST      = MCATEGORY_PLD_1 + 0x08

-- DRK 1
MERIT_SOULEATER_RECAST     = MCATEGORY_DRK_1 + 0x00
MERIT_ARCANE_CIRCLE_RECAST = MCATEGORY_DRK_1 + 0x02
MERIT_LAST_RESORT_RECAST   = MCATEGORY_DRK_1 + 0x04
MERIT_LAST_RESORT_EFFECT   = MCATEGORY_DRK_1 + 0x06
MERIT_WEAPON_BASH_EFFECT   = MCATEGORY_DRK_1 + 0x08

-- BST 1
MERIT_KILLER_EFFECTS    = MCATEGORY_BST_1 + 0x00
MERIT_REWARD_RECAST     = MCATEGORY_BST_1 + 0x02
MERIT_CALL_BEAST_RECAST = MCATEGORY_BST_1 + 0x04
MERIT_SIC_RECAST        = MCATEGORY_BST_1 + 0x06
MERIT_TAME_RECAST       = MCATEGORY_BST_1 + 0x08

-- BRD 1
MERIT_LULLABY_RECAST  = MCATEGORY_BRD_1 + 0x00
MERIT_FINALE_RECAST   = MCATEGORY_BRD_1 + 0x02
MERIT_MINNE_EFFECT    = MCATEGORY_BRD_1 + 0x04
MERIT_MINUET_EFFECT   = MCATEGORY_BRD_1 + 0x06
MERIT_MADRIGAL_EFFECT = MCATEGORY_BRD_1 + 0x08

-- RNG 1
MERIT_SCAVENGE_EFFECT       = MCATEGORY_RNG_1 + 0x00
MERIT_CAMOUFLAGE_RECAST     = MCATEGORY_RNG_1 + 0x02
MERIT_SHARPSHOT_RECAST      = MCATEGORY_RNG_1 + 0x04
MERIT_UNLIMITED_SHOT_RECAST = MCATEGORY_RNG_1 + 0x06
MERIT_RAPID_SHOT_RATE       = MCATEGORY_RNG_1 + 0x08

-- SAM 1
MERIT_THIRD_EYE_RECAST      = MCATEGORY_SAM_1 + 0x00
MERIT_WARDING_CIRCLE_RECAST = MCATEGORY_SAM_1 + 0x02
MERIT_STORE_TP_EFFECT       = MCATEGORY_SAM_1 + 0x04
MERIT_MEDITATE_RECAST       = MCATEGORY_SAM_1 + 0x06
MERIT_ZASHIN_ATTACK_RATE    = MCATEGORY_SAM_1 + 0x08

-- NIN 1
MERIT_SUBTLE_BLOW_EFFECT = MCATEGORY_NIN_1 + 0x00
MERIT_KATON_EFFECT       = MCATEGORY_NIN_1 + 0x02
MERIT_HYOTON_EFFECT      = MCATEGORY_NIN_1 + 0x04
MERIT_HUTON_EFFECT       = MCATEGORY_NIN_1 + 0x06
MERIT_DOTON_EFFECT       = MCATEGORY_NIN_1 + 0x08
MERIT_RAITON_EFFECT      = MCATEGORY_NIN_1 + 0x0A
MERIT_SUITON_EFFECT      = MCATEGORY_NIN_1 + 0x0C

-- DRG 1
MERIT_ANCIENT_CIRCLE_RECAST = MCATEGORY_DRG_1 + 0x00
MERIT_JUMP_RECAST           = MCATEGORY_DRG_1 + 0x02
MERIT_HIGH_JUMP_RECAST      = MCATEGORY_DRG_1 + 0x04
MERIT_SUPER_JUMP_RECAST     = MCATEGORY_DRG_1 + 0x05
MERIT_SPIRIT_LINK_RECAST    = MCATEGORY_DRG_1 + 0x08

-- SMN 1
MERIT_AVATAR_PHYSICAL_ACCURACY  = MCATEGORY_SMN_1 + 0x00
MERIT_AVATAR_PHYSICAL_ATTACK    = MCATEGORY_SMN_1 + 0x02
MERIT_AVATAR_MAGICAL_ACCURACY   = MCATEGORY_SMN_1 + 0x04
MERIT_AVATAR_MAGICAL_ATTACK     = MCATEGORY_SMN_1 + 0x06
MERIT_SUMMONING_MAGIC_CAST_TIME = MCATEGORY_SMN_1 + 0x08

-- BLU 1
MERIT_CHAIN_AFFINITY_RECAST = MCATEGORY_BLU_1 + 0x00
MERIT_BURST_AFFINITY_RECAST = MCATEGORY_BLU_1 + 0x02
MERIT_MONSTER_CORRELATION   = MCATEGORY_BLU_1 + 0x04
MERIT_PHYSICAL_POTENCY      = MCATEGORY_BLU_1 + 0x06
MERIT_MAGICAL_ACCURACY      = MCATEGORY_BLU_1 + 0x08

-- COR 1
MERIT_PHANTOM_ROLL_RECAST = MCATEGORY_COR_1 + 0x00
MERIT_QUICK_DRAW_RECAST   = MCATEGORY_COR_1 + 0x02
MERIT_QUICK_DRAW_ACCURACY = MCATEGORY_COR_1 + 0x04
MERIT_RANDOM_DEAL_RECAST  = MCATEGORY_COR_1 + 0x06
MERIT_BUST_DURATION       = MCATEGORY_COR_1 + 0x08

-- PUP 1
MERIT_AUTOMATON_SKILLS        = MCATEGORY_PUP_1 + 0x00
MERIT_MAINTENACE_RECAST       = MCATEGORY_PUP_1 + 0x02
MERIT_REPAIR_EFFECT           = MCATEGORY_PUP_1 + 0x04
MERIT_ACTIVATE_RECAST         = MCATEGORY_PUP_1 + 0x06
MERIT_REPAIR_RECAST           = MCATEGORY_PUP_1 + 0x08

-- DNC 1
MERIT_STEP_ACCURACY            = MCATEGORY_DNC_1 + 0x00
MERIT_HASTE_SAMBA_EFFECT       = MCATEGORY_DNC_1 + 0x02
MERIT_REVERSE_FLOURISH_EFFECT  = MCATEGORY_DNC_1 + 0x04
MERIT_BUILDING_FLOURISH_EFFECT = MCATEGORY_DNC_1 + 0x06

-- SCH 1
MERIT_GRIMOIRE_RECAST        = MCATEGORY_SCH_1 + 0x00
MERIT_MODUS_VERITAS_DURATION = MCATEGORY_SCH_1 + 0x02
MERIT_HELIX_MAGIC_ACC_ATT    = MCATEGORY_SCH_1 + 0x04
MERIT_MAX_SUBLIMATION        = MCATEGORY_SCH_1 + 0x06

-- WEAPON SKILLS
MERIT_SHIJIN_SPIRAL = MCATEGORY_WS + 0x00
MERIT_EXENTERATOR   = MCATEGORY_WS + 0x02
MERIT_REQUIESCAT    = MCATEGORY_WS + 0x04
MERIT_RESOLUTION    = MCATEGORY_WS + 0x06
MERIT_RUINATOR      = MCATEGORY_WS + 0x08
MERIT_UPHEAVAL      = MCATEGORY_WS + 0x0A
MERIT_ENTROPY       = MCATEGORY_WS + 0x0C
MERIT_STARDIVER     = MCATEGORY_WS + 0x0E
MERIT_BLADE_SHUN    = MCATEGORY_WS + 0x10
MERIT_TACHI_SHOHA   = MCATEGORY_WS + 0x12
MERIT_REALMRAZER    = MCATEGORY_WS + 0x14
MERIT_SHATTERSOUL   = MCATEGORY_WS + 0x16
MERIT_APEX_ARROW    = MCATEGORY_WS + 0x18
MERIT_LAST_STAND    = MCATEGORY_WS + 0x1A

-- unknown
-- MERIT_UNKNOWN1 = MCATEGORY_UNK_0 + 0x00
-- MERIT_UNKNOWN2 = MCATEGORY_UNK_1 + 0x00
-- MERIT_UNKNOWN3 = MCATEGORY_UNK_2 + 0x00
-- MERIT_UNKNOWN4 = MCATEGORY_UNK_3 + 0x00
-- MERIT_UNKNOWN5 = MCATEGORY_UNK_4 + 0x00

-- WAR 2
MERIT_WARRIORS_CHARGE = MCATEGORY_WAR_2 + 0x00
MERIT_TOMAHAWK        = MCATEGORY_WAR_2 + 0x02
MERIT_SAVAGERY        = MCATEGORY_WAR_2 + 0x04
MERIT_AGGRESSIVE_AIM  = MCATEGORY_WAR_2 + 0x06

-- MNK 2
MERIT_MANTRA           = MCATEGORY_MNK_2 + 0x00
MERIT_FORMLESS_STRIKES = MCATEGORY_MNK_2 + 0x02
MERIT_INVIGORATE       = MCATEGORY_MNK_2 + 0x04
MERIT_PENANCE          = MCATEGORY_MNK_2 + 0x06

-- WHM 2
MERIT_MARTYR      = MCATEGORY_WHM_2 + 0x00
MERIT_DEVOTION    = MCATEGORY_WHM_2 + 0x02
MERIT_PROTECTRA_V = MCATEGORY_WHM_2 + 0x04
MERIT_SHELLRA_V   = MCATEGORY_WHM_2 + 0x06

-- BLM 2
MERIT_FLARE_II   = MCATEGORY_BLM_2 + 0x00
MERIT_FREEZE_II  = MCATEGORY_BLM_2 + 0x02
MERIT_TORNADO_II = MCATEGORY_BLM_2 + 0x04
MERIT_QUAKE_II   = MCATEGORY_BLM_2 + 0x06
MERIT_BURST_II   = MCATEGORY_BLM_2 + 0x08
MERIT_FLOOD_II   = MCATEGORY_BLM_2 + 0x0A

-- RDM 2
MERIT_DIA_III     = MCATEGORY_RDM_2 + 0x00
MERIT_SLOW_II     = MCATEGORY_RDM_2 + 0x02
MERIT_PARALYZE_II = MCATEGORY_RDM_2 + 0x04
MERIT_PHALANX_II  = MCATEGORY_RDM_2 + 0x06
MERIT_BIO_III     = MCATEGORY_RDM_2 + 0x08
MERIT_BLIND_II    = MCATEGORY_RDM_2 + 0x0A

-- THF 2
MERIT_ASSASSINS_CHARGE = MCATEGORY_THF_2 + 0x00
MERIT_FEINT            = MCATEGORY_THF_2 + 0x02
MERIT_AURA_STEAL       = MCATEGORY_THF_2 + 0x04
MERIT_AMBUSH           = MCATEGORY_THF_2 + 0x06

-- PLD 2
MERIT_FEALTY    = MCATEGORY_PLD_2 + 0x00
MERIT_CHIVALRY  = MCATEGORY_PLD_2 + 0x02
MERIT_IRON_WILL = MCATEGORY_PLD_2 + 0x04
MERIT_GUARDIAN  = MCATEGORY_PLD_2 + 0x06

-- DRK 2
MERIT_DARK_SEAL       = MCATEGORY_DRK_2 + 0x00
MERIT_DIABOLIC_EYE    = MCATEGORY_DRK_2 + 0x02
MERIT_MUTED_SOUL      = MCATEGORY_DRK_2 + 0x04
MERIT_DESPERATE_BLOWS = MCATEGORY_DRK_2 + 0x06

-- BST 2
MERIT_FERAL_HOWL      = MCATEGORY_BST_2 + 0x00
MERIT_KILLER_INSTINCT = MCATEGORY_BST_2 + 0x02
MERIT_BEAST_AFFINITY  = MCATEGORY_BST_2 + 0x04
MERIT_BEAST_HEALER    = MCATEGORY_BST_2 + 0x06

-- BRD 2
MERIT_NIGHTINGALE       = MCATEGORY_BRD_2 + 0x00
MERIT_TROUBADOUR        = MCATEGORY_BRD_2 + 0x02
MERIT_FOE_SIRVENTE      = MCATEGORY_BRD_2 + 0x04
MERIT_ADVENTURERS_DIRGE = MCATEGORY_BRD_2 + 0x06

-- RNG 2
MERIT_STEALTH_SHOT = MCATEGORY_RNG_2 + 0x00
MERIT_FLASHY_SHOT  = MCATEGORY_RNG_2 + 0x02
MERIT_SNAPSHOT     = MCATEGORY_RNG_2 + 0x04
MERIT_RECYCLE      = MCATEGORY_RNG_2 + 0x06

-- SAM 2
MERIT_SHIKIKOYO  = MCATEGORY_SAM_2 + 0x00
MERIT_BLADE_BASH = MCATEGORY_SAM_2 + 0x02
MERIT_IKISHOTEN  = MCATEGORY_SAM_2 + 0x04
MERIT_OVERWHELM  = MCATEGORY_SAM_2 + 0x06

-- NIN 2
MERIT_SANGE                = MCATEGORY_NIN_2 + 0x00
MERIT_NINJA_TOOL_EXPERTISE = MCATEGORY_NIN_2 + 0x02
MERIT_KATON_SAN            = MCATEGORY_NIN_2 + 0x04
MERIT_HYOTON_SAN           = MCATEGORY_NIN_2 + 0x06
MERIT_HUTON_SAN            = MCATEGORY_NIN_2 + 0x08
MERIT_DOTON_SAN            = MCATEGORY_NIN_2 + 0x0A
MERIT_RAITON_SAN           = MCATEGORY_NIN_2 + 0x0C
MERIT_SUITON_SAN           = MCATEGORY_NIN_2 + 0x0E

-- DRG 2
MERIT_DEEP_BREATHING = MCATEGORY_DRG_2 + 0x00
MERIT_ANGON          = MCATEGORY_DRG_2 + 0x02
MERIT_EMPATHY        = MCATEGORY_DRG_2 + 0x04
MERIT_STRAFE         = MCATEGORY_DRG_2 + 0x06

-- SMN 2
MERIT_METEOR_STRIKE   = MCATEGORY_SMN_2 + 0x00
MERIT_HEAVENLY_STRIKE = MCATEGORY_SMN_2 + 0x02
MERIT_WIND_BLADE      = MCATEGORY_SMN_2 + 0x04
MERIT_GEOCRUSH        = MCATEGORY_SMN_2 + 0x06
MERIT_THUNDERSTORM    = MCATEGORY_SMN_2 + 0x08
MERIT_GRANDFALL       = MCATEGORY_SMN_2 + 0x0A

-- BLU 2
MERIT_CONVERGENCE  = MCATEGORY_BLU_2 + 0x00
MERIT_DIFFUSION    = MCATEGORY_BLU_2 + 0x02
MERIT_ENCHAINMENT  = MCATEGORY_BLU_2 + 0x04
MERIT_ASSIMILATION = MCATEGORY_BLU_2 + 0x06

-- COR 2
MERIT_SNAKE_EYE      = MCATEGORY_COR_2 + 0x00
MERIT_FOLD           = MCATEGORY_COR_2 + 0x02
MERIT_WINNING_STREAK = MCATEGORY_COR_2 + 0x04
MERIT_LOADED_DECK    = MCATEGORY_COR_2 + 0x06

-- PUP 2
MERIT_ROLE_REVERSAL = MCATEGORY_PUP_2 + 0x00
MERIT_VENTRILOQUY   = MCATEGORY_PUP_2 + 0x02
MERIT_FINE_TUNING   = MCATEGORY_PUP_2 + 0x04
MERIT_OPTIMIZATION  = MCATEGORY_PUP_2 + 0x06

-- DNC 2
MERIT_SABER_DANCE     = MCATEGORY_DNC_2 + 0x00
MERIT_FAN_DANCE       = MCATEGORY_DNC_2 + 0x02
MERIT_NO_FOOT_RISE    = MCATEGORY_DNC_2 + 0x04
MERIT_CLOSED_POSITION = MCATEGORY_DNC_2 + 0x06

-- SCH 2
MERIT_ALTRUISM      = MCATEGORY_SCH_2 + 0x00
MERIT_FOCALIZATION  = MCATEGORY_SCH_2 + 0x02
MERIT_TRANQUILITY   = MCATEGORY_SCH_2 + 0x04
MERIT_EQUANIMITY    = MCATEGORY_SCH_2 + 0x06
MERIT_ENLIGHTENMENT = MCATEGORY_SCH_2 + 0x08
MERIT_STORMSURGE    = MCATEGORY_SCH_2 + 0x0A


------------------------------------
-- Slot Definitions
------------------------------------

SLOT_MAIN   = 0
SLOT_SUB    = 1
SLOT_RANGED = 2
SLOT_AMMO   = 3
SLOT_HEAD   = 4
SLOT_BODY   = 5
SLOT_HANDS  = 6
SLOT_LEGS   = 7
SLOT_FEET   = 8
SLOT_NECK   = 9
SLOT_WAIST  = 10
SLOT_EAR1   = 11
SLOT_EAR2   = 12
SLOT_RING1  = 13
SLOT_RING2  = 14
SLOT_BACK   = 15

MAX_SLOTID  = 15

----------------------------------
-- Objtype Definitions
----------------------------------

TYPE_PC   = 0x01
TYPE_NPC  = 0x02
TYPE_MOB  = 0x04
TYPE_PET  = 0x08
TYPE_SHIP = 0x10

----------------------------------
-- DropType
----------------------------------

DROP_NORMAL  = 0x00
DROP_GROUPED = 0x01
DROP_STEAL   = 0x02
DROP_DESPOIL = 0x04

----------------------------------
-- Allegiance Definitions
----------------------------------

ALLEGIANCE_MOB       = 0
ALLEGIANCE_PLAYER    = 1
ALLEGIANCE_SAN_DORIA = 2
ALLEGIANCE_BASTOK    = 3
ALLEGIANCE_WINDURST  = 4

------------------------------------
-- Inventory enum
------------------------------------

LOC_INVENTORY       = 0
LOC_MOGSAFE         = 1
LOC_STORAGE         = 2
LOC_TEMPITEMS       = 3
LOC_MOGLOCKER       = 4
LOC_MOGSATCHEL      = 5
LOC_MOGSACK         = 6
LOC_MOGCASE         = 7
LOC_WARDROBE        = 8
LOC_MOGSAFE2        = 9
LOC_WARDROBE2       = 10
LOC_WARDROBE3       = 11
LOC_WARDROBE4       = 12

------------------------------------
-- Spell Groups
------------------------------------

SPELLGROUP_NONE      = 0
SPELLGROUP_SONG      = 1
SPELLGROUP_BLACK     = 2
SPELLGROUP_BLUE      = 3
SPELLGROUP_NINJUTSU  = 4
SPELLGROUP_SUMMONING = 5
SPELLGROUP_WHITE     = 6

------------------------------------
-- MOBMODs
------------------------------------
MOBMOD_NONE           = 0
MOBMOD_GIL_MIN        = 1
MOBMOD_GIL_MAX        = 2
MOBMOD_MP_BASE        = 3
MOBMOD_SIGHT_RANGE    = 4
MOBMOD_SOUND_RANGE    = 5
MOBMOD_BUFF_CHANCE    = 6
MOBMOD_GA_CHANCE      = 7
MOBMOD_HEAL_CHANCE    = 8
MOBMOD_HP_HEAL_CHANCE = 9
MOBMOD_SUBLINK        = 10
MOBMOD_LINK_RADIUS    = 11
MOBMOD_DRAW_IN        = 12
MOBMOD_RAGE           = 13
MOBMOD_SKILL_LIST     = 14
MOBMOD_MUG_GIL        = 15
MOBMOD_MAIN_2HOUR     = 16
MOBMOD_NO_DESPAWN     = 17
MOBMOD_VAR            = 18
MOBMOD_SUB_2HOUR      = 19
MOBMOD_TP_USE_CHANCE  = 20
MOBMOD_PET_SPELL_LIST = 21
MOBMOD_NA_CHANCE      = 22
MOBMOD_IMMUNITY       = 23
MOBMOD_GRADUAL_RAGE   = 24
MOBMOD_BUILD_RESIST   = 25
MOBMOD_SUPERLINK      = 26
MOBMOD_SPELL_LIST     = 27
MOBMOD_EXP_BONUS      = 28
MOBMOD_ASSIST         = 29
MOBMOD_SPECIAL_SKILL  = 30
MOBMOD_ROAM_DISTANCE  = 31
MOBMOD_2HOUR_MULTI    = 32
MOBMOD_SPECIAL_COOL   = 33
MOBMOD_MAGIC_COOL     = 34
MOBMOD_STANDBACK_COOL = 35
MOBMOD_ROAM_COOL      = 36
MOBMOD_ALWAYS_AGGRO   = 37
MOBMOD_NO_DROPS       = 38
MOBMOD_SHARE_POS      = 39
MOBMOD_TELEPORT_CD    = 40
MOBMOD_TELEPORT_START = 41
MOBMOD_TELEPORT_END   = 42
MOBMOD_TELEPORT_TYPE  = 43
MOBMOD_DUAL_WIELD     = 44
MOBMOD_ADD_EFFECT     = 45
MOBMOD_AUTO_SPIKES    = 46
MOBMOD_SPAWN_LEASH    = 47
MOBMOD_SHARE_TARGET   = 48
MOBMOD_SCRIPTED_2HOUR = 49
MOBMOD_2HOUR_PROC     = 50
MOBMOD_ROAM_TURNS     = 51
MOBMOD_ROAM_RATE      = 52
MOBMOD_BEHAVIOR       = 53
MOBMOD_GIL_BONUS      = 54
MOBMOD_IDLE_DESPAWN   = 55
MOBMOD_HP_STANDBACK   = 56
MOBMOD_MAGIC_DELAY    = 57
MOBMOD_SPECIAL_DELAY  = 58
MOBMOD_WEAPON_BONUS   = 59
MOBMOD_SPAWN_ANIMATIONSUB = 60
MOBMOD_HP_SCALE       = 61
MOBMOD_NO_STANDBACK   = 62
MOBMOD_ATTACK_SKILL_LIST = 63
MOBMOD_CHARMABLE      = 64
MOBMOD_NO_MOVE        = 65
MOBMOD_MULTI_HIT      = 66

------------------------------------
-- Job Specials (1hr / 2hr moves)
------------------------------------

jobSpec =
{
    MIGHTY_STRIKES      = 688,
    MIGHTY_STRIKES_MAAT = 1008,
    -- MIGHTY_STRIKES      = 2242,
    -- MIGHTY_STRIKES      = 2939,
    BENEDICTION         = 689,
    BENEDICTION_MAAT    = 1010,
    BENEDICTION_PRISHE  = 1486,
    -- BENEDICTION         = 2244,
    -- BENEDICTION         = 2777,
    -- BENEDICTION         = 2943,
    -- HUNDRED_FISTS       = 303,
    HUNDRED_FISTS        = 690,
    HUNDRED_FISTS_MAAT   = 1009,
    HUNDRED_FISTS_PRISHE = 1485,
    -- HUNDRED_FISTS       = 2020,
    -- HUNDRED_FISTS       = 2243,
    MANAFONT             = 691 ,
    MANAFONT_MAAT        = 1011,
    -- MANAFONT            = 2245,
    -- MANAFONT            = 2944,
    CHAINSPELL           = 692,
    CHAINSPELL_MAAT      = 1012,
    -- CHAINSPELL          = 2246,
    -- CHAINSPELL          = 2942,
    PERFECT_DODGE        = 693,
    PERFECT_DODGE_MAAT   = 1013,
    -- PERFECT_DODGE       = 2247,
    INVINCIBLE           = 694,
    INVINCIBLE_MAAT      = 1014,
    -- INVINCIBLE          = 2248,
    -- INVINCIBLE          = 2379,
    -- INVINCIBLE          = 2940,
    BLOOD_WEAPON         = 695,
    BLOOD_WEAPON_MAAT    = 1015,
    -- BLOOD_WEAPON        = 2249,
    SOUL_VOICE           = 696,
    SOUL_VOICE_MAAT      = 1018,
    -- SOUL_VOICE          = 2251,
    MEIKYO_SHISUI        = 730,
    MEIKYO_SHISUI_MAAT   = 1020,
    -- MEIKYO_SHISUI        = 2253,
    -- MEIKYO_SHISUI        = 3175,
    MIJIN_GAKURE         = 731,
    MIJIN_GAKURE_MAAT    = 1021,
    -- MIJIN_GAKURE         = 2105,
    -- MIJIN_GAKURE         = 2254,
    -- MIJIN_GAKURE         = 2382,
    CALL_WYVERN          = 732,
    CALL_WYVERN_MAAT     = 1022,
    FAMILIAR             = 740,
    FAMILIAR_MAAT        = 1016,
    -- FAMILIAR             = 2250,
    ASTRAL_FLOW          = 734,
    ASTRAL_FLOW_MAAT     = 1023,
    -- ASTRAL_FLOW          = 2256,
    -- Eagle Eye Shot has a TON of duplicates because mob models animate differently
    -- EES_?                = 413,
    -- EES_?                = 711,
    -- EES_?                = 712,
    EES_GOBLIN           = 735,
    EES_ANTICA           = 736,
    EES_ORC              = 737,
    EES_SHADE            = 738,
    EES_GIGA             = 739,
    EES_MAAT             = 1019,
    -- EES_?                = 1065,
    -- EES_?                = 1091,
    EES_YAGUDO           = 1121,
    EES_QUADAV           = 1122,
    EES_KINDRED          = 1151,
    -- EES_?                = 1153,
    -- EES_?                = 1327,
    EES_AERN             = 1389,
    -- EES_?                = 1557,
    -- EES_?                = 1641,
    EES_LAMIA            = 1931,
    EES_MERROW           = 1932,
    -- EES_?                = 2148,
    EES_TROLL            = 2252,
    -- EES_?                = 2941,
    -- SPIRIT_SURGE         = 1893,
    -- SPIRIT_SURGE         = 2255,
    -- AZURE_LORE           = 1933,
    -- AZURE_LORE           = 2006,
    -- AZURE_LORE           = 2257,
    -- AZURE_LORE           = 3481,
    -- WILD_CARD            = 1934,
    -- WILD_CARD            = 2007,
    -- WILD_CARD            = 2258,
    -- OVERDRIVE            = 1935,
    -- OVERDRIVE            = 2008,
    -- OVERDRIVE            = 2259,
    -- TABULA_RASA          = 2358,
    -- TABULA_RASA          = 2261,
    -- TABULA_RASA          = 2358,
    -- TRANCE               = 2260,
    -- TRANCE               = 2710,
    -- ELEMENTAL_SFORZO     = 3265,
    -- ELEMENTAL_SFORZO     = 3479,
    -- BOLSTER              = 3482,
};

------------------------------------
-- Skills
------------------------------------

-- Combat Skills
SKILL_NON = 0
SKILL_H2H = 1
SKILL_DAG = 2
SKILL_SWD = 3
SKILL_GSD = 4
SKILL_AXE = 5
SKILL_GAX = 6
SKILL_SYH = 7
SKILL_POL = 8
SKILL_KAT = 9
SKILL_GKT = 10
SKILL_CLB = 11
SKILL_STF = 12
-- 13~21 unused
-- 22~24 pup's Automaton skills
SKILL_ARC = 25
SKILL_MRK = 26
SKILL_THR = 27

-- Defensive Skills
SKILL_GRD = 28
SKILL_EVA = 29
SKILL_SHL = 30
SKILL_PAR = 31

-- Magic Skills
SKILL_DIV = 32
SKILL_HEA = 33
SKILL_ENH = 34
SKILL_ENF = 35
SKILL_ELE = 36
SKILL_DRK = 37
SKILL_SUM = 38
SKILL_NIN = 39
SKILL_SNG = 40
SKILL_STR = 41
SKILL_WND = 42
SKILL_BLU = 43
SKILL_GEO = 44

-- 45~47 unused

-- Crafting Skills
SKILL_FISHING      = 48
SKILL_WOODWORKING  = 49
SKILL_SMITHING     = 50
SKILL_GOLDSMITHING = 51
SKILL_CLOTHCRAFT   = 52
SKILL_LEATHERCRAFT = 53
SKILL_BONECRAFT    = 54
SKILL_ALCHEMY      = 55
SKILL_COOKING      = 56
SKILL_SYNERGY      = 57

-- Other Skills
SKILL_RID          = 58
SKILL_DIG          = 59
-- 60~63 unused
-- MAX_SKILLTYPE = 64

------------------------------------
-- Recast IDs
------------------------------------

RECAST_ITEM     = 0
RECAST_MAGIC    = 1
RECAST_ABILITY  = 2

------------------------------------
-- ACTION IDs
------------------------------------

ACTION_NONE                 = 0;
ACTION_ATTACK               = 1;
ACTION_RANGED_FINISH        = 2;
ACTION_WEAPONSKILL_FINISH   = 3;
ACTION_MAGIC_FINISH         = 4;
ACTION_ITEM_FINISH          = 5;
ACTION_JOBABILITY_FINISH    = 6;
ACTION_WEAPONSKILL_START    = 7;
ACTION_MAGIC_START          = 8;
ACTION_ITEM_START           = 9;
ACTION_JOBABILITY_START     = 10;
ACTION_MOBABILITY_FINISH    = 11;
ACTION_RANGED_START         = 12;
ACTION_RAISE_MENU_SELECTION = 13;
ACTION_DANCE                = 14;
ACTION_UNKNOWN_15           = 15;
ACTION_ROAMING              = 16;
ACTION_ENGAGE               = 17;
ACTION_DISENGAGE            = 18;
ACTION_CHANGE_TARGET        = 19;
ACTION_FALL                 = 20;
ACTION_DROPITEMS            = 21;
ACTION_DEATH                = 22;
ACTION_FADE_OUT             = 23;
ACTION_DESPAWN              = 24;
ACTION_SPAWN                = 25;
ACTION_STUN                 = 26;
ACTION_SLEEP                = 27;
ACTION_ITEM_USING           = 28;
ACTION_ITEM_INTERRUPT       = 29;
ACTION_MAGIC_CASTING        = 30;
ACTION_MAGIC_INTERRUPT      = 31;
ACTION_RANGED_INTERRUPT     = 32;
ACTION_MOBABILITY_START     = 33;
ACTION_MOBABILITY_USING     = 34;
ACTION_MOBABILITY_INTERRUPT = 35;
ACTION_LEAVE                = 36;

------------------------------------
-- ECOSYSTEM IDs
------------------------------------

SYSTEM_ERROR          = 0;
SYSTEM_AMORPH         = 1;
SYSTEM_AQUAN          = 2;
SYSTEM_ARCANA         = 3;
SYSTEM_ARCHAICMACHINE = 4;
SYSTEM_AVATAR         = 5;
SYSTEM_BEAST          = 6;
SYSTEM_BEASTMEN       = 7;
SYSTEM_BIRD           = 8;
SYSTEM_DEMON          = 9;
SYSTEM_DRAGON         = 10;
SYSTEM_ELEMENTAL      = 11;
SYSTEM_EMPTY          = 12;
SYSTEM_HUMANOID       = 13;
SYSTEM_LIZARD         = 14;
SYSTEM_LUMORIAN       = 15;
SYSTEM_LUMINION       = 16;
SYSTEM_PLANTOID       = 17;
SYSTEM_UNCLASSIFIED   = 18;
SYSTEM_UNDEAD         = 19;
SYSTEM_VERMIN         = 20;
SYSTEM_VORAGEAN       = 21;

------------------------------------
-- Spell AOE IDs
------------------------------------

SPELLAOE_NONE        = 0;
SPELLAOE_RADIAL      = 1;
SPELLAOE_CONAL       = 2;
SPELLAOE_RADIAL_MANI = 3; -- AOE when under SCH stratagem Manifestation
SPELLAOE_RADIAL_ACCE = 4; -- AOE when under SCH stratagem Accession
SPELLAOE_PIANISSIMO  = 5; -- Single target when under BRD JA Pianissimo
SPELLAOE_DIFFUSION   = 6; -- AOE when under Diffusion

------------------------------------
-- Spell flag bits
------------------------------------

SPELLFLAG_NONE          = 0x00;
SPELLFLAG_HIT_ALL       = 0x01; -- Hit all targets in range regardless of party
SPELLFLAG_WIPE_SHADOWS  = 0x02; -- Wipe shadows even if single target and miss/resist (example: Maiden's Virelai)

------------------------------------
-- Behaviour bits
------------------------------------

BEHAVIOUR_NONE         = 0x000;
BEHAVIOUR_NO_DESPAWN   = 0x001; -- mob does not despawn on death
BEHAVIOUR_STANDBACK    = 0x002; -- mob will standback forever
BEHAVIOUR_RAISABLE     = 0x004; -- mob can be raised via Raise spells
BEHAVIOUR_AGGRO_AMBUSH = 0x200; -- mob aggroes by ambush
BEHAVIOUR_NO_TURN      = 0x400; -- mob does not turn to face target

------------------------------------
-- Elevator IDs
------------------------------------

ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK = 0;
ELEVATOR_PORT_BASTOK_DRWBRDG       = 2;
ELEVATOR_DAVOI_LIFT                = 3;
ELEVATOR_PALBOROUGH_MINES_LIFT     = 4;


------------------------------------
-- Item Type
-----------------------------------
ITEM_BASIC       = 0x00;
ITEM_GENERAL     = 0x01;
ITEM_USABLE      = 0x02;
ITEM_PUPPET      = 0x04;
ITEM_ARMOR       = 0x08;
ITEM_WEAPON      = 0x10;
ITEM_CURRENCY    = 0x20;
ITEM_FURNISHING  = 0x40;
ITEM_LINKSHELL   = 0x80;

------------------------------------
-- Animation IDs
------------------------------------
ANIMATION_NONE                     = 0;
ANIMATION_ATTACK                   = 1;
-- Death 2                            = 2;
ANIMATION_DEATH                    = 3;
ANIMATION_CHOCOBO                  = 5;
ANIMATION_FISHING                  = 6;
ANIMATION_HEALING                  = 7;
ANIMATION_OPEN_DOOR                = 8;
ANIMATION_CLOSE_DOOR               = 9;
ANIMATION_ELEVATOR_UP              = 10;
ANIMATION_ELEVATOR_DOWN            = 11;
-- seems to be WALLHACK               = 28;
-- seems to be WALLHACK also..        = 31;
ANIMATION_FISHING_NPC              = 32;
ANIMATION_HEALING                  = 33;
ANIMATION_FISHING_FISH             = 38;
ANIMATION_FISHING_CAUGHT           = 39;
ANIMATION_FISHING_ROD_BREAK        = 40;
ANIMATION_FISHING_LINE_BREAK       = 41;
ANIMATION_FISHING_MONSTER          = 42;
ANIMATION_FISHING_STOP             = 43;
ANIMATION_SYNTH                    = 44;
ANIMATION_SIT                      = 47;
ANIMATION_RANGED                   = 48;
ANIMATION_FISHING_START            = 50;
ANIMATION_NEW_FISHING_START        = 56;
ANIMATION_NEW_FISHING_FISH         = 57;
ANIMATION_NEW_FISHING_CAUGHT       = 58;
ANIMATION_NEW_FISHING_ROD_BREAK    = 59;
ANIMATION_NEW_FISHING_LINE_BREAK   = 60;
ANIMATION_NEW_FISHING_MONSTER      = 61;
ANIMATION_NEW_FISHING_STOP         = 62;
-- 63 through 72 are used with /sitchair
-- 73 through 83 sitting on air (guessing future use for more chairs..)
ANIMATION_MOUNT                    = 85;
-- ANIMATION_TRUST                    = 90; -- This is the animation for a trust NPC spawning in.

------------------------------------
-- Mount IDs
------------------------------------
MOUNTS =
{
    CHOCOBO        = 0,
    QUEST_RAPTOR   = 1,
    RAPTOR         = 2,
    TIGER          = 3,
    CRAB           = 4,
    RED_CRAB       = 5,
    BOMB           = 6,
    RAM            = 7,
    MORBOL         = 8,
    CRAWLER        = 9,
    FENRIR         = 10,
    BEETLE         = 11,
    MOOGLE         = 12,
    MAGIC_POT      = 13,
    TULFAIRE       = 14,
    WARMACHINE     = 15,
    XZOMIT         = 16,
    HIPPOGRYPH     = 17,
    SPECTRAL_CHAIR = 18,
    SPHEROID       = 19,
    OMEGA          = 20,
}

------------------------------------
-- Item Check Params
------------------------------------
ITEMCHECK_NONE      = 0;
ITEMCHECK_EQUIP     = 1;
ITEMCHECK_UNEQUIP   = 2;
