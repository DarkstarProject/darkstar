-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Moozo-Koozo
--  Title Change NPC
-- !pos 83 0 120 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

local title2 = { dsp.titles.NEW_ADVENTURER , dsp.titles.BEAN_CUISINE_SALTER , dsp.titles.DAYBREAK_GAMBLER , dsp.titles.ENTRANCE_DENIED , dsp.titles.RABBITER , dsp.titles.ROYAL_GRAVE_KEEPER ,
                dsp.titles.COURIER_EXTRAORDINAIRE , dsp.titles.RONFAURIAN_RESCUER , dsp.titles.PICKPOCKET_PINCHER , dsp.titles.THE_PURE_ONE , dsp.titles.LOST_CHILD_OFFICER , dsp.titles.SILENCER_OF_THE_LAMBS ,
                dsp.titles.LOST_AMP_FOUND_OFFICER , dsp.titles.GREEN_GROCER , dsp.titles.THE_BENEVOLENT_ONE , dsp.titles.KNIGHT_IN_TRAINING , dsp.titles.ADVERTISING_EXECUTIVE , dsp.titles.FAMILY_COUNSELOR ,
                dsp.titles.MOGS_MASTER , dsp.titles.VERMILLION_VENTURER , dsp.titles.DISCERNING_INDIVIDUAL , dsp.titles.VERY_DISCERNING_INDIVIDUAL , dsp.titles.EXTREMELY_DISCERNING_INDIVIDUAL ,
                0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.SHEEPS_MILK_DELIVERER , dsp.titles.THE_PIOUS_ONE , dsp.titles.APIARIST , dsp.titles.FAITH_LIKE_A_CANDLE , dsp.titles.LIZARD_SKINNER , dsp.titles.BUG_CATCHER ,
                dsp.titles.SPELUNKER , dsp.titles.ARMS_TRADER , dsp.titles.THIRDRATE_ORGANIZER , dsp.titles.ROYAL_WEDDING_PLANNER , dsp.titles.CONSORT_CANDIDATE , dsp.titles.CERTIFIED_ADVENTURER , dsp.titles.VAMPIRE_HUNTER_DMINUS ,
                dsp.titles.A_MOSS_KIND_PERSON , dsp.titles.FANG_FINDER , dsp.titles.TRAVELING_MEDICINE_MAN , dsp.titles.CAT_SKINNER , dsp.titles.CARP_DIEM , dsp.titles.SECONDRATE_ORGANIZER , dsp.titles.MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.FIRSTRATE_ORGANIZER , dsp.titles.PILGRIM_TO_HOLLA , dsp.titles.TRIED_AND_TESTED_KNIGHT , dsp.titles.HEIR_TO_THE_HOLY_CREST , dsp.titles.OBSIDIAN_STORM ,
                dsp.titles.TALKS_WITH_TONBERRIES , dsp.titles.SHADOW_BANISHER , dsp.titles.MOGS_EXCEPTIONALLY_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.titles.SEARING_STAR , dsp.titles.STRIKING_STAR , dsp.titles.SOOTHING_STAR , dsp.titles.SABLE_STAR , dsp.titles.SCARLET_STAR , dsp.titles.SONIC_STAR , dsp.titles.SAINTLY_STAR , dsp.titles.SHADOWY_STAR ,
                dsp.titles.SAVAGE_STAR , dsp.titles.SINGING_STAR , dsp.titles.SNIPING_STAR , dsp.titles.SLICING_STAR , dsp.titles.SNEAKING_STAR , dsp.titles.SPEARING_STAR , dsp.titles.SUMMONING_STAR , dsp.titles.SAPPHIRE_STAR ,
                dsp.titles.SURGING_STAR , dsp.titles.SWAYING_STAR , dsp.titles.SPRIGHTLY_STAR , dsp.titles.SAGACIOUS_STAR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.titles.ROOK_BUSTER , dsp.titles.BANNERET , dsp.titles.GOLD_BALLI_STAR , dsp.titles.MYTHRIL_BALLI_STAR , dsp.titles.SILVER_BALLI_STAR , dsp.titles.BRONZE_BALLI_STAR , dsp.titles.BALLISTAGER ,
                dsp.titles.FINAL_BALLI_STAR , dsp.titles.BALLI_STAR_ROYALE , dsp.titles.PARAGON_OF_RED_MAGE_EXCELLENCE , dsp.titles.PARAGON_OF_WHITE_MAGE_EXCELLENCE , dsp.titles.PARAGON_OF_PALADIN_EXCELLENCE ,
                dsp.titles.PARAGON_OF_DRAGOON_EXCELLENCE , dsp.titles.HEIR_OF_THE_GREAT_ICE , dsp.titles.MOGS_LOVING_MASTER , dsp.titles.SAN_DORIAN_ROYAL_HEIR , dsp.titles.DYNAMISSAN_DORIA_INTERLOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { dsp.titles.ROYAL_ARCHER , dsp.titles.ROYAL_SPEARMAN , dsp.titles.ROYAL_SQUIRE , dsp.titles.ROYAL_SWORDSMAN , dsp.titles.ROYAL_CAVALIER , dsp.titles.ROYAL_GUARD , dsp.titles.GRAND_KNIGHT_OF_THE_REALM ,
                dsp.titles.GRAND_TEMPLE_KNIGHT , dsp.titles.RESERVE_KNIGHT_CAPTAIN , dsp.titles.ELITE_ROYAL_GUARD , dsp.titles.WOOD_WORSHIPER , dsp.titles.LUMBER_LATHER , dsp.titles.ACCOMPLISHED_CARPENTER ,
                dsp.titles.ANVIL_ADVOCATE , dsp.titles.FORGE_FANATIC , dsp.titles.ACCOMPLISHED_BLACKSMITH , dsp.titles.ARMORY_OWNER , dsp.titles.HIDE_HANDLER , dsp.titles.LEATHER_LAUDER , dsp.titles.ACCOMPLISHED_TANNER ,
                dsp.titles.SHOESHOP_OWNER , dsp.titles.MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(675,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),0,npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==675) then
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