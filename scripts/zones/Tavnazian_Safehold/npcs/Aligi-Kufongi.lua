-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Aligi-Kufongi
-- Title Change NPC
-- !pos -23 -21 15 26
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.TAVNAZIAN_SQUIRE ,dsp.titles.PUTRID_PURVEYOR_OF_PUNGENT_PETALS , dsp.titles.MONARCH_LINN_PATROL_GUARD , dsp.titles.SIN_HUNTER_HUNTER , dsp.titles.DISCIPLE_OF_JUSTICE , dsp.titles.DYNAMISTAVNAZIA_INTERLOPER ,
                dsp.titles.CONFRONTER_OF_NIGHTMARES , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.DEAD_BODY , dsp.titles.FROZEN_DEAD_BODY , dsp.titles.DREAMBREAKER , dsp.titles.MIST_MELTER , dsp.titles.DELTA_ENFORCER , dsp.titles.OMEGA_OSTRACIZER , dsp.titles.ULTIMA_UNDERTAKER ,
                dsp.titles.ULMIAS_SOULMATE , dsp.titles.TENZENS_ALLY , dsp.titles.COMPANION_OF_LOUVERANCE , dsp.titles.TRUE_COMPANION_OF_LOUVERANCE  , dsp.titles.PRISHES_BUDDY  , dsp.titles.NAGMOLADAS_UNDERLING ,
                dsp.titles.ESHANTARLS_COMRADE_IN_ARMS , dsp.titles.THE_CHEBUKKIS_WORST_NIGHTMARE , dsp.titles.UNQUENCHABLE_LIGHT , dsp.titles.WARRIOR_OF_THE_CRYSTAL  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.ANCIENT_FLAME_FOLLOWER , dsp.titles.TAVNAZIAN_TRAVELER , dsp.titles.TRANSIENT_DREAMER , dsp.titles.THE_LOST_ONE , dsp.titles.TREADER_OF_AN_ICY_PAST , dsp.titles.BRANDED_BY_LIGHTNING ,
                dsp.titles.SEEKER_OF_THE_LIGHT , dsp.titles.AVERTER_OF_THE_APOCALYPSE , dsp.titles.BANISHER_OF_EMPTINESS , dsp.titles.BREAKER_OF_THE_CHAINS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(342,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
    if (csid == 342) then
        if (option > 0 and option <29) then
            if (player:delGil(200)) then
                player:setTitle( title2[option] )
            end
        elseif (option > 256 and option <285) then
            if (player:delGil(300)) then
                player:setTitle( title3[option - 256] )
            end
        elseif (option > 512 and option < 541) then
            if (player:delGil(400)) then
                player:setTitle( title4[option - 512] )
            end
        end
    end
end;