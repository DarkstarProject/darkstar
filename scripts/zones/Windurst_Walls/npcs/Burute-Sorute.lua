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

local title2 = { TITLE_NEW_ADVENTURER , TITLE_CAT_BURGLAR_GROUPIE , TITLE_CRAWLER_CULLER , TITLE_STAR_ONION_BRIGADE_MEMBER , TITLE_SOB_SUPER_HERO ,
			TITLE_EDITORS_HATCHET_MAN , TITLE_SUPER_MODEL , TITLE_FAST_FOOD_DELIVERER , TITLE_CARDIAN_TUTOR , TITLE_KISSER_MAKEUPPER , TITLE_LOWER_THAN_THE_LOWEST_TUNNEL_WORM ,
			TITLE_FRESH_NORTH_WINDS_RECRUIT , TITLE_HEAVENS_TOWER_GATEHOUSE_RECRUIT , TITLE_NEW_BEST_OF_THE_WEST_RECRUIT , TITLE_NEW_BUUMAS_BOOMERS_RECRUIT ,
			TITLE_MOGS_MASTER, TITLE_EMERALD_EXTERMINATOR , TITLE_DISCERNING_INDIVIDUAL , TITLE_VERY_DISCERNING_INDIVIDUAL , TITLE_EXTREMELY_DISCERNING_INDIVIDUAL ,
			TITLE_BABBANS_TRAVELING_COMPANION , 0 , 0 , 0 , 0 , 0 , 0, 0 }
local title3 = { TITLE_SAVIOR_OF_KNOWLEDGE , TITLE_STAR_ONION_BRIGADIER , TITLE_QUICK_FIXER , TITLE_FAKEMOUSTACHED_INVESTIGATOR , TITLE_CUPIDS_FLORIST ,
			TITLE_TARUTARU_MURDER_SUSPECT , TITLE_HEXER_VEXER , TITLE_GREAT_GRAPPLER_SCORPIO , TITLE_CERTIFIED_ADVENTURER , TITLE_BOND_FIXER , TITLE_FOSSILIZED_SEA_FARER ,
			TITLE_MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0}
local title4 = { TITLE_HAKKURURINKURUS_BENEFACTOR , SPOILSPORT , TITLE_PILGRIM_TO_MEA , TITLE_TOTAL_LOSER , TITLE_DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH ,
			TITLE_THE_FANGED_ONE , TITLE_RAINBOW_WEAVER , TITLE_FINE_TUNER , TITLE_DOCTOR_SHANTOTTOS_GUINEA_PIG , TITLE_GHOSTIE_BUSTER , TITLE_NIGHT_SKY_NAVIGATOR ,
			TITLE_DELIVERER_OF_TEARFUL_NEWS , TITLE_DOWN_PIPER_PIPEUPPERER , TITLE_DOCTOR_YORANORAN_SUPPORTER , TITLE_DOCTOR_SHANTOTTO_SUPPORTER ,
			TITLE_PROFESSOR_KORUMORU_SUPPORTER , TITLE_STARORDAINED_WARRIOR  , TITLE_SHADOW_BANISHER , TITLE_MOGS_EXCEPTIONALLY_KIND_MASTER , TITLE_FRIEND_OF_THE_HELMED ,
			TITLE_DEED_VERIFIER , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { TITLE_PARAGON_OF_THIEF_EXCELLENCE , TITLE_PARAGON_OF_BLACK_MAGE_EXCELLENCE , TITLE_PARAGON_OF_RANGER_EXCELLENCE , TITLE_PARAGON_OF_SUMMONER_EXCELLENCE  ,
			TITLE_CERTIFIED_RHINOSTERY_VENTURER , TITLE_DREAM_DWELLER , TITLE_HERO_ON_BEHALF_OF_WINDURST , TITLE_VICTOR_OF_THE_BALGA_CONTEST , TITLE_MOGS_LOVING_MASTER ,
			TITLE_HEIR_OF_THE_NEW_MOON , TITLE_SEEKER_OF_TRUTH  , TITLE_FUGITIVE_MINISTER_BOUNTY_HUNTER , TITLE_GUIDING_STAR , TITLE_VESTAL_CHAMBERLAIN ,
			TITLE_DYNAMISWINDURST_INTERLOPER  , TITLE_HEIR_TO_THE_REALM_OF_DREAMS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0 , 0 }
local title6 = { FREESWORD , MERCENARY , TITLE_MERCENARY_CAPTAIN , TITLE_COMBAT_CASTER , TITLE_TACTICIAN_MAGICIAN , TITLE_WISE_WIZARD  ,
			TITLE_PATRIARCH_PROTECTOR , TITLE_CASTER_CAPTAIN , TITLE_MASTER_CASTER , TITLE_MERCENARY_MAJOR , TITLE_KNITTING_KNOWITALL , TITLE_LOOM_LUNATIC ,
			TITLE_ACCOMPLISHED_WEAVER , TITLE_BOUTIQUE_OWNER , TITLE_BONE_BEAUTIFIER , TITLE_SHELL_SCRIMSHANDER , TITLE_ACCOMPLISHED_BONEWORKER , TITLE_CURIOSITY_SHOP_OWNER ,
			TITLE_FASTRIVER_FISHER , TITLE_COASTLINE_CASTER , TITLE_ACCOMPLISHED_ANGLER , TITLE_FISHMONGER_OWNER , TITLE_GOURMAND_GRATIFIER , TITLE_BANQUET_BESTOWER ,
			TITLE_ACCOMPLISHED_CHEF , TITLE_RESTAURANT_OWNER , 0 , 0 }
local title7 = { TITLE_MOG_HOUSE_HANDYPERSON , TITLE_ARRESTER_OF_THE_ASCENSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
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
		if(option > 0 and option <29) then
			if (player:delGil(200)) then
				player:setTitle( title2[option] )
			end
		elseif(option > 256 and option <285) then
			if (player:delGil(300)) then
				player:setTitle(  title3[option - 256] )
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