-----------------------------------
-- Area: Norg
--  NPC: Quntsu-Nointsu
-- Title Change NPC
-- !pos -67 -1 34 252
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
            dsp.title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES,
            dsp.title.BUSHIDO_BLADE,
            dsp.title.BLACK_MARKETEER,
            dsp.title.CRACKER_OF_THE_SECRET_CODE,
            dsp.title.LOOKS_SUBLIME_IN_A_SUBLIGAR,
            dsp.title.LOOKS_GOOD_IN_LEGGINGS,
        },
    },
    {
        cost = 300,
        title =
        {
            dsp.title.APPRENTICE_SOMMELIER,
            dsp.title.TREASUREHOUSE_RANSACKER,
            dsp.title.HEIR_OF_THE_GREAT_WATER,
            dsp.title.PARAGON_OF_SAMURAI_EXCELLENCE,
            dsp.title.PARAGON_OF_NINJA_EXCELLENCE,
            dsp.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY,
            dsp.title.BEARER_OF_BONDS_BEYOND_TIME,
            dsp.title.FRIEND_OF_THE_OPOOPOS,
            dsp.title.PENTACIDE_PERPETRATOR,
        },
    },
    {
        cost = 400,
        title =
        {
            dsp.title.BEARER_OF_THE_WISEWOMANS_HOPE,
            dsp.title.BEARER_OF_THE_EIGHT_PRAYERS,
            dsp.title.LIGHTWEAVER,
            dsp.title.DESTROYER_OF_ANTIQUITY,
            dsp.title.SEALER_OF_THE_PORTAL_OF_THE_GODS,
            dsp.title.BURIER_OF_THE_ILLUSION,
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