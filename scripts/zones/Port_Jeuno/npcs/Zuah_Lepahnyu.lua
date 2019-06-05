-----------------------------------
-- Area: Port Jeuno
--  NPC: ZuahLepahnyu
-- Title Change NPC
-- !pos 0 0 8 246
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 330
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.VISITOR_TO_ABYSSEA,
            dsp.title.FRIEND_OF_ABYSSEA,
            dsp.title.WARRIOR_OF_ABYSSEA,
            dsp.title.STORMER_OF_ABYSSEA,
            dsp.title.DEVASTATOR_OF_ABYSSEA,
            dsp.title.HERO_OF_ABYSSEA,
            dsp.title.CHAMPION_OF_ABYSSEA,
            dsp.title.CONQUEROR_OF_ABYSSEA,
            dsp.title.SAVIOR_OF_ABYSSEA,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.GOLDWING_SQUASHER,
            dsp.title.SILAGILITH_DETONATOR,
            dsp.title.SURTR_SMOTHERER,
            dsp.title.DREYRUK_PREDOMINATOR,
            dsp.title.SAMURSK_VITIATOR,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.YAANEI_CRASHER,
            dsp.title.KUTHAREI_UNHORSER,
            dsp.title.SIPPOY_CAPTURER,
            dsp.title.RANI_DECROWNER,
            dsp.title.ORTHRUS_DECAPITATOR,
            dsp.title.DRAGUA_SLAYER,
            dsp.title.BENNU_DEPLUMER,
            dsp.title.HEDJEDJET_DESTINGER,
            dsp.title.CUIJATENDER_DESICCATOR,
            dsp.title.BRULO_EXTINGUISHER,
            dsp.title.PANTOKRATOR_DISPROVER,
            dsp.title.APADEMAK_ANNIHILATOR,
            dsp.title.ISGEBIND_DEFROSTER,
            dsp.title.RESHEPH_ERADICATOR,
            dsp.title.EMPOUSA_EXPURGATOR,
            dsp.title.INDRIK_IMMOLATOR,
            dsp.title.OGOPOGO_OVERTURNER,
            dsp.title.RAJA_REGICIDE,
            dsp.title.ALFARD_DETOXIFIER,
            dsp.title.AZDAJA_ABOLISHER,
            dsp.title.AMPHITRITE_SHUCKER,
            dsp.title.FUATH_PURIFIER,
            dsp.title.KILLAKRIQ_EXCORIATOR,
            dsp.title.MAERE_BESTIRRER,
            dsp.title.WYRM_GOD_DEFIER,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.TITLACAUAN_DISMEMBERER,
            dsp.title.SMOK_DEFOGGER,
            dsp.title.AMHULUK_INUNDATER,
            dsp.title.PULVERIZER_DISMANTLER,
            dsp.title.DURINN_DECEIVER,
            dsp.title.KARKADANN_EXOCULATOR,
            dsp.title.TEMENOS_EMANCIPATOR,
            dsp.title.APOLLYON_RAZER,
            dsp.title.UMAGRHK_MANEMANGLER,
        },
    },
    {
        cost = 600,
        title =
        {
            dsp.title.KARKINOS_CLAWCRUSHER,
            dsp.title.CARABOSSE_QUASHER,
            dsp.title.OVNI_OBLITERATOR,
            dsp.title.RUMINATOR_CONFOUNDER,
            dsp.title.FISTULE_DRAINER,
            dsp.title.TURUL_GROUNDER,
            dsp.title.BLOODEYE_BANISHER,
            dsp.title.SATIATOR_DEPRIVER,
            dsp.title.CHLORIS_UPROOTER,
            dsp.title.MYRMECOLEON_TAMER,
            dsp.title.GLAVOID_STAMPEDER,
            dsp.title.USURPER_DEPOSER,
            dsp.title.ULHUADSHI_DESICCATOR,
            dsp.title.ITZPAPALOTL_DECLAWER,
            dsp.title.SOBEK_MUMMIFIER,
            dsp.title.CIREINCROIN_HARPOONER,
            dsp.title.BUKHIS_TETHERER,
            dsp.title.SEDNA_TUSKBREAKER,
            dsp.title.CLEAVER_DISMANTLER,
            dsp.title.EXECUTIONER_DISMANTLER,
            dsp.title.SEVERER_DISMANTLER,
        },
    },
    {
        cost = 700,
        title =
        {
            dsp.title.HADHAYOSH_HALTERER,
            dsp.title.BRIAREUS_FELLER,
            dsp.title.ECCENTRICITY_EXPUNGER,
            dsp.title.KUKULKAN_DEFANGER,
            dsp.title.IRATHAM_CAPTURER,
            dsp.title.LACOVIE_CAPSIZER,
            dsp.title.LUSCA_DEBUNKER,
            dsp.title.TRISTITIA_DELIVERER,
            dsp.title.KETEA_BEACHER,
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