-----------------------------------
-- Area: Port Jeuno
--  NPC: ZuahLepahnyu
-- Title Change NPC
-- !pos 0 0 8 246
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.VISITOR_TO_ABYSSEA , dsp.title.FRIEND_OF_ABYSSEA , dsp.title.WARRIOR_OF_ABYSSEA , dsp.title.STORMER_OF_ABYSSEA , dsp.title.DEVASTATOR_OF_ABYSSEA ,
                dsp.title.HERO_OF_ABYSSEA , dsp.title.CHAMPION_OF_ABYSSEA , dsp.title.CONQUEROR_OF_ABYSSEA , dsp.title.SAVIOR_OF_ABYSSEA , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.GOLDWING_SQUASHER , dsp.title.SILAGILITH_DETONATOR , dsp.title.SURTR_SMOTHERER , dsp.title.DREYRUK_PREDOMINATOR , dsp.title.SAMURSK_VITIATOR ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.YAANEI_CRASHER , dsp.title.KUTHAREI_UNHORSER , dsp.title.SIPPOY_CAPTURER , dsp.title.RANI_DECROWNER , dsp.title.ORTHRUS_DECAPITATOR , dsp.title.DRAGUA_SLAYER ,
                dsp.title.BENNU_DEPLUMER , dsp.title.HEDJEDJET_DESTINGER , dsp.title.CUIJATENDER_DESICCATOR , dsp.title.BRULO_EXTINGUISHER , dsp.title.PANTOKRATOR_DISPROVER , dsp.title.APADEMAK_ANNIHILATOR ,
                dsp.title.ISGEBIND_DEFROSTER , dsp.title.RESHEPH_ERADICATOR , dsp.title.EMPOUSA_EXPURGATOR , dsp.title.INDRIK_IMMOLATOR , dsp.title.OGOPOGO_OVERTURNER , dsp.title.RAJA_REGICIDE , dsp.title.ALFARD_DETOXIFIER ,
                dsp.title.AZDAJA_ABOLISHER , dsp.title.AMPHITRITE_SHUCKER , dsp.title.FUATH_PURIFIER , dsp.title.KILLAKRIQ_EXCORIATOR , dsp.title.MAERE_BESTIRRER , dsp.title.WYRM_GOD_DEFIER , 0 , 0 , 0 }
local title5 = { dsp.title.TITLACAUAN_DISMEMBERER , dsp.title.SMOK_DEFOGGER , dsp.title.AMHULUK_INUNDATER , dsp.title.PULVERIZER_DISMANTLER , dsp.title.DURINN_DECEIVER , dsp.title.KARKADANN_EXOCULATOR ,
                0 , 0 , 0 , 0 , 0 , dsp.title.TEMENOS_EMANCIPATOR , dsp.title.APOLLYON_RAZER , dsp.title.UMAGRHK_MANEMANGLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.title.KARKINOS_CLAWCRUSHER , dsp.title.CARABOSSE_QUASHER , dsp.title.OVNI_OBLITERATOR , dsp.title.RUMINATOR_CONFOUNDER , dsp.title.FISTULE_DRAINER , dsp.title.TURUL_GROUNDER ,
                dsp.title.BLOODEYE_BANISHER , dsp.title.SATIATOR_DEPRIVER , dsp.title.CHLORIS_UPROOTER , dsp.title.MYRMECOLEON_TAMER , dsp.title.GLAVOID_STAMPEDER , dsp.title.USURPER_DEPOSER , dsp.title.ULHUADSHI_DESICCATOR ,
                dsp.title.ITZPAPALOTL_DECLAWER , dsp.title.SOBEK_MUMMIFIER , dsp.title.CIREINCROIN_HARPOONER , dsp.title.BUKHIS_TETHERER , dsp.title.SEDNA_TUSKBREAKER , dsp.title.CLEAVER_DISMANTLER ,
                dsp.title.EXECUTIONER_DISMANTLER , dsp.title.SEVERER_DISMANTLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { dsp.title.HADHAYOSH_HALTERER , dsp.title.BRIAREUS_FELLER , dsp.title.ECCENTRICITY_EXPUNGER , dsp.title.KUKULKAN_DEFANGER , dsp.title.IRATHAM_CAPTURER , dsp.title.LACOVIE_CAPSIZER ,
                dsp.title.LUSCA_DEBUNKER , dsp.title.TRISTITIA_DELIVERER , dsp.title.KETEA_BEACHER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(330,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
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