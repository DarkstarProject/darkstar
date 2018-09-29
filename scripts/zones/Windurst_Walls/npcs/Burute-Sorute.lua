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

local title2 = { dsp.title.NEW_ADVENTURER , dsp.title.CAT_BURGLAR_GROUPIE , dsp.title.CRAWLER_CULLER , dsp.title.STAR_ONION_BRIGADE_MEMBER , dsp.title.SOB_SUPER_HERO ,
            dsp.title.EDITORS_HATCHET_MAN , dsp.title.SUPER_MODEL , dsp.title.FAST_FOOD_DELIVERER , dsp.title.CARDIAN_TUTOR , dsp.title.KISSER_MAKEUPPER , dsp.title.LOWER_THAN_THE_LOWEST_TUNNEL_WORM ,
            dsp.title.FRESH_NORTH_WINDS_RECRUIT , dsp.title.HEAVENS_TOWER_GATEHOUSE_RECRUIT , dsp.title.NEW_BEST_OF_THE_WEST_RECRUIT , dsp.title.NEW_BUUMAS_BOOMERS_RECRUIT ,
            dsp.title.MOGS_MASTER, dsp.title.EMERALD_EXTERMINATOR , dsp.title.DISCERNING_INDIVIDUAL , dsp.title.VERY_DISCERNING_INDIVIDUAL , dsp.title.EXTREMELY_DISCERNING_INDIVIDUAL ,
            dsp.title.BABBANS_TRAVELING_COMPANION , 0 , 0 , 0 , 0 , 0 , 0, 0 }
local title3 = { dsp.title.SAVIOR_OF_KNOWLEDGE , dsp.title.STAR_ONION_BRIGADIER , dsp.title.QUICK_FIXER , dsp.title.FAKEMOUSTACHED_INVESTIGATOR , dsp.title.CUPIDS_FLORIST ,
            dsp.title.TARUTARU_MURDER_SUSPECT , dsp.title.HEXER_VEXER , dsp.title.GREAT_GRAPPLER_SCORPIO , dsp.title.CERTIFIED_ADVENTURER , dsp.title.BOND_FIXER , dsp.title.FOSSILIZED_SEA_FARER ,
            dsp.title.MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0}
local title4 = { dsp.title.HAKKURURINKURUS_BENEFACTOR , dsp.title.SPOILSPORT , dsp.title.PILGRIM_TO_MEA , dsp.title.TOTAL_LOSER , dsp.title.DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH ,
            dsp.title.THE_FANGED_ONE , dsp.title.RAINBOW_WEAVER , dsp.title.FINE_TUNER , dsp.title.DOCTOR_SHANTOTTOS_GUINEA_PIG , dsp.title.GHOSTIE_BUSTER , dsp.title.NIGHT_SKY_NAVIGATOR ,
            dsp.title.DELIVERER_OF_TEARFUL_NEWS , dsp.title.DOWN_PIPER_PIPEUPPERER , dsp.title.DOCTOR_YORANORAN_SUPPORTER , dsp.title.DOCTOR_SHANTOTTO_SUPPORTER ,
            dsp.title.PROFESSOR_KORUMORU_SUPPORTER , dsp.title.STARORDAINED_WARRIOR  , dsp.title.SHADOW_BANISHER , dsp.title.MOGS_EXCEPTIONALLY_KIND_MASTER , dsp.title.FRIEND_OF_THE_HELMED ,
            dsp.title.DEED_VERIFIER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.title.PARAGON_OF_THIEF_EXCELLENCE , dsp.title.PARAGON_OF_BLACK_MAGE_EXCELLENCE , dsp.title.PARAGON_OF_RANGER_EXCELLENCE , dsp.title.PARAGON_OF_SUMMONER_EXCELLENCE  ,
            dsp.title.CERTIFIED_RHINOSTERY_VENTURER , dsp.title.DREAM_DWELLER , dsp.title.HERO_ON_BEHALF_OF_WINDURST , dsp.title.VICTOR_OF_THE_BALGA_CONTEST , dsp.title.MOGS_LOVING_MASTER ,
            dsp.title.HEIR_OF_THE_NEW_MOON , dsp.title.SEEKER_OF_TRUTH  , dsp.title.FUGITIVE_MINISTER_BOUNTY_HUNTER , dsp.title.GUIDING_STAR , dsp.title.VESTAL_CHAMBERLAIN ,
            dsp.title.DYNAMISWINDURST_INTERLOPER  , dsp.title.HEIR_TO_THE_REALM_OF_DREAMS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0 , 0 }
local title6 = { dsp.title.FREESWORD , dsp.title.MERCENARY , dsp.title.MERCENARY_CAPTAIN , dsp.title.COMBAT_CASTER , dsp.title.TACTICIAN_MAGICIAN , dsp.title.WISE_WIZARD  ,
            dsp.title.PATRIARCH_PROTECTOR , dsp.title.CASTER_CAPTAIN , dsp.title.MASTER_CASTER , dsp.title.MERCENARY_MAJOR , dsp.title.KNITTING_KNOWITALL , dsp.title.LOOM_LUNATIC ,
            dsp.title.ACCOMPLISHED_WEAVER , dsp.title.BOUTIQUE_OWNER , dsp.title.BONE_BEAUTIFIER , dsp.title.SHELL_SCRIMSHANDER , dsp.title.ACCOMPLISHED_BONEWORKER , dsp.title.CURIOSITY_SHOP_OWNER ,
            dsp.title.FASTRIVER_FISHER , dsp.title.COASTLINE_CASTER , dsp.title.ACCOMPLISHED_ANGLER , dsp.title.FISHMONGER_OWNER , dsp.title.GOURMAND_GRATIFIER , dsp.title.BANQUET_BESTOWER ,
            dsp.title.ACCOMPLISHED_CHEF , dsp.title.RESTAURANT_OWNER , 0 , 0 }
local title7 = { dsp.title.MOG_HOUSE_HANDYPERSON , dsp.title.ARRESTER_OF_THE_ASCENSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
            0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10004,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
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