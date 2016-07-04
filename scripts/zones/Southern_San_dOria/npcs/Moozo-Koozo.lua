-----------------------------------
--    Area: Southern San d'Oria
--    NPC: Moozo-Koozo
--  Title Change NPC
--  @pos 83 0 120 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

local title2 = { NEW_ADVENTURER , BEAN_CUISINE_SALTER , DAYBREAK_GAMBLER , ENTRANCE_DENIED , RABBITER , ROYAL_GRAVE_KEEPER ,
                COURIER_EXTRAORDINAIRE , RONFAURIAN_RESCUER , PICKPOCKET_PINCHER , THE_PURE_ONE , LOST_CHILD_OFFICER , SILENCER_OF_THE_LAMBS ,
                LOST_AMP_FOUND_OFFICER , GREEN_GROCER , THE_BENEVOLENT_ONE , KNIGHT_IN_TRAINING , ADVERTISING_EXECUTIVE , FAMILY_COUNSELOR ,
                MOGS_MASTER , VERMILLION_VENTURER , DISCERNING_INDIVIDUAL , VERY_DISCERNING_INDIVIDUAL , EXTREMELY_DISCERNING_INDIVIDUAL ,
                0 , 0 , 0 , 0 , 0 }
local title3 = { SHEEPS_MILK_DELIVERER , THE_PIOUS_ONE , APIARIST , FAITH_LIKE_A_CANDLE , LIZARD_SKINNER , BUG_CATCHER ,
                SPELUNKER , ARMS_TRADER , THIRDRATE_ORGANIZER , ROYAL_WEDDING_PLANNER , CONSORT_CANDIDATE , CERTIFIED_ADVENTURER , VAMPIRE_HUNTER_DMINUS ,
                A_MOSS_KIND_PERSON , FANG_FINDER , TRAVELING_MEDICINE_MAN , CAT_SKINNER , CARP_DIEM , SECONDRATE_ORGANIZER , MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { FIRSTRATE_ORGANIZER , PILGRIM_TO_HOLLA , TRIED_AND_TESTED_KNIGHT , HEIR_TO_THE_HOLY_CREST , OBSIDIAN_STORM ,
                TALKS_WITH_TONBERRIES , SHADOW_BANISHER , MOGS_EXCEPTIONALLY_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { SEARING_STAR , STRIKING_STAR , SOOTHING_STAR , SABLE_STAR , SCARLET_STAR , SONIC_STAR , SAINTLY_STAR , SHADOWY_STAR ,
                SAVAGE_STAR , SINGING_STAR , SNIPING_STAR , SLICING_STAR , SNEAKING_STAR , SPEARING_STAR , SUMMONING_STAR , SAPPHIRE_STAR ,
                SURGING_STAR , SWAYING_STAR , SPRIGHTLY_STAR , SAGACIOUS_STAR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { ROOK_BUSTER , BANNERET , GOLD_BALLI_STAR , MYTHRIL_BALLI_STAR , SILVER_BALLI_STAR , BRONZE_BALLI_STAR , BALLISTAGER ,
                FINAL_BALLI_STAR , BALLI_STAR_ROYALE , PARAGON_OF_RED_MAGE_EXCELLENCE , PARAGON_OF_WHITE_MAGE_EXCELLENCE , PARAGON_OF_PALADIN_EXCELLENCE ,
                PARAGON_OF_DRAGOON_EXCELLENCE , HEIR_OF_THE_GREAT_ICE , MOGS_LOVING_MASTER , SAN_DORIAN_ROYAL_HEIR , DYNAMISSAN_DORIA_INTERLOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { ROYAL_ARCHER , ROYAL_SPEARMAN , ROYAL_SQUIRE , ROYAL_SWORDSMAN , ROYAL_CAVALIER , ROYAL_GUARD , GRAND_KNIGHT_OF_THE_REALM ,
                GRAND_TEMPLE_KNIGHT , RESERVE_KNIGHT_CAPTAIN , ELITE_ROYAL_GUARD , WOOD_WORSHIPER , LUMBER_LATHER , ACCOMPLISHED_CARPENTER ,
                ANVIL_ADVOCATE , FORGE_FANATIC , ACCOMPLISHED_BLACKSMITH , ARMORY_OWNER , HIDE_HANDLER , LEATHER_LAUDER , ACCOMPLISHED_TANNER ,
                SHOESHOP_OWNER , MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

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

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x2A3,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),0,npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==0x2A3) then
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