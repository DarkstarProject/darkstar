-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Aligi-Kufongi
-- Title Change NPC
-- !pos -23 -21 15 26
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

local eventId = 342
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            dsp.title.TAVNAZIAN_SQUIRE,
            dsp.title.PUTRID_PURVEYOR_OF_PUNGENT_PETALS,
            dsp.title.MONARCH_LINN_PATROL_GUARD,
            dsp.title.SIN_HUNTER_HUNTER,
            dsp.title.DISCIPLE_OF_JUSTICE,
            dsp.title.DYNAMIS_TAVNAZIA_INTERLOPER,
            dsp.title.CONFRONTER_OF_NIGHTMARES,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.DEAD_BODY,
            dsp.title.FROZEN_DEAD_BODY,
            dsp.title.DREAMBREAKER,
            dsp.title.MIST_MELTER,
            dsp.title.DELTA_ENFORCER,
            dsp.title.OMEGA_OSTRACIZER,
            dsp.title.ULTIMA_UNDERTAKER,
            dsp.title.ULMIAS_SOULMATE,
            dsp.title.TENZENS_ALLY,
            dsp.title.COMPANION_OF_LOUVERANCE,
            dsp.title.TRUE_COMPANION_OF_LOUVERANCE,
            dsp.title.PRISHES_BUDDY,
            dsp.title.NAGMOLADAS_UNDERLING,
            dsp.title.ESHANTARLS_COMRADE_IN_ARMS,
            dsp.title.THE_CHEBUKKIS_WORST_NIGHTMARE,
            dsp.title.UNQUENCHABLE_LIGHT,
            dsp.title.WARRIOR_OF_THE_CRYSTAL,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.ANCIENT_FLAME_FOLLOWER,
            dsp.title.TAVNAZIAN_TRAVELER,
            dsp.title.TRANSIENT_DREAMER,
            dsp.title.THE_LOST_ONE,
            dsp.title.TREADER_OF_AN_ICY_PAST,
            dsp.title.BRANDED_BY_LIGHTNING,
            dsp.title.SEEKER_OF_THE_LIGHT,
            dsp.title.AVERTER_OF_THE_APOCALYPSE,
            dsp.title.BANISHER_OF_EMPTINESS,
            dsp.title.BREAKER_OF_THE_CHAINS,
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