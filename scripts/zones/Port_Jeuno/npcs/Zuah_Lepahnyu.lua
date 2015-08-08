-----------------------------------
-- Area: Port Jeuno
-- NPC: ZuahLepahnyu
-- Title Change NPC
-- @pos 0 0 8 246
-----------------------------------

require("scripts/globals/titles");

local title2 = { VISITOR_TO_ABYSSEA , FRIEND_OF_ABYSSEA , WARRIOR_OF_ABYSSEA , STORMER_OF_ABYSSEA , DEVASTATOR_OF_ABYSSEA ,
				HERO_OF_ABYSSEA , CHAMPION_OF_ABYSSEA , CONQUEROR_OF_ABYSSEA , SAVIOR_OF_ABYSSEA , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { GOLDWING_SQUASHER , SILAGILITH_DETONATOR , SURTR_SMOTHERER , DREYRUK_PREDOMINATOR , SAMURSK_VITIATOR ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { YAANEI_CRASHER , KUTHAREI_UNHORSER , SIPPOY_CAPTURER , RANI_DECROWNER , ORTHRUS_DECAPITATOR , DRAGUA_SLAYER ,
				BENNU_DEPLUMER , HEDJEDJET_DESTINGER , CUIJATENDER_DESICCATOR , BRULO_EXTINGUISHER , PANTOKRATOR_DISPROVER , APADEMAK_ANNIHILATOR ,
				ISGEBIND_DEFROSTER , RESHEPH_ERADICATOR , EMPOUSA_EXPURGATOR , INDRIK_IMMOLATOR , OGOPOGO_OVERTURNER , RAJA_REGICIDE , ALFARD_DETOXIFIER ,
				AZDAJA_ABOLISHER , AMPHITRITE_SHUCKER , FUATH_PURIFIER , KILLAKRIQ_EXCORIATOR , MAERE_BESTIRRER , WYRM_GOD_DEFIER , 0 , 0 , 0 }
local title5 = { TITLACAUAN_DISMEMBERER , SMOK_DEFOGGER , AMHULUK_INUNDATER , PULVERIZER_DISMANTLER , DURINN_DECEIVER , KARKADANN_EXOCULATOR ,
				0 , 0 , 0 , 0 , 0 , TEMENOS_EMANCIPATOR , APOLLYON_RAZER , UMAGRHK_MANEMANGLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { KARKINOS_CLAWCRUSHER , CARABOSSE_QUASHER , OVNI_OBLITERATOR , RUMINATOR_CONFOUNDER , FISTULE_DRAINER , TURUL_GROUNDER ,
				BLOODEYE_BANISHER , SATIATOR_DEPRIVER , CHLORIS_UPROOTER , MYRMECOLEON_TAMER , GLAVOID_STAMPEDER , USURPER_DEPOSER , ULHUADSHI_DESICCATOR ,
				ITZPAPALOTL_DECLAWER , SOBEK_MUMMIFIER , CIREINCROIN_HARPOONER , BUKHIS_TETHERER , SEDNA_TUSKBREAKER , CLEAVER_DISMANTLER ,
				EXECUTIONER_DISMANTLER , SEVERER_DISMANTLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { HADHAYOSH_HALTERER , BRIAREUS_FELLER , ECCENTRICITY_EXPUNGER , KUKULKAN_DEFANGER , IRATHAM_CAPTURER , LACOVIE_CAPSIZER ,
				LUSCA_DEBUNKER , TRISTITIA_DELIVERER , KETEA_BEACHER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

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