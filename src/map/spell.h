﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _CSPELL_H
#define _CSPELL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "entities/battleentity.h"
#include "entities/charentity.h"

#define CANNOT_USE_SPELL    0

enum SPELLGROUP
{
    SPELLGROUP_NONE      = 0,
    SPELLGROUP_SONG      = 1,
    SPELLGROUP_BLACK     = 2,
    SPELLGROUP_BLUE      = 3,
    SPELLGROUP_NINJUTSU  = 4,
    SPELLGROUP_SUMMONING = 5,
    SPELLGROUP_WHITE     = 6,
    SPELLGROUP_GEOMANCY  = 7,
    SPELLGROUP_TRUST     = 8
};

enum SPELLREQ
{
    SPELLCASTTYPE_NORMAL    = 0x00,
    SPELLREQ_MERIT          = 0x01,
    SPELLREQ_ADDENDUM_BLACK = 0x02,
    SPELLREQ_ADDENDUM_WHITE = 0x04,
    SPELLREQ_TABULA_RASA    = 0x08,
    SPELLREQ_UNBRIDLED_LEARNING = 0x10
};

enum SPELLAOE
{
    SPELLAOE_NONE           = 0,
    SPELLAOE_RADIAL         = 1,
    SPELLAOE_CONAL          = 2,
    SPELLAOE_RADIAL_MANI    = 3,  //AOE when under SCH stratagem Manifestation
    SPELLAOE_RADIAL_ACCE    = 4,  //AOE when under SCH stratagem Accession
    SPELLAOE_PIANISSIMO     = 5,  //Single target when under BRD JA Pianissimo
    SPELLAOE_DIFFUSION      = 6   //AOE when under Diffusion
};

enum SPELLFLAG
{
    SPELLFLAG_NONE          = 0x00,
    SPELLFLAG_HIT_ALL       = 0x01, // Hit all targets in range regardless of party
    SPELLFLAG_WIPE_SHADOWS  = 0x02  // Wipe shadows even if single target and miss/resist (example: Maiden's Virelai)
};

enum class SpellID : uint16
{
    Cure                    = 1,
    Cure_II                 = 2,
    Cure_III                = 3,
    Cure_IV                 = 4,
    Cure_V                  = 5,
    Cure_VI                 = 6,
    Curaga                  = 7,
    Curaga_II               = 8,
    Curaga_III              = 9,
    Curaga_IV               = 10,
    Curaga_V                = 11,
    Raise                   = 12,
    Raise_II                = 13,
    Poisona                 = 14,
    Paralyna                = 15,
    Blindna                 = 16,
    Silena                  = 17,
    Stona                   = 18,
    Viruna                  = 19,
    Cursna                  = 20,
    Holy                    = 21,
    Holy_II                 = 22,
    Dia                     = 23,
    Dia_II                  = 24,
    Dia_III                 = 25,
    Dia_IV                  = 26,
    Dia_V                   = 27,
    Banish                  = 28,
    Banish_II               = 29,
    Banish_III              = 30,
    Banish_IV               = 31,
    Banish_V                = 32,
    Diaga                   = 33,
    Diaga_II                = 34,
    Diaga_III               = 35,
    Diaga_IV                = 36,
    Diaga_V                 = 37,
    Banishga                = 38,
    Banishga_II             = 39,
    Banishga_III            = 40,
    Banishga_IV             = 41,
    Banishga_V              = 42,
    Protect                 = 43,
    Protect_II              = 44,
    Protect_III             = 45,
    Protect_IV              = 46,
    Protect_V               = 47,
    Shell                   = 48,
    Shell_II                = 49,
    Shell_III               = 50,
    Shell_IV                = 51,
    Shell_V                 = 52,
    Blink                   = 53,
    Stoneskin               = 54,
    Aquaveil                = 55,
    Slow                    = 56,
    Haste                   = 57,
    Paralyze                = 58,
    Silence                 = 59,
    Barfire                 = 60,
    Barblizzard             = 61,
    Baraero                 = 62,
    Barstone                = 63,
    Barthunder              = 64,
    Barwater                = 65,
    Barfira                 = 66,
    Barblizzara             = 67,
    Baraera                 = 68,
    Barstonra               = 69,
    Barthundra              = 70,
    Barwatera               = 71,
    Barsleep                = 72,
    Barpoison               = 73,
    Barparalyze             = 74,
    Barblind                = 75,
    Barsilence              = 76,
    Barpetrify              = 77,
    Barvirus                = 78,
    Slow_II                 = 79,
    Paralyze_II             = 80,
    Recall_Jugner           = 81,
    Recall_Pashh            = 82,
    Recall_Meriph           = 83,
    Baramnesia              = 84,
    Baramnesra              = 85,
    Barsleepra              = 86,
    Barpoisonra             = 87,
    Barparalyzra            = 88,
    Barblindra              = 89,
    Barsilencera            = 90,
    Barpetra                = 91,
    Barvira                 = 92,
    Cura                    = 93,
    Sacrifice               = 94,
    Esuna                   = 95,
    Auspice                 = 96,
    Reprisal                = 97,
    Repose                  = 98,
    Sandstorm               = 99,
    Enfire                  = 100,
    Enblizzard              = 101,
    Enaero                  = 102,
    Enstone                 = 103,
    Enthunder               = 104,
    Enwater                 = 105,
    Phalanx                 = 106,
    Phalanx_II              = 107,
    Regen                   = 108,
    Refresh                 = 109,
    Regen_II                = 110,
    Regen_III               = 111,
    Flash                   = 112,
    Rainstorm               = 113,
    Windstorm               = 114,
    Firestorm               = 115,
    Hailstorm               = 116,
    Thunderstorm            = 117,
    Voidstorm               = 118,
    Aurorastorm             = 119,
    Teleport_Yhoat          = 120,
    Teleport_Altep          = 121,
    Teleport_Holla          = 122,
    Teleport_Dem            = 123,
    Teleport_Mea            = 124,
    Protectra               = 125,
    Protectra_II            = 126,
    Protectra_III           = 127,
    Protectra_IV            = 128,
    Protectra_V             = 129,
    Shellra                 = 130,
    Shellra_II              = 131,
    Shellra_III             = 132,
    Shellra_IV              = 133,
    Shellra_V               = 134,
    Reraise                 = 135,
    Invisible               = 136,
    Sneak                   = 137,
    Deodorize               = 138,
    Teleport_Vahzl          = 139,
    Raise_III               = 140,
    Reraise_II              = 141,
    Reraise_III             = 142,
    Erase                   = 143,
    Fire                    = 144,
    Fire_II                 = 145,
    Fire_III                = 146,
    Fire_IV                 = 147,
    Fire_V                  = 148,
    Blizzard                = 149,
    Blizzard_II             = 150,
    Blizzard_III            = 151,
    Blizzard_IV             = 152,
    Blizzard_V              = 153,
    Aero                    = 154,
    Aero_II                 = 155,
    Aero_III                = 156,
    Aero_IV                 = 157,
    Aero_V                  = 158,
    Stone                   = 159,
    Stone_II                = 160,
    Stone_III               = 161,
    Stone_IV                = 162,
    Stone_V                 = 163,
    Thunder                 = 164,
    Thunder_II              = 165,
    Thunder_III             = 166,
    Thunder_IV              = 167,
    Thunder_V               = 168,
    Water                   = 169,
    Water_II                = 170,
    Water_III               = 171,
    Water_IV                = 172,
    Water_V                 = 173,
    Firaga                  = 174,
    Firaga_II               = 175,
    Firaga_III              = 176,
    Firaga_IV               = 177,
    Firaga_V                = 178,
    Blizzaga                = 179,
    Blizzaga_II             = 180,
    Blizzaga_III            = 181,
    Blizzaga_IV             = 182,
    Blizzaga_V              = 183,
    Aeroga                  = 184,
    Aeroga_II               = 185,
    Aeroga_III              = 186,
    Aeroga_IV               = 187,
    Aeroga_V                = 188,
    Stonega                 = 189,
    Stonega_II              = 190,
    Stonega_III             = 191,
    Stonega_IV              = 192,
    Stonega_V               = 193,
    Thundaga                = 194,
    Thundaga_II             = 195,
    Thundaga_III            = 196,
    Thundaga_IV             = 197,
    Thundaga_V              = 198,
    Waterga                 = 199,
    Waterga_II              = 200,
    Waterga_III             = 201,
    Waterga_IV              = 202,
    Waterga_V               = 203,
    Flare                   = 204,
    Flare_II                = 205,
    Freeze                  = 206,
    Freeze_II               = 207,
    Tornado                 = 208,
    Tornado_II              = 209,
    Quake                   = 210,
    Quake_II                = 211,
    Burst                   = 212,
    Burst_II                = 213,
    Flood                   = 214,
    Flood_II                = 215,
    Gravity                 = 216,
    Gravity_II              = 217,
    Meteor                  = 218,
    Comet                   = 219,
    Poison                  = 220,
    Poison_II               = 221,
    Poison_III              = 222,
    Poison_IV               = 223,
    Poison_V                = 224,
    Poisonga                = 225,
    Poisonga_II             = 226,
    Poisonga_III            = 227,
    Poisonga_IV             = 228,
    Poisonga_V              = 229,
    Bio                     = 230,
    Bio_II                  = 231,
    Bio_III                 = 232,
    Bio_IV                  = 233,
    Bio_V                   = 234,
    Burn                    = 235,
    Frost                   = 236,
    Choke                   = 237,
    Rasp                    = 238,
    Shock                   = 239,
    Drown                   = 240,
    Retrace                 = 241,
    Absorb_ACC              = 242,
    Meteor_II               = 244,
    Drain                   = 245,
    Drain_II                = 246,
    Aspir                   = 247,
    Aspir_II                = 248,
    Blaze_Spikes            = 249,
    Ice_Spikes              = 250,
    Shock_Spikes            = 251,
    Stun                    = 252,
    Sleep                   = 253,
    Blind                   = 254,
    Break                   = 255,
    Virus                   = 256,
    Curse                   = 257,
    Bind                    = 258,
    Sleep_II                = 259,
    Dispel                  = 260,
    Warp                    = 261,
    Warp_II                 = 262,
    Escape                  = 263,
    Tractor                 = 264,
    Tractor_II              = 265,
    Absorb_STR              = 266,
    Absorb_DEX              = 267,
    Absorb_VIT              = 268,
    Absorb_AGI              = 269,
    Absorb_INT              = 270,
    Absorb_MND              = 271,
    Absorb_CHR              = 272,
    Sleepga                 = 273,
    Sleepga_II              = 274,
    Absorb_TP               = 275,
    Blind_II                = 276,
    Dread_Spikes            = 277,
    Geohelix                = 278,
    Hydrohelix              = 279,
    Anemohelix              = 280,
    Pyrohelix               = 281,
    Cryohelix               = 282,
    Ionohelix               = 283,
    Noctohelix              = 284,
    Luminohelix             = 285,
    Addle                   = 286,
    Klimaform               = 287,
    Fire_Spirit             = 288,
    Ice_Spirit              = 289,
    Air_Spirit              = 290,
    Earth_Spirit            = 291,
    Thunder_Spirit          = 292,
    Water_Spirit            = 293,
    Light_Spirit            = 294,
    Dark_Spirit             = 295,
    Carbuncle               = 296,
    Fenrir                  = 297,
    Ifrit                   = 298,
    Titan                   = 299,
    Leviathan               = 300,
    Garuda                  = 301,
    Shiva                   = 302,
    Ramuh                   = 303,
    Diabolos                = 304,
    Odin                    = 305,
    Alexander               = 306,
    Cait_Sith               = 307,
    Animus_Augeo            = 308,
    Animus_Minuo            = 309,
    Enlight                 = 310,
    Endark                  = 311,
    Enfire_II               = 312,
    Enblizzard_II           = 313,
    Enaero_II               = 314,
    Enstone_II              = 315,
    Enthunder_II            = 316,
    Enwater_II              = 317,
    Monomi_Ichi             = 318,
    Aisha_Ichi              = 319,
    Katon_Ichi              = 320,
    Katon_Ni                = 321,
    Katon_San               = 322,
    Hyoton_Ichi             = 323,
    Hyoton_Ni               = 324,
    Hyoton_San              = 325,
    Huton_Ichi              = 326,
    Huton_Ni                = 327,
    Huton_San               = 328,
    Doton_Ichi              = 329,
    Doton_Ni                = 330,
    Doton_San               = 331,
    Raiton_Ichi             = 332,
    Raiton_Ni               = 333,
    Raiton_San              = 334,
    Suiton_Ichi             = 335,
    Suiton_Ni               = 336,
    Suiton_San              = 337,
    Utsusemi_Ichi           = 338,
    Utsusemi_Ni             = 339,
    Utsusemi_San            = 340,
    Jubaku_Ichi             = 341,
    Jubaku_Ni               = 342,
    Jubaku_San              = 343,
    Hojo_Ichi               = 344,
    Hojo_Ni                 = 345,
    Hojo_San                = 346,
    Kurayami_Ichi           = 347,
    Kurayami_Ni             = 348,
    Kurayami_San            = 349,
    Dokumori_Ichi           = 350,
    Dokumori_Ni             = 351,
    Dokumori_San            = 352,
    Tonko_Ichi              = 353,
    Tonko_Ni                = 354,
    Tonko_San               = 355,
    Paralyga                = 356,
    Slowga                  = 357,
    Hastega                 = 358,
    Silencega               = 359,
    Dispelga                = 360,
    Blindga                 = 361,
    Bindga                  = 362,
    Breakga                 = 365,
    Graviga                 = 366,
    Death                   = 367,
    Foe_Requiem             = 368,
    Foe_Requiem_II          = 369,
    Foe_Requiem_III         = 370,
    Foe_Requiem_IV          = 371,
    Foe_Requiem_V           = 372,
    Foe_Requiem_VI          = 373,
    Foe_Requiem_VII         = 374,
    Foe_Requiem_VIII        = 375,
    Horde_Lullaby           = 376,
    Horde_Lullaby_II        = 377,
    Armys_Paeon             = 378,
    Armys_Paeon_II          = 379,
    Armys_Paeon_III         = 380,
    Armys_Paeon_IV          = 381,
    Armys_Paeon_V           = 382,
    Armys_Paeon_VI          = 383,
    Armys_Paeon_VII         = 384,
    Armys_Paeon_VIII        = 385,
    Mages_Ballad            = 386,
    Mages_Ballad_II         = 387,
    Mages_Ballad_III        = 388,
    Knights_Minne           = 389,
    Knights_Minne_II        = 390,
    Knights_Minne_III       = 391,
    Knights_Minne_IV        = 392,
    Knights_Minne_V         = 393,
    Valor_Minuet            = 394,
    Valor_Minuet_II         = 395,
    Valor_Minuet_III        = 396,
    Valor_Minuet_IV         = 397,
    Valor_Minuet_V          = 398,
    Sword_Madrigal          = 399,
    Blade_Madrigal          = 400,
    Hunters_Prelude         = 401,
    Archers_Prelude         = 402,
    Sheepfoe_Mambo          = 403,
    Dragonfoe_Mambo         = 404,
    Fowl_Aubade             = 405,
    Herb_Pastoral           = 406,
    Chocobo_Hum             = 407,
    Shining_Fantasia        = 408,
    Scops_Operetta          = 409,
    Puppets_Operetta        = 410,
    Jesters_Operetta        = 411,
    Gold_Capriccio          = 412,
    Devotee_Serenade        = 413,
    Warding_Round           = 414,
    Goblin_Gavotte          = 415,
    Cactuar_Fugue           = 416,
    Moogle_Rhapsody         = 417,
    Protected_Aria          = 418,
    Advancing_March         = 419,
    Victory_March           = 420,
    Battlefield_Elegy       = 421,
    Carnage_Elegy           = 422,
    Massacre_Elegy          = 423,
    Sinewy_Etude            = 424,
    Dextrous_Etude          = 425,
    Vivacious_Etude         = 426,
    Quick_Etude             = 427,
    Learned_Etude           = 428,
    Spirited_Etude          = 429,
    Enchanting_Etude        = 430,
    Herculean_Etude         = 431,
    Uncanny_Etude           = 432,
    Vital_Etude             = 433,
    Swift_Etude             = 434,
    Sage_Etude              = 435,
    Logical_Etude           = 436,
    Bewitching_Etude        = 437,
    Fire_Carol              = 438,
    Ice_Carol               = 439,
    Wind_Carol              = 440,
    Earth_Carol             = 441,
    Lightning_Carol         = 442,
    Water_Carol             = 443,
    Light_Carol             = 444,
    Dark_Carol              = 445,
    Fire_Carol_II           = 446,
    Ice_Carol_II            = 447,
    Wind_Carol_II           = 448,
    Earth_Carol_II          = 449,
    Lightning_Carol_II      = 450,
    Water_Carol_II          = 451,
    Light_Carol_II          = 452,
    Dark_Carol_II           = 453,
    Fire_Threnody           = 454,
    Ice_Threnody            = 455,
    Wind_Threnody           = 456,
    Earth_Threnody          = 457,
    Lightning_Threnody      = 458,
    Water_Threnody          = 459,
    Light_Threnody          = 460,
    Dark_Threnody           = 461,
    Magic_Finale            = 462,
    Foe_Lullaby             = 463,
    Goddesss_Hymnus         = 464,
    Chocobo_Mazurka         = 465,
    Maidens_Virelai         = 466,
    Raptor_Mazurka          = 467,
    Foe_Sirvente            = 468,
    Adventurers_Dirge       = 469,
    Sentinels_Scherzo       = 470,
    Foe_Lullaby_II          = 471,
    Refresh_II              = 473,
    Cura_II                 = 474,
    Cura_III                = 475,
    Regen_IV                = 477,
    Embrava                 = 478,
    Boost_STR               = 479,
    Boost_DEX               = 480,
    Boost_VIT               = 481,
    Boost_AGI               = 482,
    Boost_INT               = 483,
    Boost_MND               = 484,
    Boost_CHR               = 485,
    Gain_STR                = 486,
    Gain_DEX                = 487,
    Gain_VIT                = 488,
    Gain_AGI                = 489,
    Gain_INT                = 490,
    Gain_MND                = 491,
    Gain_CHR                = 492,
    Temper                  = 493,
    Adloquium               = 495,
    Firaja                  = 496,
    Blizzaja                = 497,
    Aeroja                  = 498,
    Stoneja                 = 499,
    Thundaja                = 500,
    Waterja                 = 501,
    Kaustra                 = 502,
    Impact                  = 503,
    Regen_V                 = 504,
    Gekka_Ichi              = 505,
    Yain_Ichi               = 506,
    Myoshu_Ichi             = 507,
    Yurin_Ichi              = 508,
    Kakka_Ichi              = 509,
    Migawari_Ichi           = 510,
    Haste_II                = 511,
    Venom_Shell             = 513,
    Maelstrom               = 515,
    Metallic_Body           = 517,
    Screwdriver             = 519,
    MP_Drainkiss            = 521,
    Death_Ray               = 522,
    Sandspin                = 524,
    Smite_of_Rage           = 527,
    Bludgeon                = 529,
    Refueling               = 530,
    Ice_Break               = 531,
    Blitzstrahl             = 532,
    Self_Destruct           = 533,
    Mysterious_Light        = 534,
    Cold_Wave               = 535,
    Poison_Breath           = 536,
    Stinking_Gas            = 537,
    Memento_Mori            = 538,
    Terror_Touch            = 539,
    Spinal_Cleave           = 540,
    Blood_Saber             = 541,
    Digest                  = 542,
    Mandibular_Bite         = 543,
    Cursed_Sphere           = 544,
    Sickle_Slash            = 545,
    Cocoon                  = 547,
    Filamented_Hold         = 548,
    Pollen                  = 549,
    Power_Attack            = 551,
    Death_Scissors          = 554,
    Magnetite_Cloud         = 555,
    Eyes_On_Me              = 557,
    Frenetic_Rip            = 560,
    Frightful_Roar          = 561,
    Hecatomb_Wave           = 563,
    Body_Slam               = 564,
    Radiant_Breath          = 565,
    Helldive                = 567,
    Jet_Stream              = 569,
    Blood_Drain             = 570,
    Sound_Blast             = 572,
    Feather_Tickle          = 573,
    Feather_Barrier         = 574,
    Jettatura               = 575,
    Yawn                    = 576,
    Foot_Kick               = 577,
    Wild_Carrot             = 578,
    Voracious_Trunk         = 579,
    Healing_Breeze          = 581,
    Chaotic_Eye             = 582,
    Sheep_Song              = 584,
    Ram_Charge              = 585,
    Claw_Cyclone            = 587,
    Lowing                  = 588,
    Dimensional_Death       = 589,
    Heat_Breath             = 591,
    Blank_Gaze              = 592,
    Magic_Fruit             = 593,
    Uppercut                = 594,
    Thousand_Needles        = 595,
    Pinecone_Bomb           = 596,
    Sprout_Smack            = 597,
    Soporific               = 598,
    Queasyshroom            = 599,
    Wild_Oats               = 603,
    Bad_Breath              = 604,
    Geist_Wall              = 605,
    Awful_Eye               = 606,
    Frost_Breath            = 608,
    Infrasonics             = 610,
    Disseverment            = 611,
    Actinic_Burst           = 612,
    Reactor_Cool            = 613,
    Saline_Coat             = 614,
    Plasma_Charge           = 615,
    Temporal_Shift          = 616,
    Vertical_Cleave         = 617,
    Blastbomb               = 618,
    Battle_Dance            = 620,
    Sandspray               = 621,
    Grand_Slam              = 622,
    Head_Butt               = 623,
    Bomb_Toss               = 626,
    Frypan                  = 628,
    Flying_Hip_Press        = 629,
    Hydro_Shot              = 631,
    Diamondhide             = 632,
    Enervation              = 633,
    Light_of_Penance        = 634,
    Warm_Up                 = 636,
    Firespit                = 637,
    Feather_Storm           = 638,
    Tail_Slap               = 640,
    Hysteric_Barrage        = 641,
    Amplification           = 642,
    Cannonball              = 643,
    Mind_Blast              = 644,
    Exuviation              = 645,
    Magic_Hammer            = 646,
    Zephyr_Mantle           = 647,
    Regurgitation           = 648,
    Seedspray               = 650,
    Corrosive_Ooze          = 651,
    Spiral_Spin             = 652,
    Asuran_Claws            = 653,
    Sub_zero_Smash          = 654,
    Triumphant_Roar         = 655,
    Acrid_Stream            = 656,
    Blazing_Bound           = 657,
    Plenilune_Embrace       = 658,
    Demoralizing_Roar       = 659,
    Cimicine_Discharge      = 660,
    Animating_Wail          = 661,
    Battery_Charge          = 662,
    Leafstorm               = 663,
    Regeneration            = 664,
    Final_Sting             = 665,
    Goblin_Rush             = 666,
    Vanity_Dive             = 667,
    Magic_Barrier           = 668,
    Whirl_of_Rage           = 669,
    Benthic_Typhoon         = 670,
    Auroral_Drape           = 671,
    Osmosis                 = 672,
    Quad_Continuum          = 673,
    Fantod                  = 674,
    Thermal_Pulse           = 675,
    Empty_Thrash            = 677,
    Dream_Flower            = 678,
    Occultation             = 679,
    Charged_Whisker         = 680,
    Winds_of_Promy          = 681,
    Delta_Thrust            = 682,
    Evryone_Grudge          = 683,
    Reaving_Wind            = 684,
    Barrier_Tusk            = 685,
    Mortal_Ray              = 686,
    Water_Bomb              = 687,
    Heavy_Strike            = 688,
    Dark_Orb                = 689,
    White_Wind              = 690,
    Sudden_Lunge            = 692,
    Quadrastrike            = 693,
    Vapor_Spray             = 694,
    Thunder_Breath          = 695,
    Orcish_Counterstance    = 696,
    Amorphic_Spikes         = 697,
    Wind_Breath             = 698,
    Barbed_Crescent         = 699,

    Thunderbolt             = 736,
    Harden_Shell            = 737,
    Absolute_Terror         = 738,
    Gates_of_Hades          = 739,
    Tourbillion             = 740,
    Pyric_Bulwark           = 741,
    Bilgestorm              = 742,
    Bloodrake               = 743,

    Distract                = 841,
    Distract_II             = 842,
    Frazzle                 = 843,
    Frazzle_II              = 844,
    Flurry                  = 845,
    Flurry_II               = 846
};

#define MAX_SPELL_ID 1024U

class CSpell
{
public:

    CSpell(SpellID id);
    virtual std::unique_ptr<CSpell> clone();

    bool        canTargetEnemy();
    bool        isBuff();
    bool        dealsDamage(); // checks if the spell deals hp damage to target, this is relative to message

    uint16      getTotalTargets();
    SpellID     getID();
    uint8       getJob(JOBTYPE JobID);
    uint16      getMPCost();
    uint32      getCastTime();
    uint32      getRecastTime();
    uint8       getValidTarget();
    uint16      getAnimationID();
    uint16      getAnimationTime();
    SPELLGROUP  getSpellGroup();
    uint8       getSkillType();
    uint16      getZoneMisc();
    uint8       getAOE();
    uint16      getBase();
    uint16      getElement();
    float       getMultiplier();
    uint16      getMessage();
    uint16      getDefaultMessage();
    uint16      getMagicBurstMessage();
    uint16      getCE();
    uint16      getVE();
    uint32      getModifiedRecast();
    float       getRadius();
    uint16      getAoEMessage(); // returns the single target message for AoE moves
    uint8       getRequirements();
    uint16      getMeritId();
    uint8       getFlag();
    int8*       getContentTag();
    float       getRange();
    bool        tookEffect(); // returns true if the spell landed, not resisted or missed
    bool        hasMPCost(); // checks if spell costs mp to use
    bool        isHeal(); // is a heal spell
    bool        isCure(); // is a Cure spell
    bool        isNa(); // is a -na spell
    bool        canHitShadow(); // check if spell ignores shadows

    void        setRadius(float radius);
    void        setTotalTargets(uint16 total);
    void        setID(SpellID id);
    void        setJob(int8* jobs);
    void        setMPCost(uint16 MP);
    void        setCastTime(uint32 CastTime);
    void        setRecastTime(uint32 RecastTime);
    void        setValidTarget(uint8 ValidTarget);
    void        setAnimationID(uint16 AnimationID);
    void        setAnimationTime(uint16 AnimationTime);
    void        setSpellGroup(SPELLGROUP SpellGroup);
    void        setSkillType(uint8 SkillType);
    void        setZoneMisc(uint16 Misc);
    void        setAOE(uint8 AOE);
    void        setBase(uint16 base);
    void        setElement(uint16 element);
    void        setMultiplier(float multiplier);
    void        setMessage(uint16 message);
    void        setMagicBurstMessage(uint16 message);
    void        setCE(uint16 ce);
    void        setVE(uint16 ve);
    void        setRequirements(uint8 requirements);
    void        setMeritId(uint16 meritId);
    void        setModifiedRecast(uint32 mrec);
    void        setFlag(uint8 flag);
    void        setContentTag(int8* contentTag);
    void        setRange(float range);

    const int8* getName();
    void        setName(int8* name);

protected:

    CSpell(const CSpell&) = default;
    CSpell& operator=(const CSpell&) = default;

private:
    SpellID     m_ID;                                      // spell id
    uint32      m_castTime {};                             // time to cast spell
    uint32      m_recastTime {};                           // recast time
    uint16      m_animation {};                            // animation for spell
    uint16      m_animationTime {};
    uint8       m_skillType {};
    float       m_range {};
    float       m_radius {};
    uint16      m_totalTargets {};
    uint16      m_mpCost {};                               // mpCost/itemId for ninjitsu tool
    uint8       m_job[MAX_JOBTYPE]{};                      // job
    uint8       m_ValidTarget {};                          // target pc/npc/both
    SPELLGROUP  m_spellGroup {SPELLGROUP_NONE};            // spellgroup
    uint16      m_zoneMisc {};                             // условия чтения заклинаний в зонах
    uint8       m_AOE {};                                  // aoe or single target spell
    uint16      m_base {};                                 // spell base damage
    float       m_multiplier {};                           // multiplier for upper tier spells
    uint16      m_element {};                              // element of spell
    uint16      m_message {};                              // message id
    uint16      m_MagicBurstMessage {};                    // Message used for magic bursts.
    uint16      m_CE {};                                   // cumulative enmity of spell
    uint16      m_VE {};                                   // volatile enmity of spell
    string_t    m_name;                                    // spell name
    uint32      m_modifiedRecastTime {};                   // recast time after modifications
    uint8       m_requirements {};                         // requirements before being able to cast spell
    uint16      m_meritId {};                              // associated merit (if applicable)
    uint8       m_flag {};
    int8*       m_contentTag {};
};

//Namestpace to work with spells
namespace spell
{
    void    LoadSpellList();

    CSpell* GetSpellByMonsterSkillId(uint16 SkillID);
    CSpell* GetSpell(SpellID SpellID);
    bool    CanUseSpell(CBattleEntity* PCaster, SpellID SpellID);
    bool    CanUseSpell(CBattleEntity* PCaster, CSpell* PSpell);
    bool    CanUseSpellWith(SpellID spellId, JOBTYPE job, uint8 level);
    float   GetSpellRadius(CSpell* spellId, CBattleEntity* PCaster);
};

#endif
