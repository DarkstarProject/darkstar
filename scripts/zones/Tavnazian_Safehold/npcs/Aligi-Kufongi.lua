-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Aligi-Kufongi
-- Title Change NPC
-- !pos -23 -21 15 26
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.TAVNAZIAN_SQUIRE ,dsp.title.PUTRID_PURVEYOR_OF_PUNGENT_PETALS , dsp.title.MONARCH_LINN_PATROL_GUARD , dsp.title.SIN_HUNTER_HUNTER , dsp.title.DISCIPLE_OF_JUSTICE , dsp.title.DYNAMISTAVNAZIA_INTERLOPER ,
                dsp.title.CONFRONTER_OF_NIGHTMARES , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.DEAD_BODY , dsp.title.FROZEN_DEAD_BODY , dsp.title.DREAMBREAKER , dsp.title.MIST_MELTER , dsp.title.DELTA_ENFORCER , dsp.title.OMEGA_OSTRACIZER , dsp.title.ULTIMA_UNDERTAKER ,
                dsp.title.ULMIAS_SOULMATE , dsp.title.TENZENS_ALLY , dsp.title.COMPANION_OF_LOUVERANCE , dsp.title.TRUE_COMPANION_OF_LOUVERANCE  , dsp.title.PRISHES_BUDDY  , dsp.title.NAGMOLADAS_UNDERLING ,
                dsp.title.ESHANTARLS_COMRADE_IN_ARMS , dsp.title.THE_CHEBUKKIS_WORST_NIGHTMARE , dsp.title.UNQUENCHABLE_LIGHT , dsp.title.WARRIOR_OF_THE_CRYSTAL  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.ANCIENT_FLAME_FOLLOWER , dsp.title.TAVNAZIAN_TRAVELER , dsp.title.TRANSIENT_DREAMER , dsp.title.THE_LOST_ONE , dsp.title.TREADER_OF_AN_ICY_PAST , dsp.title.BRANDED_BY_LIGHTNING ,
                dsp.title.SEEKER_OF_THE_LIGHT , dsp.title.AVERTER_OF_THE_APOCALYPSE , dsp.title.BANISHER_OF_EMPTINESS , dsp.title.BREAKER_OF_THE_CHAINS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(342,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
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