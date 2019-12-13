-----------------------------------
-- Area: Port Bastok
--  NPC: Styi Palneh
-- Title Change NPC
-- !pos 28 4 -15 236
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 200
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.NEW_ADVENTURER,
            dsp.title.BASTOK_WELCOMING_COMMITTEE,
            dsp.title.BUCKET_FISHER,
            dsp.title.PURSUER_OF_THE_PAST,
            dsp.title.MOMMYS_HELPER,
            dsp.title.HOT_DOG,
            dsp.title.STAMPEDER,
            dsp.title.RINGBEARER,
            dsp.title.ZERUHN_SWEEPER,
            dsp.title.TEARJERKER,
            dsp.title.CRAB_CRUSHER,
            dsp.title.BRYGIDAPPROVED,
            dsp.title.GUSTABERG_TOURIST,
            dsp.title.MOGS_MASTER,
            dsp.title.CERULEAN_SOLDIER,
            dsp.title.DISCERNING_INDIVIDUAL,
            dsp.title.VERY_DISCERNING_INDIVIDUAL,
            dsp.title.EXTREMELY_DISCERNING_INDIVIDUAL,
            dsp.title.APOSTATE_FOR_HIRE,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.SHELL_OUTER,
            dsp.title.PURSUER_OF_THE_TRUTH,
            dsp.title.QIJIS_FRIEND,
            dsp.title.TREASURE_SCAVENGER,
            dsp.title.SAND_BLASTER,
            dsp.title.DRACHENFALL_ASCETIC,
            dsp.title.ASSASSIN_REJECT,
            dsp.title.CERTIFIED_ADVENTURER,
            dsp.title.QIJIS_RIVAL,
            dsp.title.CONTEST_RIGGER,
            dsp.title.KULATZ_BRIDGE_COMPANION,
            dsp.title.AVENGER,
            dsp.title.AIRSHIP_DENOUNCER,
            dsp.title.STAR_OF_IFRIT,
            dsp.title.PURPLE_BELT,
            dsp.title.MOGS_KIND_MASTER,
            dsp.title.TRASH_COLLECTOR,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.BEADEAUX_SURVEYOR,
            dsp.title.PILGRIM_TO_DEM,
            dsp.title.BLACK_DEATH,
            dsp.title.DARK_SIDER,
            dsp.title.SHADOW_WALKER,
            dsp.title.SORROW_DROWNER,
            dsp.title.STEAMING_SHEEP_REGULAR,
            dsp.title.SHADOW_BANISHER,
            dsp.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
            dsp.title.HYPER_ULTRA_SONIC_ADVENTURER,
            dsp.title.GOBLIN_IN_DISGUISE,
            dsp.title.BASTOKS_SECOND_BEST_DRESSED,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.PARAGON_OF_WARRIOR_EXCELLENCE,
            dsp.title.PARAGON_OF_MONK_EXCELLENCE,
            dsp.title.PARAGON_OF_DARK_KNIGHT_EXCELLENCE,
            dsp.title.HEIR_OF_THE_GREAT_EARTH,
            dsp.title.MOGS_LOVING_MASTER,
            dsp.title.HERO_AMONG_HEROES,
            dsp.title.DYNAMIS_BASTOK_INTERLOPER,
            dsp.title.MASTER_OF_MANIPULATION,
        },
    },
    {
        cost = 600,
        title =
        {
            dsp.title.LEGIONNAIRE,
            dsp.title.DECURION,
            dsp.title.CENTURION,
            dsp.title.JUNIOR_MUSKETEER,
            dsp.title.SENIOR_MUSKETEER,
            dsp.title.MUSKETEER_COMMANDER,
            dsp.title.GOLD_MUSKETEER,
            dsp.title.PRAEFECTUS,
            dsp.title.SENIOR_GOLD_MUSKETEER,
            dsp.title.PRAEFECTUS_CASTRORUM,
            dsp.title.ANVIL_ADVOCATE,
            dsp.title.FORGE_FANATIC,
            dsp.title.ACCOMPLISHED_BLACKSMITH,
            dsp.title.ARMORY_OWNER,
            dsp.title.TRINKET_TURNER,
            dsp.title.SILVER_SMELTER,
            dsp.title.ACCOMPLISHED_GOLDSMITH,
            dsp.title.JEWELRY_STORE_OWNER,
            dsp.title.FORMULA_FIDDLER,
            dsp.title.POTION_POTENTATE,
            dsp.title.ACCOMPLISHED_ALCHEMIST,
            dsp.title.APOTHECARY_OWNER,
        },
    },
    {
        cost = 700,
        title =
        {
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