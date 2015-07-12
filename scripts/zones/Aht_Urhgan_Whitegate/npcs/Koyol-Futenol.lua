-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Koyol-Futenol
-- Title Change NPC
-- @pos -129 2 -20 50
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_DARK_RESISTANT , TITLE_BEARER_OF_THE_MARK_OF_ZAHAK  , TITLE_SEAGULL_PHRATRIE_CREW_MEMBER , TITLE_PROUD_AUTOMATON_OWNER , TITLE_WILDCAT_PUBLICIST ,
				TITLE_SCENIC_SNAPSHOTTER , TITLE_BRANDED_BY_THE_FIVE_SERPENTS , TITLE_IMMORTAL_LION , TITLE_PARAGON_OF_BLUE_MAGE_EXCELLENCE , TITLE_PARAGON_OF_CORSAIR_EXCELLENCE , TITLE_PARAGON_OF_PUPPETMASTER_EXCELLENCE ,
				TITLE_MASTER_OF_AMBITION , TITLE_MASTER_OF_CHANCE , TITLE_SKYSERPENT_AGGRANDIZER , TITLE_GALESERPENT_GUARDIAN , TITLE_STONESERPENT_SHOCKTROOPER , TITLE_PHOTOPTICATOR_OPERATOR ,
				TITLE_SPRINGSERPENT_SENTRY , TITLE_FLAMESERPENT_FACILITATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_PRIVATE_SECOND_CLASS , TITLE_PRIVATE_FIRST_CLASS , TITLE_SUPERIOR_PRIVATE , TITLE_LANCE_CORPORAL , CORPORAL , SERGEANT , TITLE_SERGEANT_MAJOR , TITLE_CHIEF_SERGEANT ,
				TITLE_SECOND_LIEUTENANT , TITLE_FIRST_LIEUTENANT , TITLE_AGENT_OF_THE_ALLIED_FORCES , TITLE_OVJANGS_ERRAND_RUNNER , TITLE_KARABABAS_TOUR_GUIDE , TITLE_KARABABAS_BODYGUARD , TITLE_KARABABAS_SECRET_AGENT ,
				TITLE_APHMAUS_MERCENARY , TITLE_NASHMEIRAS_MERCENARY , TITLE_SALAHEEMS_RISK_ASSESSOR , TITLE_TREASURE_TROVE_TENDER , TITLE_GESSHOS_MERCY , TITLE_EMISSARY_OF_THE_EMPRESS , TITLE_ENDYMION_PARATROOPER ,
				TITLE_NAJAS_COMRADEINARMS , TITLE_NASHMEIRAS_LOYALIST , TITLE_PREVENTER_OF_RAGNAROK , TITLE_CHAMPION_OF_AHT_URHGAN , TITLE_ETERNAL_MERCENARY , CAPTAIN }
local title4 = { TITLE_SUBDUER_OF_THE_MAMOOL_JA , TITLE_SUBDUER_OF_THE_TROLLS , TITLE_SUBDUER_OF_THE_UNDEAD_SWARM , TITLE_CERBERUS_MUZZLER , TITLE_HYDRA_HEADHUNTER , TITLE_SHINING_SCALE_RIFLER ,
				TITLE_TROLL_SUBJUGATOR , TITLE_GORGONSTONE_SUNDERER , TITLE_KHIMAIRA_CARVER , TITLE_ELITE_EINHERJAR , TITLE_STAR_CHARIOTEER , TITLE_SUN_CHARIOTEER , TITLE_COMET_CHARIOTEER , TITLE_MOON_CHARIOTEER ,
				TITLE_BLOODY_BERSERKER , TITLE_THE_SIXTH_SERPENT , TITLE_OUPIRE_IMPALER , TITLE_HEIR_OF_THE_BLESSED_RADIANCE , TITLE_HEIR_OF_THE_BLIGHTED_GLOOM , TITLE_SWORN_TO_THE_DARK_DIVINITY ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , TITLE_SUPERNAL_SAVANT , TITLE_SOLAR_SAGE , TITLE_BOLIDE_BARON , TITLE_MOON_MAVEN  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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
		if(option > 0 and option <29) then
			if (player:delGil(200)) then
				player:setTitle( title2[option] )
			end
		elseif(option > 256 and option <285) then
			if (player:delGil(300)) then
				player:setTitle( title3[option - 256] )
			end
		elseif(option > 512 and option < 541) then
			if (player:delGil(400)) then
				player:setTitle( title4[option - 512] )
			end
		elseif(option > 768 and option <797) then
			if (player:delGil(500)) then
				player:setTitle( title5[option - 768] )
			end
		end
	end
end;