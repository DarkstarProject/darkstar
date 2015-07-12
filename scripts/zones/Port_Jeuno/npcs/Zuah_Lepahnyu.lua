-----------------------------------
-- Area: Port Jeuno
-- NPC: ZuahLepahnyu
-- Title Change NPC
-- @pos 0 0 8 246
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_VISITOR_TO_ABYSSEA , TITLE_FRIEND_OF_ABYSSEA , TITLE_WARRIOR_OF_ABYSSEA , TITLE_STORMER_OF_ABYSSEA , TITLE_DEVASTATOR_OF_ABYSSEA ,
				TITLE_HERO_OF_ABYSSEA , TITLE_CHAMPION_OF_ABYSSEA , TITLE_CONQUEROR_OF_ABYSSEA , TITLE_SAVIOR_OF_ABYSSEA , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_GOLDWING_SQUASHER , TITLE_SILAGILITH_DETONATOR , TITLE_SURTR_SMOTHERER , TITLE_DREYRUK_PREDOMINATOR , TITLE_SAMURSK_VITIATOR ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TITLE_YAANEI_CRASHER , TITLE_KUTHAREI_UNHORSER , TITLE_SIPPOY_CAPTURER , TITLE_RANI_DECROWNER , TITLE_ORTHRUS_DECAPITATOR , TITLE_DRAGUA_SLAYER ,
				TITLE_BENNU_DEPLUMER , TITLE_HEDJEDJET_DESTINGER , TITLE_CUIJATENDER_DESICCATOR , TITLE_BRULO_EXTINGUISHER , TITLE_PANTOKRATOR_DISPROVER , TITLE_APADEMAK_ANNIHILATOR ,
				TITLE_ISGEBIND_DEFROSTER , TITLE_RESHEPH_ERADICATOR , TITLE_EMPOUSA_EXPURGATOR , TITLE_INDRIK_IMMOLATOR , TITLE_OGOPOGO_OVERTURNER , TITLE_RAJA_REGICIDE , TITLE_ALFARD_DETOXIFIER ,
				TITLE_AZDAJA_ABOLISHER , TITLE_AMPHITRITE_SHUCKER , TITLE_FUATH_PURIFIER , TITLE_KILLAKRIQ_EXCORIATOR , TITLE_MAERE_BESTIRRER , TITLE_WYRM_GOD_DEFIER , 0 , 0 , 0 }
local title5 = { TITLE_TITLACAUAN_DISMEMBERER , TITLE_SMOK_DEFOGGER , TITLE_AMHULUK_INUNDATER , TITLE_PULVERIZER_DISMANTLER , TITLE_DURINN_DECEIVER , TITLE_KARKADANN_EXOCULATOR ,
				0 , 0 , 0 , 0 , 0 , TITLE_TEMENOS_EMANCIPATOR , TITLE_APOLLYON_RAZER , TITLE_UMAGRHK_MANEMANGLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { TITLE_KARKINOS_CLAWCRUSHER , TITLE_CARABOSSE_QUASHER , TITLE_OVNI_OBLITERATOR , TITLE_RUMINATOR_CONFOUNDER , TITLE_FISTULE_DRAINER , TITLE_TURUL_GROUNDER ,
				TITLE_BLOODEYE_BANISHER , TITLE_SATIATOR_DEPRIVER , TITLE_CHLORIS_UPROOTER , TITLE_MYRMECOLEON_TAMER , TITLE_GLAVOID_STAMPEDER , TITLE_USURPER_DEPOSER , TITLE_ULHUADSHI_DESICCATOR ,
				TITLE_ITZPAPALOTL_DECLAWER , TITLE_SOBEK_MUMMIFIER , TITLE_CIREINCROIN_HARPOONER , TITLE_BUKHIS_TETHERER , TITLE_SEDNA_TUSKBREAKER , TITLE_CLEAVER_DISMANTLER ,
				TITLE_EXECUTIONER_DISMANTLER , TITLE_SEVERER_DISMANTLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { TITLE_HADHAYOSH_HALTERER , TITLE_BRIAREUS_FELLER , TITLE_ECCENTRICITY_EXPUNGER , TITLE_KUKULKAN_DEFANGER , TITLE_IRATHAM_CAPTURER , TITLE_LACOVIE_CAPSIZER ,
				TITLE_LUSCA_DEBUNKER , TITLE_TRISTITIA_DELIVERER , TITLE_KETEA_BEACHER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x014A,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x014A) then
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
		elseif(option > 1024 and option < 1053) then
			if (player:delGil(600)) then
				player:setTitle( title6[option - 1024] )
			end
		elseif(option > 1280 and option < 1309) then
			if (player:delGil(700)) then
				player:setTitle(  title7[option - 1280] )
			end
		end
	end
end;