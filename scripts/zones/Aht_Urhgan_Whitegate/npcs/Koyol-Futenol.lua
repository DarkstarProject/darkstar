-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Koyol-Futenol
-- Title Change NPC
-- !pos -129 2 -20 50
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.DARK_RESISTANT , dsp.title.BEARER_OF_THE_MARK_OF_ZAHAK  , dsp.title.SEAGULL_PHRATRIE_CREW_MEMBER , dsp.title.PROUD_AUTOMATON_OWNER , dsp.title.WILDCAT_PUBLICIST ,
                dsp.title.SCENIC_SNAPSHOTTER , dsp.title.BRANDED_BY_THE_FIVE_SERPENTS , dsp.title.IMMORTAL_LION , dsp.title.PARAGON_OF_BLUE_MAGE_EXCELLENCE , dsp.title.PARAGON_OF_CORSAIR_EXCELLENCE , dsp.title.PARAGON_OF_PUPPETMASTER_EXCELLENCE ,
                dsp.title.MASTER_OF_AMBITION , dsp.title.MASTER_OF_CHANCE , dsp.title.SKYSERPENT_AGGRANDIZER , dsp.title.GALESERPENT_GUARDIAN , dsp.title.STONESERPENT_SHOCKTROOPER , dsp.title.PHOTOPTICATOR_OPERATOR ,
                dsp.title.SPRINGSERPENT_SENTRY , dsp.title.FLAMESERPENT_FACILITATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.PRIVATE_SECOND_CLASS , dsp.title.PRIVATE_FIRST_CLASS , dsp.title.SUPERIOR_PRIVATE , dsp.title.LANCE_CORPORAL , dsp.title.CORPORAL , dsp.title.SERGEANT , dsp.title.SERGEANT_MAJOR , dsp.title.CHIEF_SERGEANT ,
                dsp.title.SECOND_LIEUTENANT , dsp.title.FIRST_LIEUTENANT , dsp.title.AGENT_OF_THE_ALLIED_FORCES , dsp.title.OVJANGS_ERRAND_RUNNER , dsp.title.KARABABAS_TOUR_GUIDE , dsp.title.KARABABAS_BODYGUARD , dsp.title.KARABABAS_SECRET_AGENT ,
                dsp.title.APHMAUS_MERCENARY , dsp.title.NASHMEIRAS_MERCENARY , dsp.title.SALAHEEMS_RISK_ASSESSOR , dsp.title.TREASURE_TROVE_TENDER , dsp.title.GESSHOS_MERCY , dsp.title.EMISSARY_OF_THE_EMPRESS , dsp.title.ENDYMION_PARATROOPER ,
                dsp.title.NAJAS_COMRADEINARMS , dsp.title.NASHMEIRAS_LOYALIST , dsp.title.PREVENTER_OF_RAGNAROK , dsp.title.CHAMPION_OF_AHT_URHGAN , dsp.title.ETERNAL_MERCENARY , dsp.title.CAPTAIN }
local title4 = { dsp.title.SUBDUER_OF_THE_MAMOOL_JA , dsp.title.SUBDUER_OF_THE_TROLLS , dsp.title.SUBDUER_OF_THE_UNDEAD_SWARM , dsp.title.CERBERUS_MUZZLER , dsp.title.HYDRA_HEADHUNTER , dsp.title.SHINING_SCALE_RIFLER ,
                dsp.title.TROLL_SUBJUGATOR , dsp.title.GORGONSTONE_SUNDERER , dsp.title.KHIMAIRA_CARVER , dsp.title.ELITE_EINHERJAR , dsp.title.STAR_CHARIOTEER , dsp.title.SUN_CHARIOTEER , dsp.title.COMET_CHARIOTEER , dsp.title.MOON_CHARIOTEER ,
                dsp.title.BLOODY_BERSERKER , dsp.title.THE_SIXTH_SERPENT , dsp.title.OUPIRE_IMPALER , dsp.title.HEIR_OF_THE_BLESSED_RADIANCE , dsp.title.HEIR_OF_THE_BLIGHTED_GLOOM , dsp.title.SWORN_TO_THE_DARK_DIVINITY ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , dsp.title.SUPERNAL_SAVANT , dsp.title.SOLAR_SAGE , dsp.title.BOLIDE_BARON , dsp.title.MOON_MAVEN  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(644,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
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