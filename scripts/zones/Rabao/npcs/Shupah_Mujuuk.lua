-----------------------------------
-- Area: Rabao
--  NPC: Shupah Mujuuk
-- Title Change NPC
-- !pos 12 8 20 247
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 1011
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.THE_IMMORTAL_FISHER_LU_SHANG,
            dsp.title.INDOMITABLE_FISHER,
            dsp.title.KUFTAL_TOURIST,
            dsp.title.ACQUIRER_OF_ANCIENT_ARCANUM,
            dsp.title.DESERT_HUNTER,
            dsp.title.ROOKIE_HERO_INSTRUCTOR,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.HEIR_OF_THE_GREAT_WIND,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.FODDERCHIEF_FLAYER,
            dsp.title.WARCHIEF_WRECKER,
            dsp.title.DREAD_DRAGON_SLAYER,
            dsp.title.OVERLORD_EXECUTIONER,
            dsp.title.DARK_DRAGON_SLAYER,
            dsp.title.ADAMANTKING_KILLER,
            dsp.title.BLACK_DRAGON_SLAYER,
            dsp.title.MANIFEST_MAULER,
            dsp.title.BEHEMOTHS_BANE,
            dsp.title.ARCHMAGE_ASSASSIN,
            dsp.title.HELLSBANE,
            dsp.title.GIANT_KILLER,
            dsp.title.LICH_BANISHER,
            dsp.title.JELLYBANE,
            dsp.title.BOGEYDOWNER,
            dsp.title.BEAKBENDER,
            dsp.title.SKULLCRUSHER,
            dsp.title.MORBOLBANE,
            dsp.title.GOLIATH_KILLER,
            dsp.title.MARYS_GUIDE,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.SIMURGH_POACHER,
            dsp.title.ROC_STAR,
            dsp.title.SERKET_BREAKER,
            dsp.title.CASSIENOVA,
            dsp.title.THE_HORNSPLITTER,
            dsp.title.TORTOISE_TORTURER,
            dsp.title.MON_CHERRY,
            dsp.title.BEHEMOTH_DETHRONER,
            dsp.title.THE_VIVISECTOR,
            dsp.title.DRAGON_ASHER,
            dsp.title.EXPEDITIONARY_TROOPER,
        },
    },
    {
        cost = 600,
        title =
        {
            dsp.title.ADAMANTKING_USURPER,
            dsp.title.OVERLORD_OVERTHROWER,
            dsp.title.DEITY_DEBUNKER,
            dsp.title.FAFNIR_SLAYER,
            dsp.title.ASPIDOCHELONE_SINKER,
            dsp.title.NIDHOGG_SLAYER,
            dsp.title.MAAT_MASHER,
            dsp.title.KIRIN_CAPTIVATOR,
            dsp.title.CACTROT_DESACELERADOR,
            dsp.title.LIFTER_OF_SHADOWS,
            dsp.title.TIAMAT_TROUNCER,
            dsp.title.VRTRA_VANQUISHER,
            dsp.title.WORLD_SERPENT_SLAYER,
            dsp.title.XOLOTL_XTRAPOLATOR,
            dsp.title.BOROKA_BELEAGUERER,
            dsp.title.OURYU_OVERWHELMER,
            dsp.title.VINEGAR_EVAPORATOR,
            dsp.title.VIRTUOUS_SAINT,
            dsp.title.BYEBYE_TAISAI,
            dsp.title.TEMENOS_LIBERATOR,
            dsp.title.APOLLYON_RAVAGER,
            dsp.title.WYRM_ASTONISHER,
            dsp.title.NIGHTMARE_AWAKENER,
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