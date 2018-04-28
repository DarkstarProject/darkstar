-----------------------------------
-- Area: Port Jeuno
--  NPC: ZuahLepahnyu
-- Title Change NPC
-- !pos 0 0 8 246
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.VISITOR_TO_ABYSSEA , dsp.titles.FRIEND_OF_ABYSSEA , dsp.titles.WARRIOR_OF_ABYSSEA , dsp.titles.STORMER_OF_ABYSSEA , dsp.titles.DEVASTATOR_OF_ABYSSEA ,
                dsp.titles.HERO_OF_ABYSSEA , dsp.titles.CHAMPION_OF_ABYSSEA , dsp.titles.CONQUEROR_OF_ABYSSEA , dsp.titles.SAVIOR_OF_ABYSSEA , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.GOLDWING_SQUASHER , dsp.titles.SILAGILITH_DETONATOR , dsp.titles.SURTR_SMOTHERER , dsp.titles.DREYRUK_PREDOMINATOR , dsp.titles.SAMURSK_VITIATOR ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.YAANEI_CRASHER , dsp.titles.KUTHAREI_UNHORSER , dsp.titles.SIPPOY_CAPTURER , dsp.titles.RANI_DECROWNER , dsp.titles.ORTHRUS_DECAPITATOR , dsp.titles.DRAGUA_SLAYER ,
                dsp.titles.BENNU_DEPLUMER , dsp.titles.HEDJEDJET_DESTINGER , dsp.titles.CUIJATENDER_DESICCATOR , dsp.titles.BRULO_EXTINGUISHER , dsp.titles.PANTOKRATOR_DISPROVER , dsp.titles.APADEMAK_ANNIHILATOR ,
                dsp.titles.ISGEBIND_DEFROSTER , dsp.titles.RESHEPH_ERADICATOR , dsp.titles.EMPOUSA_EXPURGATOR , dsp.titles.INDRIK_IMMOLATOR , dsp.titles.OGOPOGO_OVERTURNER , dsp.titles.RAJA_REGICIDE , dsp.titles.ALFARD_DETOXIFIER ,
                dsp.titles.AZDAJA_ABOLISHER , dsp.titles.AMPHITRITE_SHUCKER , dsp.titles.FUATH_PURIFIER , dsp.titles.KILLAKRIQ_EXCORIATOR , dsp.titles.MAERE_BESTIRRER , dsp.titles.WYRM_GOD_DEFIER , 0 , 0 , 0 }
local title5 = { dsp.titles.TITLACAUAN_DISMEMBERER , dsp.titles.SMOK_DEFOGGER , dsp.titles.AMHULUK_INUNDATER , dsp.titles.PULVERIZER_DISMANTLER , dsp.titles.DURINN_DECEIVER , dsp.titles.KARKADANN_EXOCULATOR ,
                0 , 0 , 0 , 0 , 0 , dsp.titles.TEMENOS_EMANCIPATOR , dsp.titles.APOLLYON_RAZER , dsp.titles.UMAGRHK_MANEMANGLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.titles.KARKINOS_CLAWCRUSHER , dsp.titles.CARABOSSE_QUASHER , dsp.titles.OVNI_OBLITERATOR , dsp.titles.RUMINATOR_CONFOUNDER , dsp.titles.FISTULE_DRAINER , dsp.titles.TURUL_GROUNDER ,
                dsp.titles.BLOODEYE_BANISHER , dsp.titles.SATIATOR_DEPRIVER , dsp.titles.CHLORIS_UPROOTER , dsp.titles.MYRMECOLEON_TAMER , dsp.titles.GLAVOID_STAMPEDER , dsp.titles.USURPER_DEPOSER , dsp.titles.ULHUADSHI_DESICCATOR ,
                dsp.titles.ITZPAPALOTL_DECLAWER , dsp.titles.SOBEK_MUMMIFIER , dsp.titles.CIREINCROIN_HARPOONER , dsp.titles.BUKHIS_TETHERER , dsp.titles.SEDNA_TUSKBREAKER , dsp.titles.CLEAVER_DISMANTLER ,
                dsp.titles.EXECUTIONER_DISMANTLER , dsp.titles.SEVERER_DISMANTLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { dsp.titles.HADHAYOSH_HALTERER , dsp.titles.BRIAREUS_FELLER , dsp.titles.ECCENTRICITY_EXPUNGER , dsp.titles.KUKULKAN_DEFANGER , dsp.titles.IRATHAM_CAPTURER , dsp.titles.LACOVIE_CAPSIZER ,
                dsp.titles.LUSCA_DEBUNKER , dsp.titles.TRISTITIA_DELIVERER , dsp.titles.KETEA_BEACHER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(330,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==330) then
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