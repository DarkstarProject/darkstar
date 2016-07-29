-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Koyol-Futenol
-- Title Change NPC
-- @pos -129 2 -20 50
-----------------------------------

require("scripts/globals/titles");

local title2 = { DARK_RESISTANT , BEARER_OF_THE_MARK_OF_ZAHAK  , SEAGULL_PHRATRIE_CREW_MEMBER , PROUD_AUTOMATON_OWNER , WILDCAT_PUBLICIST ,
                SCENIC_SNAPSHOTTER , BRANDED_BY_THE_FIVE_SERPENTS , IMMORTAL_LION , PARAGON_OF_BLUE_MAGE_EXCELLENCE , PARAGON_OF_CORSAIR_EXCELLENCE , PARAGON_OF_PUPPETMASTER_EXCELLENCE ,
                MASTER_OF_AMBITION , MASTER_OF_CHANCE , SKYSERPENT_AGGRANDIZER , GALESERPENT_GUARDIAN , STONESERPENT_SHOCKTROOPER , PHOTOPTICATOR_OPERATOR ,
                SPRINGSERPENT_SENTRY , FLAMESERPENT_FACILITATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { PRIVATE_SECOND_CLASS , PRIVATE_FIRST_CLASS , SUPERIOR_PRIVATE , LANCE_CORPORAL , CORPORAL , SERGEANT , SERGEANT_MAJOR , CHIEF_SERGEANT ,
                SECOND_LIEUTENANT , FIRST_LIEUTENANT , AGENT_OF_THE_ALLIED_FORCES , OVJANGS_ERRAND_RUNNER , KARABABAS_TOUR_GUIDE , KARABABAS_BODYGUARD , KARABABAS_SECRET_AGENT ,
                APHMAUS_MERCENARY , NASHMEIRAS_MERCENARY , SALAHEEMS_RISK_ASSESSOR , TREASURE_TROVE_TENDER , GESSHOS_MERCY , EMISSARY_OF_THE_EMPRESS , ENDYMION_PARATROOPER ,
                NAJAS_COMRADEINARMS , NASHMEIRAS_LOYALIST , PREVENTER_OF_RAGNAROK , CHAMPION_OF_AHT_URHGAN , ETERNAL_MERCENARY , CAPTAIN }
local title4 = { SUBDUER_OF_THE_MAMOOL_JA , SUBDUER_OF_THE_TROLLS , SUBDUER_OF_THE_UNDEAD_SWARM , CERBERUS_MUZZLER , HYDRA_HEADHUNTER , SHINING_SCALE_RIFLER ,
                TROLL_SUBJUGATOR , GORGONSTONE_SUNDERER , KHIMAIRA_CARVER , ELITE_EINHERJAR , STAR_CHARIOTEER , SUN_CHARIOTEER , COMET_CHARIOTEER , MOON_CHARIOTEER ,
                BLOODY_BERSERKER , THE_SIXTH_SERPENT , OUPIRE_IMPALER , HEIR_OF_THE_BLESSED_RADIANCE , HEIR_OF_THE_BLIGHTED_GLOOM , SWORN_TO_THE_DARK_DIVINITY ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , SUPERNAL_SAVANT , SOLAR_SAGE , BOLIDE_BARON , MOON_MAVEN  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0284,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
    if (csid==0x0284) then
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