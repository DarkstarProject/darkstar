-----------------------------------
--  Area: Windurst Walls
--   NPC: Burute-Sorute
--  Type: Title Change NPC
-- @zone: 239
--  @pos 0.080 -10.765 5.394 239
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------

require("scripts/globals/titles");

local title2 = { NEW_ADVENTURER , CAT_BURGLAR_GROUPIE , CRAWLER_CULLER , STAR_ONION_BRIGADE_MEMBER , SOB_SUPER_HERO ,
			EDITORS_HATCHET_MAN , SUPER_MODEL , FAST_FOOD_DELIVERER , CARDIAN_TUTOR , KISSER_MAKEUPPER , LOWER_THAN_THE_LOWEST_TUNNEL_WORM ,
			FRESH_NORTH_WINDS_RECRUIT , HEAVENS_TOWER_GATEHOUSE_RECRUIT , NEW_BEST_OF_THE_WEST_RECRUIT , NEW_BUUMAS_BOOMERS_RECRUIT ,
			MOGS_MASTER, EMERALD_EXTERMINATOR , DISCERNING_INDIVIDUAL , VERY_DISCERNING_INDIVIDUAL , EXTREMELY_DISCERNING_INDIVIDUAL ,
			BABBANS_TRAVELING_COMPANION , 0 , 0 , 0 , 0 , 0 , 0, 0 }
local title3 = { SAVIOR_OF_KNOWLEDGE , STAR_ONION_BRIGADIER , QUICK_FIXER , FAKEMOUSTACHED_INVESTIGATOR , CUPIDS_FLORIST ,
			TARUTARU_MURDER_SUSPECT , HEXER_VEXER , GREAT_GRAPPLER_SCORPIO , CERTIFIED_ADVENTURER , BOND_FIXER , FOSSILIZED_SEA_FARER ,
			MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0}
local title4 = { HAKKURURINKURUS_BENEFACTOR , SPOILSPORT , PILGRIM_TO_MEA , TOTAL_LOSER , DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH ,
			THE_FANGED_ONE , RAINBOW_WEAVER , FINE_TUNER , DOCTOR_SHANTOTTOS_GUINEA_PIG , GHOSTIE_BUSTER , NIGHT_SKY_NAVIGATOR ,
			DELIVERER_OF_TEARFUL_NEWS , DOWN_PIPER_PIPEUPPERER , DOCTOR_YORANORAN_SUPPORTER , DOCTOR_SHANTOTTO_SUPPORTER ,
			PROFESSOR_KORUMORU_SUPPORTER , STARORDAINED_WARRIOR  , SHADOW_BANISHER , MOGS_EXCEPTIONALLY_KIND_MASTER , FRIEND_OF_THE_HELMED ,
			DEED_VERIFIER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { PARAGON_OF_THIEF_EXCELLENCE , PARAGON_OF_BLACK_MAGE_EXCELLENCE , PARAGON_OF_RANGER_EXCELLENCE , PARAGON_OF_SUMMONER_EXCELLENCE  ,
			CERTIFIED_RHINOSTERY_VENTURER , DREAM_DWELLER , HERO_ON_BEHALF_OF_WINDURST , VICTOR_OF_THE_BALGA_CONTEST , MOGS_LOVING_MASTER ,
			HEIR_OF_THE_NEW_MOON , SEEKER_OF_TRUTH  , FUGITIVE_MINISTER_BOUNTY_HUNTER , GUIDING_STAR , VESTAL_CHAMBERLAIN ,
			DYNAMISWINDURST_INTERLOPER  , HEIR_TO_THE_REALM_OF_DREAMS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0 , 0 }
local title6 = { FREESWORD , MERCENARY , MERCENARY_CAPTAIN , COMBAT_CASTER , TACTICIAN_MAGICIAN , WISE_WIZARD  ,
			PATRIARCH_PROTECTOR , CASTER_CAPTAIN , MASTER_CASTER , MERCENARY_MAJOR , KNITTING_KNOWITALL , LOOM_LUNATIC ,
			ACCOMPLISHED_WEAVER , BOUTIQUE_OWNER , BONE_BEAUTIFIER , SHELL_SCRIMSHANDER , ACCOMPLISHED_BONEWORKER , CURIOSITY_SHOP_OWNER ,
			FASTRIVER_FISHER , COASTLINE_CASTER , ACCOMPLISHED_ANGLER , FISHMONGER_OWNER , GOURMAND_GRATIFIER , BANQUET_BESTOWER ,
			ACCOMPLISHED_CHEF , RESTAURANT_OWNER , 0 , 0 }
local title7 = { MOG_HOUSE_HANDYPERSON , ARRESTER_OF_THE_ASCENSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x2714,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	-- printf("CSID: %u",csid)
	-- printf("RESULT: %u",option)
	if (csid==0x2714) then
		if (option > 0 and option <29) then
			if (player:delGil(200)) then
				player:setTitle( title2[option] )
			end
		elseif (option > 256 and option <285) then
			if (player:delGil(300)) then
				player:setTitle(  title3[option - 256] )
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