-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Moozo-Koozo
--  Title Change NPC
-- !pos 83 0 120 230
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

local eventId = 675
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.NEW_ADVENTURER,
            dsp.title.BEAN_CUISINE_SALTER,
            dsp.title.DAYBREAK_GAMBLER,
            dsp.title.ENTRANCE_DENIED,
            dsp.title.RABBITER,
            dsp.title.ROYAL_GRAVE_KEEPER,
            dsp.title.COURIER_EXTRAORDINAIRE,
            dsp.title.RONFAURIAN_RESCUER,
            dsp.title.PICKPOCKET_PINCHER,
            dsp.title.THE_PURE_ONE,
            dsp.title.LOST_CHILD_OFFICER,
            dsp.title.SILENCER_OF_THE_LAMBS,
            dsp.title.LOST_AMP_FOUND_OFFICER,
            dsp.title.GREEN_GROCER,
            dsp.title.THE_BENEVOLENT_ONE,
            dsp.title.KNIGHT_IN_TRAINING,
            dsp.title.ADVERTISING_EXECUTIVE,
            dsp.title.FAMILY_COUNSELOR,
            dsp.title.MOGS_MASTER,
            dsp.title.VERMILLION_VENTURER,
            dsp.title.DISCERNING_INDIVIDUAL,
            dsp.title.VERY_DISCERNING_INDIVIDUAL,
            dsp.title.EXTREMELY_DISCERNING_INDIVIDUAL,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.SHEEPS_MILK_DELIVERER,
            dsp.title.THE_PIOUS_ONE,
            dsp.title.APIARIST,
            dsp.title.FAITH_LIKE_A_CANDLE,
            dsp.title.LIZARD_SKINNER,
            dsp.title.BUG_CATCHER,
            dsp.title.SPELUNKER,
            dsp.title.ARMS_TRADER,
            dsp.title.THIRDRATE_ORGANIZER,
            dsp.title.ROYAL_WEDDING_PLANNER,
            dsp.title.CONSORT_CANDIDATE,
            dsp.title.CERTIFIED_ADVENTURER,
            dsp.title.VAMPIRE_HUNTER_DMINUS,
            dsp.title.A_MOSS_KIND_PERSON,
            dsp.title.FANG_FINDER,
            dsp.title.TRAVELING_MEDICINE_MAN,
            dsp.title.CAT_SKINNER,
            dsp.title.CARP_DIEM,
            dsp.title.SECONDRATE_ORGANIZER,
            dsp.title.MOGS_KIND_MASTER,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.FIRSTRATE_ORGANIZER,
            dsp.title.PILGRIM_TO_HOLLA,
            dsp.title.TRIED_AND_TESTED_KNIGHT,
            dsp.title.HEIR_TO_THE_HOLY_CREST,
            dsp.title.OBSIDIAN_STORM,
            dsp.title.TALKS_WITH_TONBERRIES,
            dsp.title.SHADOW_BANISHER,
            dsp.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.SEARING_STAR,
            dsp.title.STRIKING_STAR,
            dsp.title.SOOTHING_STAR,
            dsp.title.SABLE_STAR,
            dsp.title.SCARLET_STAR,
            dsp.title.SONIC_STAR,
            dsp.title.SAINTLY_STAR,
            dsp.title.SHADOWY_STAR,
            dsp.title.SAVAGE_STAR,
            dsp.title.SINGING_STAR,
            dsp.title.SNIPING_STAR,
            dsp.title.SLICING_STAR,
            dsp.title.SNEAKING_STAR,
            dsp.title.SPEARING_STAR,
            dsp.title.SUMMONING_STAR,
            dsp.title.SAPPHIRE_STAR,
            dsp.title.SURGING_STAR,
            dsp.title.SWAYING_STAR,
            dsp.title.SPRIGHTLY_STAR,
            dsp.title.SAGACIOUS_STAR,
        },
    },
    {
        cost = 600,
        title =
        {
            dsp.title.ROOK_BUSTER,
            dsp.title.BANNERET,
            dsp.title.GOLD_BALLI_STAR,
            dsp.title.MYTHRIL_BALLI_STAR,
            dsp.title.SILVER_BALLI_STAR,
            dsp.title.BRONZE_BALLI_STAR,
            dsp.title.BALLISTAGER,
            dsp.title.FINAL_BALLI_STAR,
            dsp.title.BALLI_STAR_ROYALE,
            dsp.title.PARAGON_OF_RED_MAGE_EXCELLENCE,
            dsp.title.PARAGON_OF_WHITE_MAGE_EXCELLENCE,
            dsp.title.PARAGON_OF_PALADIN_EXCELLENCE,
            dsp.title.PARAGON_OF_DRAGOON_EXCELLENCE,
            dsp.title.HEIR_OF_THE_GREAT_ICE,
            dsp.title.MOGS_LOVING_MASTER,
            dsp.title.SAN_DORIAN_ROYAL_HEIR,
            dsp.title.DYNAMIS_SAN_DORIA_INTERLOPER,
        },
    },
    {
        cost = 700,
        title =
        {
            dsp.title.ROYAL_ARCHER,
            dsp.title.ROYAL_SPEARMAN,
            dsp.title.ROYAL_SQUIRE,
            dsp.title.ROYAL_SWORDSMAN,
            dsp.title.ROYAL_CAVALIER,
            dsp.title.ROYAL_GUARD,
            dsp.title.GRAND_KNIGHT_OF_THE_REALM,
            dsp.title.GRAND_TEMPLE_KNIGHT,
            dsp.title.RESERVE_KNIGHT_CAPTAIN,
            dsp.title.ELITE_ROYAL_GUARD,
            dsp.title.WOOD_WORSHIPER,
            dsp.title.LUMBER_LATHER,
            dsp.title.ACCOMPLISHED_CARPENTER,
            dsp.title.ANVIL_ADVOCATE,
            dsp.title.FORGE_FANATIC,
            dsp.title.ACCOMPLISHED_BLACKSMITH,
            dsp.title.ARMORY_OWNER,
            dsp.title.HIDE_HANDLER,
            dsp.title.LEATHER_LAUDER,
            dsp.title.ACCOMPLISHED_TANNER,
            dsp.title.SHOESHOP_OWNER,
            dsp.title.MOG_HOUSE_HANDYPERSON,
        },
    },
}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    dsp.title.changerOnTrigger(player, eventId, titleInfo)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    dsp.title.changerOnEventFinish(player, csid, option, eventId, titleInfo)
end