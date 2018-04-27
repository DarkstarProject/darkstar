-----------------------------------
-- Area: Windurst Walls
--   NPC: Burute-Sorute
-- Type: Title Change NPC
-- @zone 239
-- !pos 0.080 -10.765 5.394 239
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.NEW_ADVENTURER , dsp.titles.CAT_BURGLAR_GROUPIE , dsp.titles.CRAWLER_CULLER , dsp.titles.STAR_ONION_BRIGADE_MEMBER , dsp.titles.SOB_SUPER_HERO ,
            dsp.titles.EDITORS_HATCHET_MAN , dsp.titles.SUPER_MODEL , dsp.titles.FAST_FOOD_DELIVERER , dsp.titles.CARDIAN_TUTOR , dsp.titles.KISSER_MAKEUPPER , dsp.titles.LOWER_THAN_THE_LOWEST_TUNNEL_WORM ,
            dsp.titles.FRESH_NORTH_WINDS_RECRUIT , dsp.titles.HEAVENS_TOWER_GATEHOUSE_RECRUIT , dsp.titles.NEW_BEST_OF_THE_WEST_RECRUIT , dsp.titles.NEW_BUUMAS_BOOMERS_RECRUIT ,
            dsp.titles.MOGS_MASTER, dsp.titles.EMERALD_EXTERMINATOR , dsp.titles.DISCERNING_INDIVIDUAL , dsp.titles.VERY_DISCERNING_INDIVIDUAL , dsp.titles.EXTREMELY_DISCERNING_INDIVIDUAL ,
            dsp.titles.BABBANS_TRAVELING_COMPANION , 0 , 0 , 0 , 0 , 0 , 0, 0 }
local title3 = { dsp.titles.SAVIOR_OF_KNOWLEDGE , dsp.titles.STAR_ONION_BRIGADIER , dsp.titles.QUICK_FIXER , dsp.titles.FAKEMOUSTACHED_INVESTIGATOR , dsp.titles.CUPIDS_FLORIST ,
            dsp.titles.TARUTARU_MURDER_SUSPECT , dsp.titles.HEXER_VEXER , dsp.titles.GREAT_GRAPPLER_SCORPIO , dsp.titles.CERTIFIED_ADVENTURER , dsp.titles.BOND_FIXER , dsp.titles.FOSSILIZED_SEA_FARER ,
            dsp.titles.MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0}
local title4 = { dsp.titles.HAKKURURINKURUS_BENEFACTOR , dsp.titles.SPOILSPORT , dsp.titles.PILGRIM_TO_MEA , dsp.titles.TOTAL_LOSER , dsp.titles.DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH ,
            dsp.titles.THE_FANGED_ONE , dsp.titles.RAINBOW_WEAVER , dsp.titles.FINE_TUNER , dsp.titles.DOCTOR_SHANTOTTOS_GUINEA_PIG , dsp.titles.GHOSTIE_BUSTER , dsp.titles.NIGHT_SKY_NAVIGATOR ,
            dsp.titles.DELIVERER_OF_TEARFUL_NEWS , dsp.titles.DOWN_PIPER_PIPEUPPERER , dsp.titles.DOCTOR_YORANORAN_SUPPORTER , dsp.titles.DOCTOR_SHANTOTTO_SUPPORTER ,
            dsp.titles.PROFESSOR_KORUMORU_SUPPORTER , dsp.titles.STARORDAINED_WARRIOR  , dsp.titles.SHADOW_BANISHER , dsp.titles.MOGS_EXCEPTIONALLY_KIND_MASTER , dsp.titles.FRIEND_OF_THE_HELMED ,
            dsp.titles.DEED_VERIFIER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.titles.PARAGON_OF_THIEF_EXCELLENCE , dsp.titles.PARAGON_OF_BLACK_MAGE_EXCELLENCE , dsp.titles.PARAGON_OF_RANGER_EXCELLENCE , dsp.titles.PARAGON_OF_SUMMONER_EXCELLENCE  ,
            dsp.titles.CERTIFIED_RHINOSTERY_VENTURER , dsp.titles.DREAM_DWELLER , dsp.titles.HERO_ON_BEHALF_OF_WINDURST , dsp.titles.VICTOR_OF_THE_BALGA_CONTEST , dsp.titles.MOGS_LOVING_MASTER ,
            dsp.titles.HEIR_OF_THE_NEW_MOON , dsp.titles.SEEKER_OF_TRUTH  , dsp.titles.FUGITIVE_MINISTER_BOUNTY_HUNTER , dsp.titles.GUIDING_STAR , dsp.titles.VESTAL_CHAMBERLAIN ,
            dsp.titles.DYNAMISWINDURST_INTERLOPER  , dsp.titles.HEIR_TO_THE_REALM_OF_DREAMS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0 , 0 }
local title6 = { dsp.titles.FREESWORD , dsp.titles.MERCENARY , dsp.titles.MERCENARY_CAPTAIN , dsp.titles.COMBAT_CASTER , dsp.titles.TACTICIAN_MAGICIAN , dsp.titles.WISE_WIZARD  ,
            dsp.titles.PATRIARCH_PROTECTOR , dsp.titles.CASTER_CAPTAIN , dsp.titles.MASTER_CASTER , dsp.titles.MERCENARY_MAJOR , dsp.titles.KNITTING_KNOWITALL , dsp.titles.LOOM_LUNATIC ,
            dsp.titles.ACCOMPLISHED_WEAVER , dsp.titles.BOUTIQUE_OWNER , dsp.titles.BONE_BEAUTIFIER , dsp.titles.SHELL_SCRIMSHANDER , dsp.titles.ACCOMPLISHED_BONEWORKER , dsp.titles.CURIOSITY_SHOP_OWNER ,
            dsp.titles.FASTRIVER_FISHER , dsp.titles.COASTLINE_CASTER , dsp.titles.ACCOMPLISHED_ANGLER , dsp.titles.FISHMONGER_OWNER , dsp.titles.GOURMAND_GRATIFIER , dsp.titles.BANQUET_BESTOWER ,
            dsp.titles.ACCOMPLISHED_CHEF , dsp.titles.RESTAURANT_OWNER , 0 , 0 }
local title7 = { dsp.titles.MOG_HOUSE_HANDYPERSON , dsp.titles.ARRESTER_OF_THE_ASCENSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
            0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10004,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
    if (csid==10004) then
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
        elseif (option > 768 and option <797) then
            if (player:delGil(500)) then
                player:setTitle( title5[option - 768] )
            end
        elseif (option > 1024 and option < 1053) then
            if (player:delGil(600)) then
                player:setTitle( title6[option - 1024] )
            end
        elseif (option > 1280 and option < 1309) then
            if (player:delGil(700)) then
                player:setTitle(  title7[option - 1280] )
            end
        end
    end
end;