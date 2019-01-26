-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Koyol-Futenol
-- Title Change NPC
-- !pos -129 2 -20 50
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 644
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.DARK_RESISTANT,
            dsp.title.BEARER_OF_THE_MARK_OF_ZAHAK,
            dsp.title.SEAGULL_PHRATRIE_CREW_MEMBER,
            dsp.title.PROUD_AUTOMATON_OWNER,
            dsp.title.WILDCAT_PUBLICIST,
            dsp.title.SCENIC_SNAPSHOTTER,
            dsp.title.BRANDED_BY_THE_FIVE_SERPENTS,
            dsp.title.IMMORTAL_LION,
            dsp.title.PARAGON_OF_BLUE_MAGE_EXCELLENCE,
            dsp.title.PARAGON_OF_CORSAIR_EXCELLENCE,
            dsp.title.PARAGON_OF_PUPPETMASTER_EXCELLENCE,
            dsp.title.MASTER_OF_AMBITION,
            dsp.title.MASTER_OF_CHANCE,
            dsp.title.SKYSERPENT_AGGRANDIZER,
            dsp.title.GALESERPENT_GUARDIAN,
            dsp.title.STONESERPENT_SHOCKTROOPER,
            dsp.title.PHOTOPTICATOR_OPERATOR,
            dsp.title.SPRINGSERPENT_SENTRY,
            dsp.title.FLAMESERPENT_FACILITATOR,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.PRIVATE_SECOND_CLASS,
            dsp.title.PRIVATE_FIRST_CLASS,
            dsp.title.SUPERIOR_PRIVATE,
            dsp.title.LANCE_CORPORAL,
            dsp.title.CORPORAL,
            dsp.title.SERGEANT,
            dsp.title.SERGEANT_MAJOR,
            dsp.title.CHIEF_SERGEANT,
            dsp.title.SECOND_LIEUTENANT,
            dsp.title.FIRST_LIEUTENANT,
            dsp.title.AGENT_OF_THE_ALLIED_FORCES,
            dsp.title.OVJANGS_ERRAND_RUNNER,
            dsp.title.KARABABAS_TOUR_GUIDE,
            dsp.title.KARABABAS_BODYGUARD,
            dsp.title.KARABABAS_SECRET_AGENT,
            dsp.title.APHMAUS_MERCENARY,
            dsp.title.NASHMEIRAS_MERCENARY,
            dsp.title.SALAHEEMS_RISK_ASSESSOR,
            dsp.title.TREASURE_TROVE_TENDER,
            dsp.title.GESSHOS_MERCY,
            dsp.title.EMISSARY_OF_THE_EMPRESS,
            dsp.title.ENDYMION_PARATROOPER,
            dsp.title.NAJAS_COMRADEINARMS,
            dsp.title.NASHMEIRAS_LOYALIST,
            dsp.title.PREVENTER_OF_RAGNAROK,
            dsp.title.CHAMPION_OF_AHT_URHGAN,
            dsp.title.ETERNAL_MERCENARY,
            dsp.title.CAPTAIN
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.SUBDUER_OF_THE_MAMOOL_JA,
            dsp.title.SUBDUER_OF_THE_TROLLS,
            dsp.title.SUBDUER_OF_THE_UNDEAD_SWARM,
            dsp.title.CERBERUS_MUZZLER,
            dsp.title.HYDRA_HEADHUNTER,
            dsp.title.SHINING_SCALE_RIFLER,
            dsp.title.TROLL_SUBJUGATOR,
            dsp.title.GORGONSTONE_SUNDERER,
            dsp.title.KHIMAIRA_CARVER,
            dsp.title.ELITE_EINHERJAR,
            dsp.title.STAR_CHARIOTEER,
            dsp.title.SUN_CHARIOTEER,
            dsp.title.COMET_CHARIOTEER,
            dsp.title.MOON_CHARIOTEER,
            dsp.title.BLOODY_BERSERKER,
            dsp.title.THE_SIXTH_SERPENT,
            dsp.title.OUPIRE_IMPALER,
            dsp.title.HEIR_OF_THE_BLESSED_RADIANCE,
            dsp.title.HEIR_OF_THE_BLIGHTED_GLOOM,
            dsp.title.SWORN_TO_THE_DARK_DIVINITY,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.SUPERNAL_SAVANT,
            dsp.title.SOLAR_SAGE,
            dsp.title.BOLIDE_BARON,
            dsp.title.MOON_MAVEN,
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