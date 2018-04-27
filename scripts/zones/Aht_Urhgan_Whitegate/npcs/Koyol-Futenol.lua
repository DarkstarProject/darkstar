-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Koyol-Futenol
-- Title Change NPC
-- !pos -129 2 -20 50
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.DARK_RESISTANT , dsp.titles.BEARER_OF_THE_MARK_OF_ZAHAK  , dsp.titles.SEAGULL_PHRATRIE_CREW_MEMBER , dsp.titles.PROUD_AUTOMATON_OWNER , dsp.titles.WILDCAT_PUBLICIST ,
                dsp.titles.SCENIC_SNAPSHOTTER , dsp.titles.BRANDED_BY_THE_FIVE_SERPENTS , dsp.titles.IMMORTAL_LION , dsp.titles.PARAGON_OF_BLUE_MAGE_EXCELLENCE , dsp.titles.PARAGON_OF_CORSAIR_EXCELLENCE , dsp.titles.PARAGON_OF_PUPPETMASTER_EXCELLENCE ,
                dsp.titles.MASTER_OF_AMBITION , dsp.titles.MASTER_OF_CHANCE , dsp.titles.SKYSERPENT_AGGRANDIZER , dsp.titles.GALESERPENT_GUARDIAN , dsp.titles.STONESERPENT_SHOCKTROOPER , dsp.titles.PHOTOPTICATOR_OPERATOR ,
                dsp.titles.SPRINGSERPENT_SENTRY , dsp.titles.FLAMESERPENT_FACILITATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.PRIVATE_SECOND_CLASS , dsp.titles.PRIVATE_FIRST_CLASS , dsp.titles.SUPERIOR_PRIVATE , dsp.titles.LANCE_CORPORAL , dsp.titles.CORPORAL , dsp.titles.SERGEANT , dsp.titles.SERGEANT_MAJOR , dsp.titles.CHIEF_SERGEANT ,
                dsp.titles.SECOND_LIEUTENANT , dsp.titles.FIRST_LIEUTENANT , dsp.titles.AGENT_OF_THE_ALLIED_FORCES , dsp.titles.OVJANGS_ERRAND_RUNNER , dsp.titles.KARABABAS_TOUR_GUIDE , dsp.titles.KARABABAS_BODYGUARD , dsp.titles.KARABABAS_SECRET_AGENT ,
                dsp.titles.APHMAUS_MERCENARY , dsp.titles.NASHMEIRAS_MERCENARY , dsp.titles.SALAHEEMS_RISK_ASSESSOR , dsp.titles.TREASURE_TROVE_TENDER , dsp.titles.GESSHOS_MERCY , dsp.titles.EMISSARY_OF_THE_EMPRESS , dsp.titles.ENDYMION_PARATROOPER ,
                dsp.titles.NAJAS_COMRADEINARMS , dsp.titles.NASHMEIRAS_LOYALIST , dsp.titles.PREVENTER_OF_RAGNAROK , dsp.titles.CHAMPION_OF_AHT_URHGAN , dsp.titles.ETERNAL_MERCENARY , dsp.titles.CAPTAIN }
local title4 = { dsp.titles.SUBDUER_OF_THE_MAMOOL_JA , dsp.titles.SUBDUER_OF_THE_TROLLS , dsp.titles.SUBDUER_OF_THE_UNDEAD_SWARM , dsp.titles.CERBERUS_MUZZLER , dsp.titles.HYDRA_HEADHUNTER , dsp.titles.SHINING_SCALE_RIFLER ,
                dsp.titles.TROLL_SUBJUGATOR , dsp.titles.GORGONSTONE_SUNDERER , dsp.titles.KHIMAIRA_CARVER , dsp.titles.ELITE_EINHERJAR , dsp.titles.STAR_CHARIOTEER , dsp.titles.SUN_CHARIOTEER , dsp.titles.COMET_CHARIOTEER , dsp.titles.MOON_CHARIOTEER ,
                dsp.titles.BLOODY_BERSERKER , dsp.titles.THE_SIXTH_SERPENT , dsp.titles.OUPIRE_IMPALER , dsp.titles.HEIR_OF_THE_BLESSED_RADIANCE , dsp.titles.HEIR_OF_THE_BLIGHTED_GLOOM , dsp.titles.SWORN_TO_THE_DARK_DIVINITY ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , dsp.titles.SUPERNAL_SAVANT , dsp.titles.SOLAR_SAGE , dsp.titles.BOLIDE_BARON , dsp.titles.MOON_MAVEN  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(644,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==644) then
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
        end
    end
end;