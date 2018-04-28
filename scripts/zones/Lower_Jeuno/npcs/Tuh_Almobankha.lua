-----------------------------------
-- Area: Lower Jeuno
--  NPC: Tuh Almobankha
-- Title Change NPC
-- !pos -14 0 -61 245
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.BROWN_MAGE_GUINEA_PIG , dsp.titles.BROWN_MAGIC_BYPRODUCT , dsp.titles.RESEARCHER_OF_CLASSICS , dsp.titles.TORCHBEARER , dsp.titles.FORTUNETELLER_IN_TRAINING ,
                dsp.titles.CHOCOBO_TRAINER , dsp.titles.CLOCK_TOWER_PRESERVATIONIST , dsp.titles.LIFE_SAVER , dsp.titles.CARD_COLLECTOR , dsp.titles.TWOS_COMPANY , dsp.titles.TRADER_OF_ANTIQUITIES , dsp.titles.GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN ,
                dsp.titles.TENSHODO_MEMBER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.ACTIVIST_FOR_KINDNESS , dsp.titles.ENVOY_TO_THE_NORTH , dsp.titles.EXORCIST_IN_TRAINING , dsp.titles.FOOLS_ERRAND_RUNNER , dsp.titles.STREET_SWEEPER ,
                dsp.titles.MERCY_ERRAND_RUNNER , dsp.titles.BELIEVER_OF_ALTANA , dsp.titles.TRADER_OF_MYSTERIES , dsp.titles.WANDERING_MINSTREL , dsp.titles.ANIMAL_TRAINER , dsp.titles.HAVE_WINGS_WILL_FLY ,
                dsp.titles.ROD_RETRIEVER , dsp.titles.DESTINED_FELLOW , dsp.titles.TROUPE_BRILIOTH_DANCER , dsp.titles.PROMISING_DANCER , dsp.titles.STARDUST_DANCER ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.TIMEKEEPER , dsp.titles.BRINGER_OF_BLISS , dsp.titles.PROFESSIONAL_LOAFER , dsp.titles.TRADER_OF_RENOWN , dsp.titles.HORIZON_BREAKER , dsp.titles.SUMMIT_BREAKER ,
                dsp.titles.BROWN_BELT , dsp.titles.DUCAL_DUPE , dsp.titles.CHOCOBO_LOVE_GURU , dsp.titles.PICKUP_ARTIST , dsp.titles.WORTHY_OF_TRUST , dsp.titles.A_FRIEND_INDEED , dsp.titles.CHOCOROOKIE , dsp.titles.CRYSTAL_STAKES_CUPHOLDER ,
                dsp.titles.WINNING_OWNER , dsp.titles.VICTORIOUS_OWNER , dsp.titles.TRIUMPHANT_OWNER , dsp.titles.HIGH_ROLLER , dsp.titles.FORTUNES_FAVORITE , dsp.titles.CHOCOCHAMPION ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.titles.PARAGON_OF_BEASTMASTER_EXCELLENCE , dsp.titles.PARAGON_OF_BARD_EXCELLENCE , dsp.titles.SKY_BREAKER , dsp.titles.BLACK_BELT , dsp.titles.GREEDALOX , dsp.titles.CLOUD_BREAKER ,
                dsp.titles.STAR_BREAKER , dsp.titles.ULTIMATE_CHAMPION_OF_THE_WORLD , dsp.titles.DYNAMISJEUNO_INTERLOPER , dsp.titles.DYNAMISBEAUCEDINE_INTERLOPER , dsp.titles.DYNAMISXARCABARD_INTERLOPER ,
                dsp.titles.DYNAMISQUFIM_INTERLOPER , dsp.titles.CONQUEROR_OF_FATE , dsp.titles.SUPERHERO , dsp.titles.SUPERHEROINE , dsp.titles.ELEGANT_DANCER , dsp.titles.DAZZLING_DANCE_DIVA , dsp.titles.GRIMOIRE_BEARER ,
                dsp.titles.FELLOW_FORTIFIER , dsp.titles.BUSHIN_ASPIRANT , dsp.titles.BUSHIN_RYU_INHERITOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.titles.GRAND_GREEDALOX , dsp.titles.SILENCER_OF_THE_ECHO , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10014,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
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