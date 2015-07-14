-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Koyol-Futenol
-- Title Change NPC
-- @pos -129 2 -20 50
-----------------------------------

require("scripts/globals/titles");

local title2 = { title.DARK_RESISTANT , title.BEARER_OF_THE_MARK_OF_ZAHAK  , title.SEAGULL_PHRATRIE_CREW_MEMBER , title.PROUD_AUTOMATON_OWNER , title.WILDCAT_PUBLICIST ,
				title.SCENIC_SNAPSHOTTER , title.BRANDED_BY_THE_FIVE_SERPENTS , title.IMMORTAL_LION , title.PARAGON_OF_BLUE_MAGE_EXCELLENCE , title.PARAGON_OF_CORSAIR_EXCELLENCE , title.PARAGON_OF_PUPPETMASTER_EXCELLENCE ,
				title.MASTER_OF_AMBITION , title.MASTER_OF_CHANCE , title.SKYSERPENT_AGGRANDIZER , title.GALESERPENT_GUARDIAN , title.STONESERPENT_SHOCKTROOPER , title.PHOTOPTICATOR_OPERATOR ,
				title.SPRINGSERPENT_SENTRY , title.FLAMESERPENT_FACILITATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { title.PRIVATE_SECOND_CLASS , title.PRIVATE_FIRST_CLASS , title.SUPERIOR_PRIVATE , title.LANCE_CORPORAL , CORPORAL , SERGEANT , title.SERGEANT_MAJOR , title.CHIEF_SERGEANT ,
				title.SECOND_LIEUTENANT , title.FIRST_LIEUTENANT , title.AGENT_OF_THE_ALLIED_FORCES , title.OVJANGS_ERRAND_RUNNER , title.KARABABAS_TOUR_GUIDE , title.KARABABAS_BODYGUARD , title.KARABABAS_SECRET_AGENT ,
				title.APHMAUS_MERCENARY , title.NASHMEIRAS_MERCENARY , title.SALAHEEMS_RISK_ASSESSOR , title.TREASURE_TROVE_TENDER , title.GESSHOS_MERCY , title.EMISSARY_OF_THE_EMPRESS , title.ENDYMION_PARATROOPER ,
				title.NAJAS_COMRADEINARMS , title.NASHMEIRAS_LOYALIST , title.PREVENTER_OF_RAGNAROK , title.CHAMPION_OF_AHT_URHGAN , title.ETERNAL_MERCENARY , CAPTAIN }
local title4 = { title.SUBDUER_OF_THE_MAMOOL_JA , title.SUBDUER_OF_THE_TROLLS , title.SUBDUER_OF_THE_UNDEAD_SWARM , title.CERBERUS_MUZZLER , title.HYDRA_HEADHUNTER , title.SHINING_SCALE_RIFLER ,
				title.TROLL_SUBJUGATOR , title.GORGONSTONE_SUNDERER , title.KHIMAIRA_CARVER , title.ELITE_EINHERJAR , title.STAR_CHARIOTEER , title.SUN_CHARIOTEER , title.COMET_CHARIOTEER , title.MOON_CHARIOTEER ,
				title.BLOODY_BERSERKER , title.THE_SIXTH_SERPENT , title.OUPIRE_IMPALER , title.HEIR_OF_THE_BLESSED_RADIANCE , title.HEIR_OF_THE_BLIGHTED_GLOOM , title.SWORN_TO_THE_DARK_DIVINITY ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , title.SUPERNAL_SAVANT , title.SOLAR_SAGE , title.BOLIDE_BARON , title.MOON_MAVEN  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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