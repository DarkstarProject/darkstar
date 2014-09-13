-----------------------------------
-- Area: Port Jeuno
-- NPC: ZuahLepahnyu
-- Title Change NPC
-- @pos 0 0 8 246
-----------------------------------

require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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
player:startEvent(0x014A,gentitle(player,title2),gentitle(player,title3),gentitle(player,title4),gentitle(player,title5),gentitle(player,title6),gentitle(player,title7),1   ,player:getGil());
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	 if(csid==0x014A)then
		if(option > 0 and option <29)then
			if (player:delGil(200))then
				local title = { VISITOR_TO_ABYSSEA , FRIEND_OF_ABYSSEA , WARRIOR_OF_ABYSSEA , STORMER_OF_ABYSSEA , DEVASTATOR_OF_ABYSSEA ,
				HERO_OF_ABYSSEA , CHAMPION_OF_ABYSSEA , CONQUEROR_OF_ABYSSEA , SAVIOR_OF_ABYSSEA , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(title[option])
			end				
		elseif(option > 256 and option <285)then
			if (player:delGil(300))then
				local title = { GOLDWING_SQUASHER , SILAGILITH_DETONATOR , SURTR_SMOTHERER , DREYRUK_PREDOMINATOR , SAMURSK_VITIATOR ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(  title[option - 256])
			end
		elseif(option > 512 and option < 541)then
			if (player:delGil(400))then
				local title = { YAANEI_CRASHER , KUTHAREI_UNHORSER , SIPPOY_CAPTURER , RANI_DECROWNER , ORTHRUS_DECAPITATOR , DRAGUA_SLAYER ,
				BENNU_DEPLUMER , HEDJEDJET_DESTINGER , CUIJATENDER_DESICCATOR , BRULO_EXTINGUISHER , PANTOKRATOR_DISPROVER , APADEMAK_ANNIHILATOR ,
				ISGEBIND_DEFROSTER , RESHEPH_ERADICATOR , EMPOUSA_EXPURGATOR , INDRIK_IMMOLATOR , OGOPOGO_OVERTURNER , RAJA_REGICIDE , ALFARD_DETOXIFIER ,
				AZDAJA_ABOLISHER , AMPHITRITE_SHUCKER , FUATH_PURIFIER , KILLAKRIQ_EXCORIATOR , MAERE_BESTIRRER , WYRM_GOD_DEFIER , 0 , 0 , 0 }
				player:setTitle( title[option - 512])
			end
		elseif(option > 768 and option <797)then
			if (player:delGil(500))then
				local title = { TITLACAUAN_DISMEMBERER , SMOK_DEFOGGER , AMHULUK_INUNDATER , PULVERIZER_DISMANTLER , DURINN_DECEIVER , KARKADANN_EXOCULATOR ,
				0 , 0 , 0 , 0 , 0 , TEMENOS_EMANCIPATOR , APOLLYON_RAZER , UMAGRHK_MANEMANGLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 768])
			end
		elseif(option > 1024 and option < 1053)then
			if (player:delGil(600))then
				local title = { KARKINOS_CLAWCRUSHER , CARABOSSE_QUASHER , OVNI_OBLITERATOR , RUMINATOR_CONFOUNDER , FISTULE_DRAINER , TURUL_GROUNDER ,
				BLOODEYE_BANISHER , SATIATOR_DEPRIVER , CHLORIS_UPROOTER , MYRMECOLEON_TAMER , GLAVOID_STAMPEDER , USURPER_DEPOSER , ULHUADSHI_DESICCATOR ,
				ITZPAPALOTL_DECLAWER , SOBEK_MUMMIFIER , CIREINCROIN_HARPOONER , BUKHIS_TETHERER , SEDNA_TUSKBREAKER , CLEAVER_DISMANTLER , 
				EXECUTIONER_DISMANTLER , SEVERER_DISMANTLER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 1024])
			end
		elseif(option > 1280 and option < 1309)then
			if (player:delGil(700))then
				local title = { HADHAYOSH_HALTERER , BRIAREUS_FELLER , ECCENTRICITY_EXPUNGER , KUKULKAN_DEFANGER , IRATHAM_CAPTURER , LACOVIE_CAPSIZER ,
				LUSCA_DEBUNKER , TRISTITIA_DELIVERER , KETEA_BEACHER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(  title[option - 1280]) 
			end				
		end
	end
end;
function gentitle(player,title)
	local val1 = 0
	for i = 1, #title do
		if(title[i] == 0 or player:hasTitle(title[i]) ~= true)then
			val1 = val1 + math.pow(2,i)
		end			
	end
	return val1
end;


