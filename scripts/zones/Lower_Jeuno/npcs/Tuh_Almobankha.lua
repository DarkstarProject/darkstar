-----------------------------------
-- Area: Lower Jeuno
--  NPC: Tuh Almobankha
-- Title Change NPC
-- !pos -14 0 -61 245
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 10014
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.BROWN_MAGE_GUINEA_PIG,
            dsp.title.BROWN_MAGIC_BYPRODUCT,
            dsp.title.RESEARCHER_OF_CLASSICS,
            dsp.title.TORCHBEARER,
            dsp.title.FORTUNETELLER_IN_TRAINING,
            dsp.title.CHOCOBO_TRAINER,
            dsp.title.CLOCK_TOWER_PRESERVATIONIST,
            dsp.title.LIFE_SAVER,
            dsp.title.CARD_COLLECTOR,
            dsp.title.TWOS_COMPANY,
            dsp.title.TRADER_OF_ANTIQUITIES,
            dsp.title.GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN,
            dsp.title.TENSHODO_MEMBER,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.ACTIVIST_FOR_KINDNESS,
            dsp.title.ENVOY_TO_THE_NORTH,
            dsp.title.EXORCIST_IN_TRAINING,
            dsp.title.FOOLS_ERRAND_RUNNER,
            dsp.title.STREET_SWEEPER,
            dsp.title.MERCY_ERRAND_RUNNER,
            dsp.title.BELIEVER_OF_ALTANA,
            dsp.title.TRADER_OF_MYSTERIES,
            dsp.title.WANDERING_MINSTREL,
            dsp.title.ANIMAL_TRAINER,
            dsp.title.HAVE_WINGS_WILL_FLY,
            dsp.title.ROD_RETRIEVER,
            dsp.title.DESTINED_FELLOW,
            dsp.title.TROUPE_BRILIOTH_DANCER,
            dsp.title.PROMISING_DANCER,
            dsp.title.STARDUST_DANCER,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.TIMEKEEPER,
            dsp.title.BRINGER_OF_BLISS,
            dsp.title.PROFESSIONAL_LOAFER,
            dsp.title.TRADER_OF_RENOWN,
            dsp.title.HORIZON_BREAKER,
            dsp.title.SUMMIT_BREAKER,
            dsp.title.BROWN_BELT,
            dsp.title.DUCAL_DUPE,
            dsp.title.CHOCOBO_LOVE_GURU,
            dsp.title.PICKUP_ARTIST,
            dsp.title.WORTHY_OF_TRUST,
            dsp.title.A_FRIEND_INDEED,
            dsp.title.CHOCOROOKIE,
            dsp.title.CRYSTAL_STAKES_CUPHOLDER,
            dsp.title.WINNING_OWNER,
            dsp.title.VICTORIOUS_OWNER,
            dsp.title.TRIUMPHANT_OWNER,
            dsp.title.HIGH_ROLLER,
            dsp.title.FORTUNES_FAVORITE,
            dsp.title.CHOCOCHAMPION,
        },
    },
    {
        cost = 500,
        title =
        {
            dsp.title.PARAGON_OF_BEASTMASTER_EXCELLENCE,
            dsp.title.PARAGON_OF_BARD_EXCELLENCE,
            dsp.title.SKY_BREAKER,
            dsp.title.BLACK_BELT,
            dsp.title.GREEDALOX,
            dsp.title.CLOUD_BREAKER,
            dsp.title.STAR_BREAKER,
            dsp.title.ULTIMATE_CHAMPION_OF_THE_WORLD,
            dsp.title.DYNAMIS_JEUNO_INTERLOPER,
            dsp.title.DYNAMIS_BEAUCEDINE_INTERLOPER,
            dsp.title.DYNAMIS_XARCABARD_INTERLOPER,
            dsp.title.DYNAMIS_QUFIM_INTERLOPER,
            dsp.title.CONQUEROR_OF_FATE,
            dsp.title.SUPERHERO,
            dsp.title.SUPERHEROINE,
            dsp.title.ELEGANT_DANCER,
            dsp.title.DAZZLING_DANCE_DIVA,
            dsp.title.GRIMOIRE_BEARER,
            dsp.title.FELLOW_FORTIFIER,
            dsp.title.BUSHIN_ASPIRANT,
            dsp.title.BUSHIN_RYU_INHERITOR,
        },
    },
    {
        cost = 600,
        title =
        {
            dsp.title.GRAND_GREEDALOX,
            dsp.title.SILENCER_OF_THE_ECHO,
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