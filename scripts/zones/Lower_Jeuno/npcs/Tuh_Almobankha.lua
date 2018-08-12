-----------------------------------
-- Area: Lower Jeuno
--  NPC: Tuh Almobankha
-- Title Change NPC
-- !pos -14 0 -61 245
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.BROWN_MAGE_GUINEA_PIG , dsp.title.BROWN_MAGIC_BYPRODUCT , dsp.title.RESEARCHER_OF_CLASSICS , dsp.title.TORCHBEARER , dsp.title.FORTUNETELLER_IN_TRAINING ,
                dsp.title.CHOCOBO_TRAINER , dsp.title.CLOCK_TOWER_PRESERVATIONIST , dsp.title.LIFE_SAVER , dsp.title.CARD_COLLECTOR , dsp.title.TWOS_COMPANY , dsp.title.TRADER_OF_ANTIQUITIES , dsp.title.GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN ,
                dsp.title.TENSHODO_MEMBER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.ACTIVIST_FOR_KINDNESS , dsp.title.ENVOY_TO_THE_NORTH , dsp.title.EXORCIST_IN_TRAINING , dsp.title.FOOLS_ERRAND_RUNNER , dsp.title.STREET_SWEEPER ,
                dsp.title.MERCY_ERRAND_RUNNER , dsp.title.BELIEVER_OF_ALTANA , dsp.title.TRADER_OF_MYSTERIES , dsp.title.WANDERING_MINSTREL , dsp.title.ANIMAL_TRAINER , dsp.title.HAVE_WINGS_WILL_FLY ,
                dsp.title.ROD_RETRIEVER , dsp.title.DESTINED_FELLOW , dsp.title.TROUPE_BRILIOTH_DANCER , dsp.title.PROMISING_DANCER , dsp.title.STARDUST_DANCER ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.TIMEKEEPER , dsp.title.BRINGER_OF_BLISS , dsp.title.PROFESSIONAL_LOAFER , dsp.title.TRADER_OF_RENOWN , dsp.title.HORIZON_BREAKER , dsp.title.SUMMIT_BREAKER ,
                dsp.title.BROWN_BELT , dsp.title.DUCAL_DUPE , dsp.title.CHOCOBO_LOVE_GURU , dsp.title.PICKUP_ARTIST , dsp.title.WORTHY_OF_TRUST , dsp.title.A_FRIEND_INDEED , dsp.title.CHOCOROOKIE , dsp.title.CRYSTAL_STAKES_CUPHOLDER ,
                dsp.title.WINNING_OWNER , dsp.title.VICTORIOUS_OWNER , dsp.title.TRIUMPHANT_OWNER , dsp.title.HIGH_ROLLER , dsp.title.FORTUNES_FAVORITE , dsp.title.CHOCOCHAMPION ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.title.PARAGON_OF_BEASTMASTER_EXCELLENCE , dsp.title.PARAGON_OF_BARD_EXCELLENCE , dsp.title.SKY_BREAKER , dsp.title.BLACK_BELT , dsp.title.GREEDALOX , dsp.title.CLOUD_BREAKER ,
                dsp.title.STAR_BREAKER , dsp.title.ULTIMATE_CHAMPION_OF_THE_WORLD , dsp.title.DYNAMISJEUNO_INTERLOPER , dsp.title.DYNAMISBEAUCEDINE_INTERLOPER , dsp.title.DYNAMISXARCABARD_INTERLOPER ,
                dsp.title.DYNAMISQUFIM_INTERLOPER , dsp.title.CONQUEROR_OF_FATE , dsp.title.SUPERHERO , dsp.title.SUPERHEROINE , dsp.title.ELEGANT_DANCER , dsp.title.DAZZLING_DANCE_DIVA , dsp.title.GRIMOIRE_BEARER ,
                dsp.title.FELLOW_FORTIFIER , dsp.title.BUSHIN_ASPIRANT , dsp.title.BUSHIN_RYU_INHERITOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.title.GRAND_GREEDALOX , dsp.title.SILENCER_OF_THE_ECHO , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10014,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid==10014) then
        if (option > 0 and option <29) then
            if (player:delGil(400)) then
                player:setTitle( title2[option] )
            end
        elseif (option > 256 and option <285) then
            if (player:delGil(500)) then
                player:setTitle(  title3[option - 256] )
            end
        elseif (option > 512 and option < 541) then
            if (player:delGil(600)) then
                player:setTitle( title4[option - 512] )
            end
        elseif (option > 768 and option <797) then
            if (player:delGil(700)) then
                player:setTitle( title5[option - 768] )
            end
        elseif (option > 1024 and option < 1053) then
            if (player:delGil(800)) then
                player:setTitle( title6[option - 1024] )
            end
        end
    end
end;