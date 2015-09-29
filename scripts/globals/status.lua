------------------------------------
--
-- STATUSES AND MODS
--
-- Contains variable-ized definitions of things like core enums for use in lua scripts.
------------------------------------


------------------------------------
-- Job IDs
------------------------------------

JOB_NON = 0
JOB_WAR = 1
JOB_MNK = 2
JOB_WHM = 3
JOB_BLM = 4
JOB_RDM = 5
JOB_THF = 6
JOB_PLD = 7
JOB_DRK = 8
JOB_BST = 9
JOB_BRD = 10
JOB_RNG = 11
JOB_SAM = 12
JOB_NIN = 13
JOB_DRG = 14
JOB_SMN = 15
JOB_BLU = 16
JOB_COR = 17
JOB_PUP = 18
JOB_DNC = 19
JOB_SCH = 20
JOB_GEO = 21
JOB_RUN = 22
MAX_JOB_TYPE = 23

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
SUBEFFECT_EARTH_DAMAGE      = 4;   -- 1-00100       9
SUBEFFECT_LIGHTNING_DAMAGE  = 5;   -- 110100       11
SUBEFFECT_WATER_DAMAGE      = 6;   -- 1-01100      13
SUBEFFECT_LIGHT_DAMAGE      = 7;   -- 111100       15
SUBEFFECT_DARKNESS_DAMAGE   = 8;   -- 1-00010      17
SUBEFFECT_SLEEP             = 9;   -- 110010       19
SUBEFFECT_POISON            = 10;  -- 1-01010      21
SUBEFFECT_PARALYSIS         = 11;
SUBEFFECT_BLIND             = 12;  -- 1-00110      25
SUBEFFECT_SILENCE           = 13;
SUBEFFECT_PETRIFY           = 14;
SUBEFFECT_PLAGUE            = 15;
SUBEFFECT_STUN              = 16;
SUBEFFECT_CURSE             = 17;
SUBEFFECT_DEFENSE_DOWN      = 18;  -- 1-01001      37
SUBEFFECT_EVASION_DOWN      = 18;  -- ID needs verification
SUBEFFECT_ATTACK_DOWN       = 18;  -- ID needs verification
SUBEFFECT_DEATH             = 19;
SUBEFFECT_SHIELD            = 20;
SUBEFFECT_HP_DRAIN          = 21;  -- 1-10101      43
SUBEFFECT_MP_DRAIN          = 22;  -- This is correct animation
SUBEFFECT_TP_DRAIN          = 22;  -- Verified this should look exactly like Aspir Samba.
SUBEFFECT_HASTE             = 23;
-- Below are almost certain to be wrong: 
-- Someone needs to go on retail and verify the SubEffect IDs
SUBEFFECT_AMNESIA           = 11; --
SUBEFFECT_DISPEL            = 13; -- Correct ID possibly 20 ?

-- SPIKES
SUBEFFECT_BLAZE_SPIKES      = 1;   -- 01-1000       6
SUBEFFECT_ICE_SPIKES        = 2;   -- 01-0100      10
SUBEFFECT_DREAD_SPIKES      = 3;   -- 01-1100      14
SUBEFFECT_CURSE_SPIKES      = 4;   -- 01-0010      18
SUBEFFECT_SHOCK_SPIKES      = 5;   -- 01-1010      22
SUBEFFECT_REPRISAL          = 6;   -- 01-0110      26
SUBEFFECT_WIND_SPIKES       = 7;
SUBEFFECT_STONE_SPIKES      = 8;
SUBEFFECT_DELUGE_SPIKES     = 9;
SUBEFFECT_DEATH_SPIKES      = 10;  -- yes really: http://www.ffxiah.com/item/26944/
SUBEFFECT_COUNTER           = 63;

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

EFFECT_KO                       = 0
EFFECT_WEAKNESS                 = 1
EFFECT_SLEEP_I                  = 2
EFFECT_POISON                   = 3
EFFECT_PARALYSIS                = 4
EFFECT_BLINDNESS                = 5
EFFECT_SILENCE                  = 6
EFFECT_PETRIFICATION            = 7
EFFECT_DISEASE                  = 8
EFFECT_CURSE_I                  = 9
EFFECT_STUN                     = 10
EFFECT_BIND                     = 11
EFFECT_WEIGHT                   = 12
EFFECT_SLOW                     = 13
EFFECT_CHARM_I                  = 14
EFFECT_DOOM                     = 15
EFFECT_AMNESIA                  = 16
EFFECT_CHARM_II                 = 17
EFFECT_GRADUAL_PETRIFICATION    = 18
EFFECT_SLEEP_II                 = 19
EFFECT_CURSE_II                 = 20
EFFECT_ADDLE                    = 21
EFFECT_INTIMIDATE               = 22
EFFECT_KAUSTRA                  = 23
EFFECT_TERROR                   = 28
EFFECT_MUTE                     = 29
EFFECT_BANE                     = 30
EFFECT_PLAGUE                   = 31
EFFECT_FLEE                     = 32
EFFECT_HASTE                    = 33
EFFECT_BLAZE_SPIKES             = 34
EFFECT_ICE_SPIKES               = 35
EFFECT_BLINK                    = 36
EFFECT_STONESKIN                = 37
EFFECT_SHOCK_SPIKES             = 38
EFFECT_AQUAVEIL                 = 39
EFFECT_PROTECT                  = 40
EFFECT_SHELL                    = 41
EFFECT_REGEN                    = 42
EFFECT_REFRESH                  = 43
EFFECT_MIGHTY_STRIKES           = 44
EFFECT_BOOST                    = 45
EFFECT_HUNDRED_FISTS            = 46
EFFECT_MANAFONT                 = 47
EFFECT_CHAINSPELL               = 48
EFFECT_PERFECT_DODGE            = 49
EFFECT_INVINCIBLE               = 50
EFFECT_BLOOD_WEAPON             = 51
EFFECT_SOUL_VOICE               = 52
EFFECT_EAGLE_EYE_SHOT           = 53
EFFECT_MEIKYO_SHISUI            = 54
EFFECT_ASTRAL_FLOW              = 55
EFFECT_BERSERK                  = 56
EFFECT_DEFENDER                 = 57
EFFECT_AGGRESSOR                = 58
EFFECT_FOCUS                    = 59
EFFECT_DODGE                    = 60
EFFECT_COUNTERSTANCE            = 61
EFFECT_SENTINEL                 = 62
EFFECT_SOULEATER                = 63
EFFECT_LAST_RESORT              = 64
EFFECT_SNEAK_ATTACK             = 65
EFFECT_COPY_IMAGE               = 66
EFFECT_THIRD_EYE                = 67
EFFECT_WARCRY                   = 68
EFFECT_INVISIBLE                = 69
EFFECT_DEODORIZE                = 70
EFFECT_SNEAK                    = 71
EFFECT_SHARPSHOT                = 72
EFFECT_BARRAGE                  = 73
EFFECT_HOLY_CIRCLE              = 74
EFFECT_ARCANE_CIRCLE            = 75
EFFECT_HIDE                     = 76
EFFECT_CAMOUFLAGE               = 77
EFFECT_DIVINE_SEAL              = 78
EFFECT_ELEMENTAL_SEAL           = 79
EFFECT_STR_BOOST                = 80
EFFECT_DEX_BOOST                = 81
EFFECT_VIT_BOOST                = 82
EFFECT_AGI_BOOST                = 83
EFFECT_INT_BOOST                = 84
EFFECT_MND_BOOST                = 85
EFFECT_CHR_BOOST                = 86
EFFECT_TRICK_ATTACK             = 87
EFFECT_MAX_HP_BOOST             = 88
EFFECT_MAX_MP_BOOST             = 89
EFFECT_ACCURACY_BOOST           = 90
EFFECT_ATTACK_BOOST             = 91
EFFECT_EVASION_BOOST            = 92
EFFECT_DEFENSE_BOOST            = 93
EFFECT_ENFIRE                   = 94
EFFECT_ENBLIZZARD               = 95
EFFECT_ENAERO                   = 96
EFFECT_ENSTONE                  = 97
EFFECT_ENTHUNDER                = 98
EFFECT_ENWATER                  = 99
EFFECT_BARFIRE                  = 100
EFFECT_BARBLIZZARD              = 101
EFFECT_BARAERO                  = 102
EFFECT_BARSTONE                 = 103
EFFECT_BARTHUNDER               = 104
EFFECT_BARWATER                 = 105
EFFECT_BARSLEEP                 = 106
EFFECT_BARPOISON                = 107
EFFECT_BARPARALYZE              = 108
EFFECT_BARBLIND                 = 109
EFFECT_BARSILENCE               = 110
EFFECT_BARPETRIFY               = 111
EFFECT_BARVIRUS                 = 112
EFFECT_RERAISE                  = 113
EFFECT_COVER                    = 114
EFFECT_UNLIMITED_SHOT           = 115
EFFECT_PHALANX                  = 116
EFFECT_WARDING_CIRCLE           = 117
EFFECT_ANCIENT_CIRCLE           = 118
EFFECT_STR_BOOST_II             = 119
EFFECT_DEX_BOOST_II             = 120
EFFECT_VIT_BOOST_II             = 121
EFFECT_AGI_BOOST_II             = 122
EFFECT_INT_BOOST_II             = 123
EFFECT_MND_BOOST_II             = 124
EFFECT_CHR_BOOST_II             = 125
EFFECT_SPIRIT_SURGE             = 126
EFFECT_COSTUME                  = 127
EFFECT_BURN                     = 128
EFFECT_FROST                    = 129
EFFECT_CHOKE                    = 130
EFFECT_RASP                     = 131
EFFECT_SHOCK                    = 132
EFFECT_DROWN                    = 133
EFFECT_DIA                      = 134
EFFECT_BIO                      = 135
EFFECT_STR_DOWN                 = 136
EFFECT_DEX_DOWN                 = 137
EFFECT_VIT_DOWN                 = 138
EFFECT_AGI_DOWN                 = 139
EFFECT_INT_DOWN                 = 140
EFFECT_MND_DOWN                 = 141
EFFECT_CHR_DOWN                 = 142
EFFECT_LEVEL_RESTRICTION        = 143
EFFECT_MAX_HP_DOWN              = 144
EFFECT_MAX_MP_DOWN              = 145
EFFECT_ACCURACY_DOWN            = 146
EFFECT_ATTACK_DOWN              = 147
EFFECT_EVASION_DOWN             = 148
EFFECT_DEFENSE_DOWN             = 149
EFFECT_PHYSICAL_SHIELD          = 150
EFFECT_ARROW_SHIELD             = 151
EFFECT_MAGIC_SHIELD             = 152
EFFECT_DAMAGE_SPIKES            = 153
EFFECT_SHINING_RUBY             = 154
EFFECT_MEDICINE                 = 155
EFFECT_FLASH                    = 156
EFFECT_SJ_RESTRICTION           = 157
EFFECT_PROVOKE                  = 158
EFFECT_PENALTY                  = 159
EFFECT_PREPARATIONS             = 160
EFFECT_SPRINT                   = 161
EFFECT_ENCHANTMENT              = 162
EFFECT_AZURE_LORE               = 163
EFFECT_CHAIN_AFFINITY           = 164
EFFECT_BURST_AFFINITY           = 165
EFFECT_OVERDRIVE                = 166
EFFECT_MAGIC_DEF_DOWN           = 167
EFFECT_INHIBIT_TP               = 168
EFFECT_POTENCY                  = 169
EFFECT_REGAIN                   = 170
EFFECT_PAX                      = 171
EFFECT_INTENSION                = 172
EFFECT_DREAD_SPIKES             = 173
EFFECT_MAGIC_ACC_DOWN           = 174
EFFECT_MAGIC_ATK_DOWN           = 175
EFFECT_QUICKENING               = 176
EFFECT_ENCUMBRANCE_II           = 177
EFFECT_FIRESTORM                = 178
EFFECT_HAILSTORM                = 179
EFFECT_WINDSTORM                = 180
EFFECT_SANDSTORM                = 181
EFFECT_THUNDERSTORM             = 182
EFFECT_RAINSTORM                = 183
EFFECT_AURORASTORM              = 184
EFFECT_VOIDSTORM                = 185
EFFECT_HELIX                    = 186
EFFECT_SUBLIMATION_ACTIVATED    = 187
EFFECT_SUBLIMATION_COMPLETE     = 188
EFFECT_MAX_TP_DOWN              = 189
EFFECT_MAGIC_ATK_BOOST          = 190
EFFECT_MAGIC_DEF_BOOST          = 191
EFFECT_REQUIEM                  = 192
EFFECT_LULLABY                  = 193
EFFECT_ELEGY                    = 194
EFFECT_PAEON                    = 195
EFFECT_BALLAD                   = 196
EFFECT_MINNE                    = 197
EFFECT_MINUET                   = 198
EFFECT_MADRIGAL                 = 199
EFFECT_PRELUDE                  = 200
EFFECT_MAMBO                    = 201
EFFECT_AUBADE                   = 202
EFFECT_PASTORAL                 = 203
EFFECT_HUM                      = 204
EFFECT_FANTASIA                 = 205
EFFECT_OPERETTA                 = 206
EFFECT_CAPRICCIO                = 207
EFFECT_SERENADE                 = 208
EFFECT_ROUND                    = 209
EFFECT_GAVOTTE                  = 210
EFFECT_FUGUE                    = 211
EFFECT_RHAPSODY                 = 212
EFFECT_ARIA                     = 213
EFFECT_MARCH                    = 214
EFFECT_ETUDE                    = 215
EFFECT_CAROL                    = 216
EFFECT_THRENODY                 = 217
EFFECT_HYMNUS                   = 218
EFFECT_MAZURKA                  = 219
EFFECT_SIRVENTE                 = 220
EFFECT_DIRGE                    = 221
EFFECT_SCHERZO                  = 222
EFFECT_NOCTURNE                 = 223
EFFECT_STORE_TP                 = 227
EFFECT_EMBRAVA                  = 228
EFFECT_MANAWELL                 = 229
EFFECT_SPONTANEITY              = 230
EFFECT_MARCATO                  = 231
EFFECT_NA                       = 232
EFFECT_AUTO_REGEN               = 233
EFFECT_AUTO_REFRESH             = 234
EFFECT_FISHING_IMAGERY          = 235
EFFECT_WOODWORKING_IMAGERY      = 236
EFFECT_SMITHING_IMAGERY         = 237
EFFECT_GOLDSMITHING_IMAGERY     = 238
EFFECT_CLOTHCRAFT_IMAGERY       = 239
EFFECT_LEATHERCRAFT_IMAGERY     = 240
EFFECT_BONECRAFT_IMAGERY        = 241
EFFECT_ALCHEMY_IMAGERY          = 242
EFFECT_COOKING_IMAGERY          = 243
EFFECT_IMAGERY_1                = 244
EFFECT_IMAGERY_2                = 245
EFFECT_IMAGERY_3                = 246
EFFECT_IMAGERY_4                = 247
EFFECT_IMAGERY_5                = 248
EFFECT_DEDICATION               = 249
EFFECT_EF_BADGE                 = 250
EFFECT_FOOD                     = 251
EFFECT_CHOCOBO                  = 252
EFFECT_SIGNET                   = 253
EFFECT_BATTLEFIELD              = 254
EFFECT_NONE                     = 255
EFFECT_SANCTION                 = 256
EFFECT_BESIEGED                 = 257
EFFECT_ILLUSION                 = 258
EFFECT_ENCUMBRANCE_I            = 259
EFFECT_OBLIVISCENCE             = 260
EFFECT_IMPAIRMENT               = 261
EFFECT_OMERTA                   = 262
EFFECT_DEBILITATION             = 263
EFFECT_PATHOS                   = 264
EFFECT_FLURRY                   = 265
EFFECT_CONCENTRATION            = 266
EFFECT_ALLIED_TAGS              = 267
EFFECT_SIGIL                    = 268
EFFECT_LEVEL_SYNC               = 269
EFFECT_AFTERMATH_LV1            = 270
EFFECT_AFTERMATH_LV2            = 271
EFFECT_AFTERMATH_LV3            = 272
EFFECT_AFTERMATH                = 273
EFFECT_ENLIGHT                  = 274
EFFECT_AUSPICE                  = 275
EFFECT_CONFRONTATION            = 276
EFFECT_ENFIRE_II                = 277
EFFECT_ENBLIZZARD_II            = 278
EFFECT_ENAERO_II                = 279
EFFECT_ENSTONE_II               = 280
EFFECT_ENTHUNDER_II             = 281
EFFECT_ENWATER_II               = 282
EFFECT_PERFECT_DEFENSE          = 283
EFFECT_EGG                      = 284
EFFECT_VISITANT                 = 285
EFFECT_BARAMNESIA               = 286
EFFECT_ATMA                     = 287
EFFECT_ENDARK                   = 288
EFFECT_ENMITY_BOOST             = 289
EFFECT_SUBTLE_BLOW_PLUS         = 290
EFFECT_ENMITY_DOWN              = 291
EFFECT_PENNANT                  = 292
EFFECT_NEGATE_PETRIFY           = 293
EFFECT_NEGATE_TERROR            = 294
EFFECT_NEGATE_AMNESIA           = 295
EFFECT_NEGATE_DOOM              = 296
EFFECT_NEGATE_POISON            = 297
EFFECT_CRIT_HIT_EVASION_DOWN    = 298
EFFECT_OVERLOAD                 = 299
EFFECT_FIRE_MANEUVER            = 300
EFFECT_ICE_MANEUVER             = 301
EFFECT_WIND_MANEUVER            = 302
EFFECT_EARTH_MANEUVER           = 303
EFFECT_THUNDER_MANEUVER         = 304
EFFECT_WATER_MANEUVER           = 305
EFFECT_LIGHT_MANEUVER           = 306
EFFECT_DARK_MANEUVER            = 307
EFFECT_DOUBLE_UP_CHANCE         = 308
EFFECT_BUST                     = 309
EFFECT_FIGHTERS_ROLL            = 310
EFFECT_MONKS_ROLL               = 311
EFFECT_HEALERS_ROLL             = 312
EFFECT_WIZARDS_ROLL             = 313
EFFECT_WARLOCKS_ROLL            = 314
EFFECT_ROGUES_ROLL              = 315
EFFECT_GALLANTS_ROLL            = 316
EFFECT_CHAOS_ROLL               = 317
EFFECT_BEAST_ROLL               = 318
EFFECT_CHORAL_ROLL              = 319
EFFECT_HUNTERS_ROLL             = 320
EFFECT_SAMURAI_ROLL             = 321
EFFECT_NINJA_ROLL               = 322
EFFECT_DRACHEN_ROLL             = 323
EFFECT_EVOKERS_ROLL             = 324
EFFECT_MAGUSS_ROLL              = 325
EFFECT_CORSAIRS_ROLL            = 326
EFFECT_PUPPET_ROLL              = 327
EFFECT_DANCERS_ROLL             = 328
EFFECT_SCHOLARS_ROLL            = 329
EFFECT_BOLTERS_ROLL             = 330
EFFECT_CASTERS_ROLL             = 331
EFFECT_COURSERS_ROLL            = 332
EFFECT_BLITZERS_ROLL            = 333
EFFECT_TACTICIANS_ROLL          = 334
EFFECT_ALLIES_ROLL              = 335
EFFECT_MISERS_ROLL              = 336
EFFECT_COMPANIONS_ROLL          = 337
EFFECT_AVENGERS_ROLL            = 338
-- EFFECT_NONE                      = 339
EFFECT_WARRIOR_S_CHARGE         = 340
EFFECT_FORMLESS_STRIKES         = 341
EFFECT_ASSASSIN_S_CHARGE        = 342
EFFECT_FEINT                    = 343
EFFECT_FEALTY                   = 344
EFFECT_DARK_SEAL                = 345
EFFECT_DIABOLIC_EYE             = 346
EFFECT_NIGHTINGALE              = 347
EFFECT_TROUBADOUR               = 348
EFFECT_KILLER_INSTINCT          = 349
EFFECT_STEALTH_SHOT             = 350
EFFECT_FLASHY_SHOT              = 351
EFFECT_SANGE                    = 352
EFFECT_HASSO                    = 353
EFFECT_SEIGAN                   = 354
EFFECT_CONVERGENCE              = 355
EFFECT_DIFFUSION                = 356
EFFECT_SNAKE_EYE                = 357
EFFECT_LIGHT_ARTS               = 358
EFFECT_DARK_ARTS                = 359
EFFECT_PENURY                   = 360
EFFECT_PARSIMONY                = 361
EFFECT_CELERITY                 = 362
EFFECT_ALACRITY                 = 363
EFFECT_RAPTURE                  = 364
EFFECT_EBULLIENCE               = 365
EFFECT_ACCESSION                = 366
EFFECT_MANIFESTATION            = 367
EFFECT_DRAIN_SAMBA              = 368
EFFECT_ASPIR_SAMBA              = 369
EFFECT_HASTE_SAMBA              = 370
EFFECT_VELOCITY_SHOT            = 371
EFFECT_BUILDING_FLOURISH        = 375
EFFECT_TRANCE                   = 376
EFFECT_TABULA_RASA              = 377
EFFECT_DRAIN_DAZE               = 378
EFFECT_ASPIR_DAZE               = 379
EFFECT_HASTE_DAZE               = 380
EFFECT_FINISHING_MOVE_1         = 381
EFFECT_FINISHING_MOVE_2         = 382
EFFECT_FINISHING_MOVE_3         = 383
EFFECT_FINISHING_MOVE_4         = 384
EFFECT_FINISHING_MOVE_5         = 385
EFFECT_LETHARGIC_DAZE_1         = 386
EFFECT_LETHARGIC_DAZE_2         = 387
EFFECT_LETHARGIC_DAZE_3         = 388
EFFECT_LETHARGIC_DAZE_4         = 389
EFFECT_LETHARGIC_DAZE_5         = 390
EFFECT_SLUGGISH_DAZE_1          = 391
EFFECT_SLUGGISH_DAZE_2          = 392
EFFECT_SLUGGISH_DAZE_3          = 393
EFFECT_SLUGGISH_DAZE_4          = 394
EFFECT_SLUGGISH_DAZE_5          = 395
EFFECT_WEAKENED_DAZE_1          = 396
EFFECT_WEAKENED_DAZE_2          = 397
EFFECT_WEAKENED_DAZE_3          = 398
EFFECT_WEAKENED_DAZE_4          = 399
EFFECT_WEAKENED_DAZE_5          = 400
EFFECT_ADDENDUM_WHITE           = 401
EFFECT_ADDENDUM_BLACK           = 402
EFFECT_REPRISAL                 = 403
EFFECT_MAGIC_EVASION_DOWN       = 404
EFFECT_RETALIATION              = 405
EFFECT_FOOTWORK                 = 406
EFFECT_KLIMAFORM                = 407
EFFECT_SEKKANOKI                = 408
EFFECT_PIANISSIMO               = 409
EFFECT_SABER_DANCE              = 410
EFFECT_FAN_DANCE                = 411
EFFECT_ALTRUISM                 = 412
EFFECT_FOCALIZATION             = 413
EFFECT_TRANQUILITY              = 414
EFFECT_EQUANIMITY               = 415
EFFECT_ENLIGHTENMENT            = 416
EFFECT_AFFLATUS_SOLACE          = 417
EFFECT_AFFLATUS_MISERY          = 418
EFFECT_COMPOSURE                = 419
EFFECT_YONIN                    = 420
EFFECT_INNIN                    = 421
EFFECT_CARBUNCLE_S_FAVOR        = 422
EFFECT_IFRIT_S_FAVOR            = 423
EFFECT_SHIVA_S_FAVOR            = 424
EFFECT_GARUDA_S_FAVOR           = 425
EFFECT_TITAN_S_FAVOR            = 426
EFFECT_RAMUH_S_FAVOR            = 427
EFFECT_LEVIATHAN_S_FAVOR        = 428
EFFECT_FENRIR_S_FAVOR           = 429
EFFECT_DIABOLOS_S_FAVOR         = 430
EFFECT_AVATAR_S_FAVOR           = 431
EFFECT_MULTI_STRIKES            = 432
EFFECT_DOUBLE_SHOT              = 433
EFFECT_TRANSCENDENCY            = 434
EFFECT_RESTRAINT                = 435
EFFECT_PERFECT_COUNTER          = 436
EFFECT_MANA_WALL                = 437
EFFECT_DIVINE_EMBLEM            = 438
EFFECT_NETHER_VOID              = 439
EFFECT_SENGIKORI                = 440
EFFECT_FUTAE                    = 441
EFFECT_PRESTO                   = 442
EFFECT_CLIMACTIC_FLOURISH       = 443
EFFECT_COPY_IMAGE_2             = 444
EFFECT_COPY_IMAGE_3             = 445
EFFECT_COPY_IMAGE_4             = 446
EFFECT_MULTI_SHOTS              = 447
EFFECT_BEWILDERED_DAZE_1        = 448
EFFECT_BEWILDERED_DAZE_2        = 449
EFFECT_BEWILDERED_DAZE_3        = 450
EFFECT_BEWILDERED_DAZE_4        = 451
EFFECT_BEWILDERED_DAZE_5        = 452
EFFECT_DIVINE_CARESS_I          = 453
EFFECT_SABOTEUR                 = 454
EFFECT_TENUTO                   = 455
EFFECT_SPUR                     = 456
EFFECT_EFFLUX                   = 457
EFFECT_EARTHEN_ARMOR            = 458
EFFECT_DIVINE_CARESS_II         = 459
EFFECT_BLOOD_RAGE               = 460
EFFECT_IMPETUS                  = 461
EFFECT_CONSPIRATOR              = 462
EFFECT_SEPULCHER                = 463
EFFECT_ARCANE_CREST             = 464
EFFECT_HAMANOHA                 = 465
EFFECT_DRAGON_BREAKER           = 466
EFFECT_TRIPLE_SHOT              = 467
EFFECT_STRIKING_FLOURISH        = 468
EFFECT_PERPETUANCE              = 469
EFFECT_IMMANENCE                = 470
EFFECT_MIGAWARI                 = 471
EFFECT_TERNARY_FLOURISH         = 472 -- DNC 93
EFFECT_MUDDLE                   = 473 -- MOB EFFECT
EFFECT_PROWESS                  = 474 -- GROUNDS OF VALOR
EFFECT_VOIDWATCHER              = 475 -- VOIDWATCH
EFFECT_ENSPHERE                 = 476 -- ATMACITE
EFFECT_SACROSANCTITY            = 477 -- WHM 95
EFFECT_PALISADE                 = 478 -- PLD 95
EFFECT_SCARLET_DELIRIUM         = 479 -- DRK 95
EFFECT_SCARLET_DELIRIUM_1       = 480 -- DRK 95
-- EFFECT_NONE                      = 481 -- NONE
EFFECT_DECOY_SHOT               = 482 -- RNG 95
EFFECT_HAGAKURE                 = 483 -- SAM 95
EFFECT_ISSEKIGAN                = 484 -- NIN 95
EFFECT_UNBRIDLED_LEARNING       = 485 -- BLU 95
EFFECT_COUNTER_BOOST            = 486 --
EFFECT_ENDRAIN                  = 487 -- FENRIR 96
EFFECT_ENASPIR                  = 488 -- FENRIR 96
EFFECT_AFTERGLOW                = 489 -- WS AFTEREFFECT
EFFECT_BRAZEN_STRENGTH          = 490 --
EFFECT_INNER_STRENGTH           = 491
EFFECT_ASYLUM                   = 492
EFFECT_SUBTLE_SORCERY           = 493
EFFECT_STYMIE                   = 494
-- EFFECT_NONE                       = 495
EFFECT_INTERVENE                = 496
EFFECT_SOUL_ENSLAVEMENT         = 497
EFFECT_UNLEASH                  = 498
EFFECT_CLARION_CALL             = 499
EFFECT_OVERKILL                 = 500
EFFECT_YAEGASUMI                = 501
EFFECT_MIKAGE                   = 502
EFFECT_FLY_HIGH                 = 503
EFFECT_ASTRAL_CONDUIT           = 504
EFFECT_UNBRIDLED_WISDOM         = 505
-- EFFECT_NONE                      = 506
EFFECT_GRAND_PAS                = 507
EFFECT_WIDENED_COMPASS          = 508
EFFECT_ODYLLIC_SUBTERFUGE       = 509
EFFECT_ERGON_MIGHT              = 510
EFFECT_REIVE_MARK               = 511
EFFECT_IONIS                    = 512
EFFECT_BOLSTER                  = 513
-- EFFECT_NONE                      = 514
EFFECT_LASTING_EMANATION        = 515
EFFECT_ECLIPTIC_ATTRITION       = 516
EFFECT_COLLIMATED_FERVOR        = 517
EFFECT_DEMATERIALIZE            = 518
EFFECT_THEURGIC_FOCUS           = 519
-- EFFECT_NONE                      = 520
-- EFFECT_NONE                      = 521
EFFECT_ELEMENTAL_SFORZO         = 522
EFFECT_IGNIS                    = 523
EFFECT_GELUS                    = 524
EFFECT_FLABRA                   = 525
EFFECT_TELLUS                   = 526
EFFECT_SULPOR                   = 527
EFFECT_UNDA                     = 528
EFFECT_LUX                      = 529
EFFECT_TENEBRAE                 = 530
EFFECT_VALLATION                = 531
EFFECT_SWORDPLAY                = 532
EFFECT_PFLUG                    = 533
EFFECT_EMBOLDEN                 = 534
EFFECT_VALIANCE                 = 535
EFFECT_GAMBIT                   = 536
EFFECT_LIEMENT                  = 537
EFFECT_ONE_FOR_ALL              = 538
EFFECT_REGEN_II                 = 539
EFFECT_POISON_II                = 540
EFFECT_REFRESH_II               = 541
EFFECT_STR_BOOST_III            = 542
EFFECT_DEX_BOOST_III            = 543
EFFECT_VIT_BOOST_III            = 544
EFFECT_AGI_BOOST_III            = 545
EFFECT_INT_BOOST_III            = 546
EFFECT_MND_BOOST_III            = 547
EFFECT_CHR_BOOST_III            = 548
EFFECT_ATTACK_BOOST_II          = 549
EFFECT_DEFENSE_BOOST_II         = 550
EFFECT_MAGIC_ATK_BOOST_II       = 551
EFFECT_MAGIC_DEF_BOOST_II       = 552
EFFECT_ACCURACY_BOOST_II        = 553
EFFECT_EVASION_BOOST_II         = 554
EFFECT_MAGIC_ACC_BOOST_II       = 555
EFFECT_MAGIC_EVASION_BOOST_II   = 556
EFFECT_ATTACK_DOWN_II           = 557
EFFECT_DEFENSE_DOWN_II          = 558
EFFECT_MAGIC_ATK_DOWN_II        = 559
EFFECT_MAGIC_DEF_DOWN_II        = 560
EFFECT_ACCURACY_DOWN_II         = 561
EFFECT_EVASION_DOWN_II          = 562
EFFECT_MAGIC_ACC_DOWN_II        = 563
EFFECT_MAGIC_EVASION_DOWN_II    = 564
EFFECT_SLOW_II                  = 565
EFFECT_PARALYSIS_II             = 566
EFFECT_WEIGHT_II                = 567
EFFECT_FOIL                     = 568
EFFECT_BLAZE_OF_GLORY           = 569
EFFECT_BATTUTA                  = 570
EFFECT_RAYKE                    = 571
EFFECT_AVOIDANCE_DOWN           = 572
EFFECT_DELUGE_SPIKES            = 573 -- Exists in client, unused on retail?
EFFECT_FAST_CAST                = 574
EFFECT_GESTATION                = 575
EFFECT_DOUBT                    = 576 -- Bully: Intimidation Enfeeble status
EFFECT_CAIT_SITH_S_FAVOR        = 577
EFFECT_FISHY_INTUITION          = 578
EFFECT_COMMITMENT               = 579
EFFECT_HASTE_II                 = 580
EFFECT_FLURRY_II                = 581
EFFECT_APOGEE                   = 583

-- Effect icons in packet can go from 0-767, so no custom effects should go in that range.

-- Purchased from Cruor Prospector
EFFECT_ABYSSEA_STR              = 768
EFFECT_ABYSSEA_DEX              = 769
EFFECT_ABYSSEA_VIT              = 770
EFFECT_ABYSSEA_AGI              = 771
EFFECT_ABYSSEA_INT              = 772
EFFECT_ABYSSEA_MND              = 773
EFFECT_ABYSSEA_CHR              = 774
EFFECT_ABYSSEA_HP               = 775
EFFECT_ABYSSEA_MP               = 776

-- *Prowess increases not currently retail accurate.
-- GoV Prowess bonus effects, real effect at ID 474
EFFECT_PROWESS_CASKET_RATE      = 777 -- (Unimplemented)
EFFECT_PROWESS_SKILL_RATE       = 778 -- (Unimplemented)
EFFECT_PROWESS_CRYSTAL_YEILD    = 779 -- (Unimplemented)
EFFECT_PROWESS_TH               = 780 -- +1 per tier
EFFECT_PROWESS_ATTACK_SPEED     = 781 -- *flat 4% for now
EFFECT_PROWESS_HP_MP            = 782 -- Base 3% and another 1% per tier.
EFFECT_PROWESS_ACC_RACC         = 783 -- *flat 4% for now
EFFECT_PROWESS_ATT_RATT         = 784 -- *flat 4% for now
EFFECT_PROWESS_MACC_MATK        = 785 -- *flat 4% for now
EFFECT_PROWESS_CURE_POTENCY     = 786 -- *flat 4% for now
EFFECT_PROWESS_WS_DMG           = 787 -- (Unimplemented) 2% per tier.
EFFECT_PROWESS_KILLER           = 788 -- *flat +4 for now
-- End GoV Prowess fakery
EFFECT_FIELD_SUPPORT_FOOD       = 789 -- Used by Fov/GoV food buff.
EFFECT_MARK_OF_SEED             = 790 -- Tracks 30 min timer in ACP mission "Those Who Lurk in Shadows (II)"
EFFECT_ALL_MISS                 = 791
EFFECT_SUPER_BUFF               = 792
EFFECT_NINJUTSU_ELE_DEBUFF      = 793
EFFECT_HEALING                  = 794
EFFECT_LEAVEGAME                = 795
EFFECT_HASTE_SAMBA_HASTE        = 796
EFFECT_TELEPORT                 = 797
EFFECT_CHAINBOUND               = 798
EFFECT_SKILLCHAIN               = 799
EFFECT_DYNAMIS                  = 800
EFFECT_MEDITATE                 = 801 -- Dummy effect for SAM Meditate JA
-- EFFECT_PLACEHOLDER              = 802 -- Description
-- 802-1022
-- EFFECT_PLACEHOLDER             = 1023 -- The client dat file seems to have only this many "slots", results of exceeding that are untested.

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

------------------------------------

function removeSleepEffects(target)
    target:delStatusEffect(EFFECT_SLEEP_I);
    target:delStatusEffect(EFFECT_SLEEP_II);
    target:delStatusEffect(EFFECT_LULLABY);
end;

function hasSleepEffects(target)
    if (target:hasStatusEffect(EFFECT_SLEEP_I) or
        target:hasStatusEffect(EFFECT_SLEEP_II) or
        target:hasStatusEffect(EFFECT_LULLABY)) then
        return true;
    end
    return false;
end;

------------------------------------
-- These codes are the gateway to directly interacting with the pXI core program with status effects.
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
MOD_ACCP              = 64
MOD_EVAP              = 65
MOD_RATTP             = 66
MOD_RACCP             = 67
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
MOD_DMGRANGE          = 164
MOD_UDMGPHYS          = 387
MOD_UDMGBREATH        = 388
MOD_UDMGMAGIC         = 389
MOD_UDMGRANGE         = 390
MOD_CRITHITRATE       = 165
MOD_CRIT_DMG_INCREASE = 421
MOD_ENEMYCRITRATE     = 166
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
MOD_BLINK              = 299
MOD_STONESKIN          = 300
MOD_PHALANX            = 301
MOD_TRIPLE_ATTACK      = 302
MOD_TREASURE_HUNTER    = 303
MOD_TAME               = 304
MOD_RECYCLE            = 305
MOD_ZANSHIN            = 306
MOD_UTSUSEMI           = 307
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
MOD_BUST               = 332
MOD_FINISHING_MOVES    = 333
MOD_SAMBA_DURATION     = 490 -- Samba duration bonus
MOD_WALTZ_POTENTCY     = 491 -- Waltz Potentcy Bonus
MOD_CHOCO_JIG_DURATION = 492 -- Chocobo Jig duration bonus
MOD_VFLOURISH_MACC     = 493 -- Violent Flourish accuracy bonus
MOD_STEP_FINISH        = 494 -- Bonus finishing moves from steps
MOD_STEP_ACCURACY      = 403 -- Accuracy bonus for steps
MOD_SPECTRAL_JIG       = 495 -- Spectral Jig duration modifier (percent increase)
MOD_WALTZ_RECAST       = 497 -- Waltz recast modifier (percent)
MOD_SAMBA_PDURATION    = 498 -- Samba percent duration bonus
MOD_WIDESCAN           = 340
MOD_BARRAGE_ACC        = 420 --
MOD_ENSPELL            = 341
MOD_SPIKES             = 342
MOD_ENSPELL_DMG        = 343
MOD_SPIKES_DMG         = 344
MOD_TP_BONUS           = 345
MOD_PERPETUATION_REDUCTION = 346
MOD_FIRE_AFFINITY    = 347
MOD_EARTH_AFFINITY   = 348
MOD_WATER_AFFINITY   = 349
MOD_ICE_AFFINITY     = 350
MOD_THUNDER_AFFINITY = 351
MOD_WIND_AFFINITY    = 352
MOD_LIGHT_AFFINITY   = 353
MOD_DARK_AFFINITY    = 354
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
MOD_REGEN_EFFECT        = 338
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
MOD_NULL_PHYSICAL_DAMAGE     = 416 -- Chance to null physical damage.
MOD_QUICK_DRAW_TRIPLE_DAMAGE = 417 -- Chance to do triple damage with quick draw.
MOD_BAR_ELEMENT_NULL_CHANCE  = 418 -- Bar Elemental spells will occasionally nullify damage of the same element.
MOD_GRIMOIRE_INSTANT_CAST    = 419 -- Spells that match your current Arts will occasionally cast instantly, without recast.

MOD_DOUBLE_SHOT_RATE          = 422 -- The rate that double shot can proc
MOD_VELOCITY_SNAPSHOT_BONUS   = 423 -- Increases Snapshot whilst Velocity Shot is up.
MOD_VELOCITY_RATT_BONUS       = 424 -- Increases Ranged Attack whilst Velocity Shot is up.
MOD_SHADOW_BIND_EXT           = 425 -- Extends the time of shadowbind
MOD_ABSORB_PHYSDMG_TO_MP      = 426 -- Absorbs a percentage of physical damage taken to MP.
MOD_ENMITY_REDUCTION_PHYSICAL = 427 -- Reduces Enmity decrease when taking physical damage
MOD_SHIELD_MASTERY_TP         = 485 -- Shield mastery TP bonus when blocking with a shield
MOD_PERFECT_COUNTER_ATT       = 428 -- Raises weapon damage by 20 when countering while under the Perfect Counter effect. This also affects Weapon Rank (though not if fighting barehanded).
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

MOD_FIRE_ABSORB  = 459 --
MOD_EARTH_ABSORB = 460 --
MOD_WATER_ABSORB = 461 --
MOD_WIND_ABSORB  = 462 --
MOD_ICE_ABSORB   = 463 --
MOD_LTNG_ABSORB  = 464 --
MOD_LIGHT_ABSORB = 465 --
MOD_DARK_ABSORB  = 466 --

MOD_FIRE_NULL  = 467 --
MOD_EARTH_NULL = 468 --
MOD_WATER_NULL = 469 --
MOD_WIND_NULL  = 470 --
MOD_ICE_NULL   = 471 --
MOD_LTNG_NULL  = 472 --
MOD_LIGHT_NULL = 473 --
MOD_DARK_NULL  = 474 --

MOD_MAGIC_ABSORB     = 475 --
MOD_MAGIC_NULL       = 476 --
MOD_PHYS_ABSORB      = 512 --
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
MOD_EXTRA_DMG_CHANCE    = 506 -- Proc rate of MOD_OCC_DO_EXTRA_DMG. 111 would be 11.1%
MOD_OCC_DO_EXTRA_DMG    = 507 -- Multiplier for "Occasionally do x times normal damage". 250 would be 2.5 times damage.

MOD_EAT_RAW_FISH       = 412 --
MOD_EAT_RAW_MEAT       = 413 --
MOD_ENHANCES_CURSNA    = 310 -- Raises success rate of Cursna when removing effect (like Doom) that are not 100% chance to remove
MOD_RETALIATION        = 414 -- Increases damage of Retaliation hits
MOD_AUGMENTS_THIRD_EYE = 508 -- Adds counter to 3rd eye anticipates & if using Seigan counter rate is increased by 15%

MOD_CLAMMING_IMPROVED_RESULTS  = 509 --
MOD_CLAMMING_REDUCED_INCIDENTS = 510 --
MOD_CHOCOBO_RIDING_TIME = 511 -- Increases chocobo riding time
MOD_HARVESTING_RESULT   = 513 -- Improves harvesting results
MOD_LOGGING_RESULT      = 514 -- Improves logging results
MOD_MINNING_RESULT      = 515 -- Improves mining results
MOD_EGGHELM             = 517 -- Egg Helm (Chocobo Digging)

MOD_SHIELDBLOCKRATE           = 518 -- Affects shield block rate, percent based
MOD_SCAVENGE_EFFECT           = 312 --
MOD_DIA_DOT                   = 313 -- Increases the DoT damage of Dia
MOD_SHARPSHOT                 = 314 -- Sharpshot accuracy bonus
MOD_ENH_DRAIN_ASPIR           = 315 -- % damage boost to Drain and Aspir
MOD_TRICK_ATK_AGI             = 520 -- % AGI boost to Trick Attack (if gear mod, needs to be equipped on hit)
MOD_NIN_NUKE_BONUS            = 522 -- magic attack bonus for NIN nukes
MOD_AMMO_SWING                = 523 -- Extra swing rate w/ ammo (ie. Jailer weapons). Use gearsets, and does nothing for non-players.
MOD_ROLL_RANGE                = 528 -- Additional range for COR roll abilities.
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
MOD_JOB_BONUS_CHANCE          = 542 --  Chance to apply job bonus to COR roll without having the job in the party.

-- Mythic Weapon Mods
MOD_AUGMENTS_ABSORB    = 521 -- Direct Absorb spell increase while Liberator is equipped (percentage based)
MOD_AOE_NA             = 524 -- Set to 1 to make -na spells/erase always AoE w/ Divine Veil
MOD_AUGMENTS_CONVERT   = 525 -- Convert HP to MP Ratio Multiplier. Value = MP multiplier rate.
MOD_AUGMENTS_SA        = 526 -- Adds Critical Attack Bonus to Sneak Attack, percentage based.
MOD_AUGMENTS_TA        = 527 -- Adds Critical Attack Bonus to Trick Attack, percentage based.

-- The entire mod list is in desperate need of kind of some organizing.
-- The spares take care of finding the next ID to use so long as we don't forget to list IDs that have been freed up by refactoring.

-- MOD_SPARE = 92, -- stuff
-- MOD_SPARE = 93, -- stuff
-- MOD_SPARE = 94, -- stuff
-- MOD_SPARE = 95, -- stuff
-- MOD_SPARE = 96, -- stuff
-- MOD_SPARE = 97, -- stuff
-- MOD_SPARE = 98, -- stuff
-- MOD_SPARE = 99, -- stuff
-- MOD_SPARE = 100, -- stuff
-- MOD_SPARE = 543, -- stuff
-- MOD_SPARE = 544, -- stuff

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

--HP
MERIT_MAX_HP = MCATEGORY_HP_MP + 0x00
MERIT_MAX_MP = MCATEGORY_HP_MP + 0x02

--ATTRIBUTES
MERIT_STR = MCATEGORY_ATTRIBUTES + 0x00
MERIT_DEX = MCATEGORY_ATTRIBUTES + 0x02
MERIT_VIT = MCATEGORY_ATTRIBUTES + 0x04
MERIT_AGI = MCATEGORY_ATTRIBUTES + 0x08
MERIT_INT = MCATEGORY_ATTRIBUTES + 0x0A
MERIT_MND = MCATEGORY_ATTRIBUTES + 0x0C
MERIT_CHR = MCATEGORY_ATTRIBUTES + 0x0E

--COMBAT SKILLS
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

--MAGIC SKILLS
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

--OTHERS
MERIT_ENMITY_INCREASE        = MCATEGORY_OTHERS + 0x00
MERIT_ENMITY_DECREASE        = MCATEGORY_OTHERS + 0x02
MERIT_CRIT_HIT_RATE          = MCATEGORY_OTHERS + 0x04
MERIT_ENEMY_CRIT_RATE        = MCATEGORY_OTHERS + 0x06
MERIT_SPELL_INTERUPTION_RATE = MCATEGORY_OTHERS + 0x08

--WAR 1
MERIT_BERSERK_RECAST     = MCATEGORY_WAR_1 + 0x00
MERIT_DEFENDER_RECAST    = MCATEGORY_WAR_1 + 0x02
MERIT_WARCRY_RECAST      = MCATEGORY_WAR_1 + 0x04
MERIT_AGGRESSOR_RECAST   = MCATEGORY_WAR_1 + 0x06
MERIT_DOUBLE_ATTACK_RATE = MCATEGORY_WAR_1 + 0x08

--MNK 1
MERIT_FOCUS_RECAST     = MCATEGORY_MNK_1 + 0x00
MERIT_DODGE_RECAST     = MCATEGORY_MNK_1 + 0x02
MERIT_CHAKRA_RECAST    = MCATEGORY_MNK_1 + 0x04
MERIT_COUNTER_RATE     = MCATEGORY_MNK_1 + 0x06
MERIT_KICK_ATTACK_RATE = MCATEGORY_MNK_1 + 0x08

--WHM 1
MERIT_DIVINE_SEAL_RECAST = MCATEGORY_WHM_1 + 0x00
MERIT_CURE_CAST_TIME     = MCATEGORY_WHM_1 + 0x02
MERIT_BAR_SPELL_EFFECT   = MCATEGORY_WHM_1 + 0x04
MERIT_BANISH_EFFECT      = MCATEGORY_WHM_1 + 0x06
MERIT_REGEN_EFFECT       = MCATEGORY_WHM_1 + 0x08

--BLM 1
MERIT_ELEMENTAL_SEAL_RECAST   = MCATEGORY_BLM_1 + 0x00
MERIT_FIRE_MAGIC_POTENCY      = MCATEGORY_BLM_1 + 0x02
MERIT_ICE_MAGIC_POTENCY       = MCATEGORY_BLM_1 + 0x04
MERIT_WIND_MAGIC_POTENCY      = MCATEGORY_BLM_1 + 0x06
MERIT_EARTH_MAGIC_POTENCY     = MCATEGORY_BLM_1 + 0x08
MERIT_LIGHTNING_MAGIC_POTENCY = MCATEGORY_BLM_1 + 0x0A
MERIT_WATER_MAGIC_POTENCY     = MCATEGORY_BLM_1 + 0x0C

--RDM 1
MERIT_CONVERT_RECAST           = MCATEGORY_RDM_1 + 0x00
MERIT_FIRE_MAGIC_ACCURACY      = MCATEGORY_RDM_1 + 0x02
MERIT_ICE_MAGIC_ACCURACY       = MCATEGORY_RDM_1 + 0x04
MERIT_WIND_MAGIC_ACCURACY      = MCATEGORY_RDM_1 + 0x06
MERIT_EARTH_MAGIC_ACCURACY     = MCATEGORY_RDM_1 + 0x08
MERIT_LIGHTNING_MAGIC_ACCURACY = MCATEGORY_RDM_1 + 0x0A
MERIT_WATER_MAGIC_ACCURACY     = MCATEGORY_RDM_1 + 0x0C

--THF 1
MERIT_FLEE_RECAST         = MCATEGORY_THF_1 + 0x00
MERIT_HIDE_RECAST         = MCATEGORY_THF_1 + 0x02
MERIT_SNEAK_ATTACK_RECAST = MCATEGORY_THF_1 + 0x04
MERIT_TRICK_ATTACK_RECAST = MCATEGORY_THF_1 + 0x06
MERIT_TRIPLE_ATTACK_RATE  = MCATEGORY_THF_1 + 0x08

--PLD 1
MERIT_SHIELD_BASH_RECAST  = MCATEGORY_PLD_1 + 0x00
MERIT_HOLY_CIRCLE_RECAST  = MCATEGORY_PLD_1 + 0x02
MERIT_SENTINEL_RECAST     = MCATEGORY_PLD_1 + 0x04
MERIT_COVER_EFFECT_LENGTH = MCATEGORY_PLD_1 + 0x06
MERIT_RAMPART_RECAST      = MCATEGORY_PLD_1 + 0x08

--DRK 1
MERIT_SOULEATER_RECAST     = MCATEGORY_DRK_1 + 0x00
MERIT_ARCANE_CIRCLE_RECAST = MCATEGORY_DRK_1 + 0x02
MERIT_LAST_RESORT_RECAST   = MCATEGORY_DRK_1 + 0x04
MERIT_LAST_RESORT_EFFECT   = MCATEGORY_DRK_1 + 0x06
MERIT_WEAPON_BASH_EFFECT   = MCATEGORY_DRK_1 + 0x08

--BST 1
MERIT_KILLER_EFFECTS    = MCATEGORY_BST_1 + 0x00
MERIT_REWARD_RECAST     = MCATEGORY_BST_1 + 0x02
MERIT_CALL_BEAST_RECAST = MCATEGORY_BST_1 + 0x04
MERIT_SIC_RECAST        = MCATEGORY_BST_1 + 0x06
MERIT_TAME_RECAST       = MCATEGORY_BST_1 + 0x08

--BRD 1
MERIT_LULLABY_RECAST  = MCATEGORY_BRD_1 + 0x00
MERIT_FINALE_RECAST   = MCATEGORY_BRD_1 + 0x02
MERIT_MINNE_EFFECT    = MCATEGORY_BRD_1 + 0x04
MERIT_MINUET_EFFECT   = MCATEGORY_BRD_1 + 0x06
MERIT_MADRIGAL_EFFECT = MCATEGORY_BRD_1 + 0x08

--RNG 1
MERIT_SCAVENGE_EFFECT       = MCATEGORY_RNG_1 + 0x00
MERIT_CAMOUFLAGE_RECAST     = MCATEGORY_RNG_1 + 0x02
MERIT_SHARPSHOT_RECAST      = MCATEGORY_RNG_1 + 0x04
MERIT_UNLIMITED_SHOT_RECAST = MCATEGORY_RNG_1 + 0x06
MERIT_RAPID_SHOT_RATE       = MCATEGORY_RNG_1 + 0x08

--SAM 1
MERIT_THIRD_EYE_RECAST      = MCATEGORY_SAM_1 + 0x00
MERIT_WARDING_CIRCLE_RECAST = MCATEGORY_SAM_1 + 0x02
MERIT_STORE_TP_EFFECT       = MCATEGORY_SAM_1 + 0x04
MERIT_MEDITATE_RECAST       = MCATEGORY_SAM_1 + 0x06
MERIT_ZASHIN_ATTACK_RATE    = MCATEGORY_SAM_1 + 0x08

--NIN 1
MERIT_SUBTLE_BLOW_EFFECT = MCATEGORY_NIN_1 + 0x00
MERIT_KATON_EFFECT       = MCATEGORY_NIN_1 + 0x02
MERIT_HYOTON_EFFECT      = MCATEGORY_NIN_1 + 0x04
MERIT_HUTON_EFFECT       = MCATEGORY_NIN_1 + 0x06
MERIT_DOTON_EFFECT       = MCATEGORY_NIN_1 + 0x08
MERIT_RAITON_EFFECT      = MCATEGORY_NIN_1 + 0x0A
MERIT_SUITON_EFFECT      = MCATEGORY_NIN_1 + 0x0C

--DRG 1
MERIT_ANCIENT_CIRCLE_RECAST = MCATEGORY_DRG_1 + 0x00
MERIT_JUMP_RECAST           = MCATEGORY_DRG_1 + 0x02
MERIT_HIGH_JUMP_RECAST      = MCATEGORY_DRG_1 + 0x04
MERIT_SUPER_JUMP_RECAST     = MCATEGORY_DRG_1 + 0x05
MERIT_SPIRIT_LINK_RECAST    = MCATEGORY_DRG_1 + 0x08

--SMN 1
MERIT_AVATAR_PHYSICAL_ACCURACY  = MCATEGORY_SMN_1 + 0x00
MERIT_AVATAR_PHYSICAL_ATTACK    = MCATEGORY_SMN_1 + 0x02
MERIT_AVATAR_MAGICAL_ACCURACY   = MCATEGORY_SMN_1 + 0x04
MERIT_AVATAR_MAGICAL_ATTACK     = MCATEGORY_SMN_1 + 0x06
MERIT_SUMMONING_MAGIC_CAST_TIME = MCATEGORY_SMN_1 + 0x08

--BLU 1
MERIT_CHAIN_AFFINITY_RECAST = MCATEGORY_BLU_1 + 0x00
MERIT_BURST_AFFINITY_RECAST = MCATEGORY_BLU_1 + 0x02
MERIT_MONSTER_CORRELATION   = MCATEGORY_BLU_1 + 0x04
MERIT_PHYSICAL_POTENCY      = MCATEGORY_BLU_1 + 0x06
MERIT_MAGICAL_ACCURACY      = MCATEGORY_BLU_1 + 0x08

--COR 1
MERIT_PHANTOM_ROLL_RECAST = MCATEGORY_COR_1 + 0x00
MERIT_QUICK_DRAW_RECAST   = MCATEGORY_COR_1 + 0x02
MERIT_QUICK_DRAW_ACCURACY = MCATEGORY_COR_1 + 0x04
MERIT_RANDOM_DEAL_RECAST  = MCATEGORY_COR_1 + 0x06
MERIT_BUST_DURATION       = MCATEGORY_COR_1 + 0x08

--PUP 1
MERIT_AUTOMATION_MELEE_SKILL  = MCATEGORY_PUP_1 + 0x00
MERIT_AUTOMATION_RANGED_SKILL = MCATEGORY_PUP_1 + 0x02
MERIT_AUTOMATION_MAGIC_SKILL  = MCATEGORY_PUP_1 + 0x04
MERIT_ACTIVATE_RECAST         = MCATEGORY_PUP_1 + 0x06
MERIT_REPAIR_RECAST           = MCATEGORY_PUP_1 + 0x08

--DNC 1
MERIT_STEP_ACCURACY            = MCATEGORY_DNC_1 + 0x00
MERIT_HASTE_SAMBA_EFFECT       = MCATEGORY_DNC_1 + 0x02
MERIT_REVERSE_FLOURISH_EFFECT  = MCATEGORY_DNC_1 + 0x04
MERIT_BUILDING_FLOURISH_EFFECT = MCATEGORY_DNC_1 + 0x06

--SCH 1
MERIT_GRIMOIRE_RECAST        = MCATEGORY_SCH_1 + 0x00
MERIT_MODUS_VERITAS_DURATION = MCATEGORY_SCH_1 + 0x02
MERIT_HELIX_MAGIC_ACC_ATT    = MCATEGORY_SCH_1 + 0x04
MERIT_MAX_SUBLIMATION        = MCATEGORY_SCH_1 + 0x06

--WEAPON SKILLS
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
--MERIT_UNKNOWN1 = MCATEGORY_UNK_0 + 0x00
--MERIT_UNKNOWN2 = MCATEGORY_UNK_1 + 0x00
--MERIT_UNKNOWN3 = MCATEGORY_UNK_2 + 0x00
--MERIT_UNKNOWN4 = MCATEGORY_UNK_3 + 0x00
--MERIT_UNKNOWN5 = MCATEGORY_UNK_4 + 0x00

--WAR 2
MERIT_WARRIORS_CHARGE = MCATEGORY_WAR_2 + 0x00
MERIT_TOMAHAWK        = MCATEGORY_WAR_2 + 0x02
MERIT_SAVAGERY        = MCATEGORY_WAR_2 + 0x04
MERIT_AGGRESSIVE_AIM  = MCATEGORY_WAR_2 + 0x06

--MNK 2
MERIT_MANTRA           = MCATEGORY_MNK_2 + 0x00
MERIT_FORMLESS_STRIKES = MCATEGORY_MNK_2 + 0x02
MERIT_INVIGORATE       = MCATEGORY_MNK_2 + 0x04
MERIT_PENANCE          = MCATEGORY_MNK_2 + 0x06

--WHM 2
MERIT_MARTYR      = MCATEGORY_WHM_2 + 0x00
MERIT_DEVOTION    = MCATEGORY_WHM_2 + 0x02
MERIT_PROTECTRA_V = MCATEGORY_WHM_2 + 0x04
MERIT_SHELLRA_V   = MCATEGORY_WHM_2 + 0x06

--BLM 2
MERIT_FLARE_II   = MCATEGORY_BLM_2 + 0x00
MERIT_FREEZE_II  = MCATEGORY_BLM_2 + 0x02
MERIT_TORNADO_II = MCATEGORY_BLM_2 + 0x04
MERIT_QUAKE_II   = MCATEGORY_BLM_2 + 0x06
MERIT_BURST_II   = MCATEGORY_BLM_2 + 0x08
MERIT_FLOOD_II   = MCATEGORY_BLM_2 + 0x0A

--RDM 2
MERIT_DIA_III     = MCATEGORY_RDM_2 + 0x00
MERIT_SLOW_II     = MCATEGORY_RDM_2 + 0x02
MERIT_PARALYZE_II = MCATEGORY_RDM_2 + 0x04
MERIT_PHALANX_II  = MCATEGORY_RDM_2 + 0x06
MERIT_BIO_III     = MCATEGORY_RDM_2 + 0x08
MERIT_BLIND_II    = MCATEGORY_RDM_2 + 0x0A

--THF 2
MERIT_ASSASSINS_CHARGE = MCATEGORY_THF_2 + 0x00
MERIT_FEINT            = MCATEGORY_THF_2 + 0x02
MERIT_AURA_STEAL       = MCATEGORY_THF_2 + 0x04
MERIT_AMBUSH           = MCATEGORY_THF_2 + 0x06

--PLD 2
MERIT_FEALTY    = MCATEGORY_PLD_2 + 0x00
MERIT_CHIVALRY  = MCATEGORY_PLD_2 + 0x02
MERIT_IRON_WILL = MCATEGORY_PLD_2 + 0x04
MERIT_GUARDIAN  = MCATEGORY_PLD_2 + 0x06

--DRK 2
MERIT_DARK_SEAL       = MCATEGORY_DRK_2 + 0x00
MERIT_DIABOLIC_EYE    = MCATEGORY_DRK_2 + 0x02
MERIT_MUTED_SOUL      = MCATEGORY_DRK_2 + 0x04
MERIT_DESPERATE_BLOWS = MCATEGORY_DRK_2 + 0x06

--BST 2
MERIT_FERAL_HOWL      = MCATEGORY_BST_2 + 0x00
MERIT_KILLER_INSTINCT = MCATEGORY_BST_2 + 0x02
MERIT_BEAST_AFFINITY  = MCATEGORY_BST_2 + 0x04
MERIT_BEAST_HEALER    = MCATEGORY_BST_2 + 0x06

--BRD 2
MERIT_NIGHTINGALE       = MCATEGORY_BRD_2 + 0x00
MERIT_TROUBADOUR        = MCATEGORY_BRD_2 + 0x02
MERIT_FOE_SIRVENTE      = MCATEGORY_BRD_2 + 0x04
MERIT_ADVENTURERS_DIRGE = MCATEGORY_BRD_2 + 0x06

--RNG 2
MERIT_STEALTH_SHOT = MCATEGORY_RNG_2 + 0x00
MERIT_FLASHY_SHOT  = MCATEGORY_RNG_2 + 0x02
MERIT_SNAPSHOT     = MCATEGORY_RNG_2 + 0x04
MERIT_RECYCLE      = MCATEGORY_RNG_2 + 0x06

--SAM 2
MERIT_SHIKIKOYO  = MCATEGORY_SAM_2 + 0x00
MERIT_BLADE_BASH = MCATEGORY_SAM_2 + 0x02
MERIT_IKISHOTEN  = MCATEGORY_SAM_2 + 0x04
MERIT_OVERWHELM  = MCATEGORY_SAM_2 + 0x06

--NIN 2
MERIT_SANGE                = MCATEGORY_NIN_2 + 0x00
MERIT_NINJA_TOOL_EXPERTISE = MCATEGORY_NIN_2 + 0x02
MERIT_KATON_SAN            = MCATEGORY_NIN_2 + 0x04
MERIT_HYOTON_SAN           = MCATEGORY_NIN_2 + 0x06
MERIT_HUTON_SAN            = MCATEGORY_NIN_2 + 0x08
MERIT_DOTON_SAN            = MCATEGORY_NIN_2 + 0x0A
MERIT_RAITON_SAN           = MCATEGORY_NIN_2 + 0x0C
MERIT_SUITON_SAN           = MCATEGORY_NIN_2 + 0x0E

--DRG 2
MERIT_DEEP_BREATHING = MCATEGORY_DRG_2 + 0x00
MERIT_ANGON          = MCATEGORY_DRG_2 + 0x02
MERIT_EMPATHY        = MCATEGORY_DRG_2 + 0x04
MERIT_STRAFE         = MCATEGORY_DRG_2 + 0x06

--SMN 2
MERIT_METEOR_STRIKE   = MCATEGORY_SMN_2 + 0x00
MERIT_HEAVENLY_STRIKE = MCATEGORY_SMN_2 + 0x02
MERIT_WIND_BLADE      = MCATEGORY_SMN_2 + 0x04
MERIT_GEOCRUSH        = MCATEGORY_SMN_2 + 0x06
MERIT_THUNDERSTORM    = MCATEGORY_SMN_2 + 0x08
MERIT_GRANDFALL       = MCATEGORY_SMN_2 + 0x0A

--BLU 2
MERIT_CONVERGENCE  = MCATEGORY_BLU_2 + 0x00
MERIT_DIFFUSION    = MCATEGORY_BLU_2 + 0x02
MERIT_ENCHAINMENT  = MCATEGORY_BLU_2 + 0x04
MERIT_ASSIMILATION = MCATEGORY_BLU_2 + 0x06

--COR 2
MERIT_SNAKE_EYE      = MCATEGORY_COR_2 + 0x00
MERIT_FOLD           = MCATEGORY_COR_2 + 0x02
MERIT_WINNING_STREAK = MCATEGORY_COR_2 + 0x04
MERIT_LOADED_DECK    = MCATEGORY_COR_2 + 0x06

--PUP 2
MERIT_ROLE_REVERSAL = MCATEGORY_PUP_2 + 0x00
MERIT_VENTRILOQUY   = MCATEGORY_PUP_2 + 0x02
MERIT_FINE_TUNING   = MCATEGORY_PUP_2 + 0x04
MERIT_OPTIMIZATION  = MCATEGORY_PUP_2 + 0x06

--DNC 2
MERIT_SABER_DANCE     = MCATEGORY_DNC_2 + 0x00
MERIT_FAN_DANCE       = MCATEGORY_DNC_2 + 0x02
MERIT_NO_FOOT_RISE    = MCATEGORY_DNC_2 + 0x04
MERIT_CLOSED_POSITION = MCATEGORY_DNC_2 + 0x06

--SCH 2
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

LOC_INVENTORY  = 0
LOC_MOGSAFE    = 1
LOC_STORAGE    = 2
LOC_TEMPITEMS  = 3
LOC_MOGLOCKER  = 4
LOC_MOGSATCHEL = 5
LOC_MOGSACK    = 6

------------------------------------
-- Message enum
------------------------------------

MSGBASIC_DEFEATS_TARG           = 6 -- The <player> defeats <target>.
MSGBASIC_ALREADY_CLAIMED        = 12 -- Cannot attack. Your target is already claimed.
MSGBASIC_IS_INTERRUPTED         = 16 -- The <player>'s casting is interrupted.
MSGBASIC_UNABLE_TO_CAST         = 18 -- Unable to cast spells at this time.
MSGBASIC_CANNOT_PERFORM         = 71 -- The <player> cannot perform that action.
MSGBASIC_CANNOT_PERFORM_TARG    = 72 -- That action cannot be performed on <target>.
MSGBASIC_UNABLE_TO_USE_JA       = 87 -- Unable to use job ability.
MSGBASIC_UNABLE_TO_USE_JA2      = 88 -- Unable to use job ability.
MSGBASIC_IS_PARALYZED           = 29 -- The <player> is paralyzed.
MSGBASIC_SHADOW_ABSORB          = 31 -- .. of <target>'s shadows absorb the damage and disappear.
MSGBASIC_NOT_ENOUGH_MP          = 34 -- The <player> does not have enough MP to cast (NULL).
MSGBASIC_NO_NINJA_TOOLS         = 35 -- The <player> lacks the ninja tools to cast (NULL).
MSGBASIC_UNABLE_TO_CAST_SPELLS  = 49 -- The <player> is unable to cast spells.
MSGBASIC_WAIT_LONGER            = 94 -- You must wait longer to perform that action.
MSGBASIC_USES_JA                = 100 -- The <player> uses ..
MSGBASIC_USES_JA2               = 101 -- The <player> uses ..
MSGBASIC_USES_RECOVERS_HP       = 102 -- The <player> uses .. <target> recovers .. HP.
MSGBASIC_USES_JA_TAKE_DAMAGE    = 317 -- The <player> uses .. <target> takes .. points of damage.
MSGBASIC_IS_INTIMIDATED         = 106 -- The <player> is intimidated by <target>'s presence.
MSGBASIC_CANNOT_ON_THAT_TARG    = 155 -- You cannot perform that action on the specified target.
MSGBASIC_CANNOT_ATTACK_TARGET   = 446 -- You cannot attack that target
MSGBASIC_NEEDS_2H_WEAPON        = 307 -- That action requires a two-handed weapon.
MSGBASIC_USES_BUT_MISSES        = 324 -- The <player> uses .. but misses <target>.
MSGBASIC_CANT_BE_USED_IN_AREA   = 316 -- That action cannot be used in this area.
MSGBASIC_REQUIRES_SHIELD        = 199 -- That action requires a shield.
MSGBASIC_REQUIRES_COMBAT        = 525 -- .. can only be performed during battle.
MSGBASIC_STATUS_PREVENTS        = 569 -- Your current status prevents you from using that ability.

-- Distance
MSGBASIC_TARG_OUT_OF_RANGE      = 4 -- <target> is out of range.
MSGBASIC_UNABLE_TO_SEE_TARG     = 5 -- Unable to see <target>.
MSGBASIC_LOSE_SIGHT             = 36 -- You lose sight of <target>.
MSGBASIC_TOO_FAR_AWAY           = 78 -- <target> is too far away.

-- Weaponskills
MSGBASIC_CANNOT_USE_WS          = 190 -- The <player> cannot use that weapon ability.
MSGBASIC_NOT_ENOUGH_TP          = 192 -- The <player> does not have enough TP.

-- Pets
MSGBASIC_REQUIRES_A_PET         = 215 -- That action requires a pet.
MSGBASIC_THAT_SOMEONES_PET      = 235 -- That is someone's pet.
MSGBASIC_ALREADY_HAS_A_PET      = 315 -- The <player> already has a pet.
MSGBASIC_NO_EFFECT_ON_PET       = 336 -- No effect on that pet.
MSGBASIC_NO_JUG_PET_ITEM        = 337 -- You do not have the necessary item equipped to call a beast.
MSGBASIC_MUST_HAVE_FOOD         = 347 -- You must have pet food equipped to use that command.
MSGBASIC_PET_CANNOT_DO_ACTION   = 574 -- <player>'s pet is currently unable to perform that action.
MSGBASIC_PET_NOT_ENOUGH_TP      = 575 -- <player>'s pet does not have enough TP to perform that action.

-- Items
MSGBASIC_CANNOT_USE_ITEM_ON     = 92  -- Cannot use the <item> on <target>.
MSGBASIC_ITEM_FAILS_TO_ACTIVATE = 62  -- The <item> fails to activate.
MSGBASIC_FULL_INVENTORY         = 356 --  Cannot execute command. Your inventory is full.

-- Ranged
MSGBASIC_NO_RANGED_WEAPON       = 216 -- You do not have an appropriate ranged weapon equipped.
MSGBASIC_CANNOT_SEE             = 217 -- You cannot see <target>.
MSGBASIC_MOVE_AND_INTERRUPT     = 218 -- You move and interrupt your aim.

-- Additional effects and spike effects
MSGBASIC_ADD_EFFECT_STATUS      = 160 -- Additional effect: <Status Effect>.
MSGBASIC_ADD_EFFECT_HP_DRAIN    = 161 -- Additional effect: <number> HP drained from <target>.
MSGBASIC_ADD_EFFECT_MP_DRAIN    = 162 -- Additional effect: <number> MP drained from <target>.
MSGBASIC_ADD_EFFECT_DMG         = 163 -- Additional effect: <number> points of damage.
MSGBASIC_ADD_EFFECT_STATUS2     = 164 -- Additional effect: <Status Effect>. (Duplicate?)
MSGBASIC_ADD_EFFECT_TP_DRAIN    = 165 -- Additional effect: <number> TP drained from <target>.
MSGBASIC_ADD_EFFECT_STATUS3     = 166 -- Additional effect: The <target> gains the effect of <Status Effect>. (Only difference from 160 and 164 is "The")
MSGBASIC_ADD_EFFECT_HEAL        = 167 -- Additional effect: The <target> recovers <number> HP. (used when target absorbs element)
MSGBASIC_ADD_EFFECT_DISPEL      = 168 -- Additional effect: <target>'s KO effect disappears!
MSGBASIC_ADD_EFFECT_WARP        = 169 -- Additional effect: Warp! (used by holloween staves)

-- Charm
MSGBASIC_CANNOT_CHARM           = 210 -- The <player> cannot charm <target>!
MSGBASIC_VERY_DIFFICULT_CHARM   = 211 -- It would be very difficult for the <player> to charm <target>.
MSGBASIC_DIFFICULT_TO_CHARM     = 212 -- It would be difficult for the <player> to charm <target>.
MSGBASIC_MIGHT_BE_ABLE_CHARM    = 213 -- The <player> might be able to charm <target>.
MSGBASIC_SHOULD_BE_ABLE_CHARM   = 214 -- The <player> should be able to charm <target>.

-- BLU
MSGBASIC_LEARNS_SPELL           = 419 -- <target> learns (NULL)!

-- COR
MSGBASIC_ROLL_MAIN              = 420 -- The <player> uses .. The total comes to ..! <target> receives the effect of ..
MSGBASIC_ROLL_SUB               = 421 -- <target> receives the effect of ..
MSGBASIC_ROLL_MAIN_FAIL         = 422 -- The <player> uses .. The total comes to ..! No effect on <target>.
MSGBASIC_ROLL_SUB_FAIL          = 423 -- No effect on <target>.
MSGBASIC_DOUBLEUP               = 424 -- The <player> uses Double-Up. The total for . increases to ..! <target> receives the effect of ..
MSGBASIC_DOUBLEUP_FAIL          = 425 -- The <player> uses Double-Up. The total for . increases to ..! No effect on <target>.
MSGBASIC_DOUBLEUP_BUST          = 426 -- The <player> uses Double-Up. Bust! <target> loses the effect of ..
MSGBASIC_DOUBLEUP_BUST_SUB      = 427 -- <target> loses the effect of ..
MSGBASIC_NO_ELIGIBLE_ROLL       = 428 -- There are no rolls eligible for Double-Up. Unable to use ability.
MSGBASIC_ROLL_ALREADY_ACTIVE    = 429 -- The same roll is already active on the <player>.

MSGBASIC_EFFECT_ALREADY_ACTIVE  = 523 -- The same effect is already active on <player>.
MSGBASIC_NO_FINISHINGMOVES      = 524 -- You have not earned enough finishing moves to perform that action.

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
MOBMOD_VAR            = 18 -- Used by funguar to track skill uses.
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
MOBMOD_STANDBACK_TIME = 35
MOBMOD_ROAM_COOL      = 36
MOBMOD_ALWAYS_AGGRO   = 37
MOBMOD_NO_DROPS       = 38 -- If set monster cannot drop any items, not even seals.
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

SPELLFLAG_NONE    = 0;
SPELLFLAG_HIT_ALL = 1; -- hit all targets in range regardless of party

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

ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK = 1;
ELEVATOR_PORT_BASTOK_DRWBRDG       = 2;
ELEVATOR_DAVOI_LIFT                = 3;
ELEVATOR_PALBOROUGH_MINES_LIFT     = 4;
