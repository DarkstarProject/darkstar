-----------------------------------
-- Area: Norg
--  NPC: Quntsu-Nointsu
-- Title Change NPC
-- !pos -67 -1 34 252
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES , dsp.title.BUSHIDO_BLADE , dsp.title.BLACK_MARKETEER , dsp.title.CRACKER_OF_THE_SECRET_CODE ,
                dsp.title.LOOKS_SUBLIME_IN_A_SUBLIGAR , dsp.title.LOOKS_GOOD_IN_LEGGINGS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.APPRENTICE_SOMMELIER , dsp.title.TREASUREHOUSE_RANSACKER , dsp.title.HEIR_OF_THE_GREAT_WATER , dsp.title.PARAGON_OF_SAMURAI_EXCELLENCE ,
                dsp.title.PARAGON_OF_NINJA_EXCELLENCE , dsp.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY , dsp.title.BEARER_OF_BONDS_BEYOND_TIME , dsp.title.FRIEND_OF_THE_OPOOPOS ,
                dsp.title.PENTACIDE_PERPETRATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.BEARER_OF_THE_WISEWOMANS_HOPE , dsp.title.BEARER_OF_THE_EIGHT_PRAYERS , dsp.title.LIGHTWEAVER , dsp.title.DESTROYER_OF_ANTIQUITY , dsp.title.SEALER_OF_THE_PORTAL_OF_THE_GODS ,
                dsp.title.BURIER_OF_THE_ILLUSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1011,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid==1011) then
        if (option > 0 and option <29) then
            if (player:delGil(200)) then
                player:setTitle( title2[option] )
            end
        elseif (option > 256 and option <285) then
            if (player:delGil(300)) then
                player:setTitle(  title3[option - 256] )
            end
        elseif (option > 512 and option < 541) then
            if (player:delGil(400)) then
                player:setTitle( title4[option - 512] )
            end
        end
    end
end;