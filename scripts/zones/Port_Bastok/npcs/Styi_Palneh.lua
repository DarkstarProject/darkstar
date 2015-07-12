-----------------------------------
-- Area: Port Bastok
-- NPC: Styi Palneh
-- Title Change NPC
-- @pos 28 4 -15 236
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_NEW_ADVENTURER , TITLE_BASTOK_WELCOMING_COMMITTEE , TITLE_BUCKET_FISHER , TITLE_PURSUER_OF_THE_PAST , TITLE_MOMMYS_HELPER , TITLE_HOT_DOG ,
				STAMPEDER , RINGBEARER , TITLE_ZERUHN_SWEEPER , TEARJERKER , TITLE_CRAB_CRUSHER , BRYGIDAPPROVED , TITLE_GUSTABERG_TOURIST , TITLE_MOGS_MASTER , TITLE_CERULEAN_SOLDIER ,
				TITLE_DISCERNING_INDIVIDUAL , TITLE_VERY_DISCERNING_INDIVIDUAL , TITLE_EXTREMELY_DISCERNING_INDIVIDUAL , TITLE_APOSTATE_FOR_HIRE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_SHELL_OUTER , TITLE_PURSUER_OF_THE_TRUTH , TITLE_QIJIS_FRIEND , TITLE_TREASURE_SCAVENGER , TITLE_SAND_BLASTER , TITLE_DRACHENFALL_ASCETIC ,
				TITLE_ASSASSIN_REJECT , TITLE_CERTIFIED_ADVENTURER , TITLE_QIJIS_RIVAL , TITLE_CONTEST_RIGGER , TITLE_KULATZ_BRIDGE_COMPANION , AVENGER , TITLE_AIRSHIP_DENOUNCER ,
				TITLE_STAR_OF_IFRIT , TITLE_PURPLE_BELT , TITLE_MOGS_KIND_MASTER , TITLE_TRASH_COLLECTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TITLE_BEADEAUX_SURVEYOR , TITLE_PILGRIM_TO_DEM , TITLE_BLACK_DEATH , TITLE_DARK_SIDER , TITLE_SHADOW_WALKER , TITLE_SORROW_DROWNER , TITLE_STEAMING_SHEEP_REGULAR ,
				TITLE_SHADOW_BANISHER , TITLE_MOGS_EXCEPTIONALLY_KIND_MASTER , TITLE_HYPER_ULTRA_SONIC_ADVENTURER , TITLE_GOBLIN_IN_DISGUISE , TITLE_BASTOKS_SECOND_BEST_DRESSED ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { TITLE_PARAGON_OF_WARRIOR_EXCELLENCE , TITLE_PARAGON_OF_MONK_EXCELLENCE , TITLE_PARAGON_OF_DARK_KNIGHT_EXCELLENCE , TITLE_HEIR_OF_THE_GREAT_EARTH ,
				TITLE_MOGS_LOVING_MASTER , TITLE_HERO_AMONG_HEROES , TITLE_DYNAMISBASTOK_INTERLOPER , TITLE_MASTER_OF_MANIPULATION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { LEGIONNAIRE , DECURION , CENTURION , TITLE_JUNIOR_MUSKETEER , TITLE_SENIOR_MUSKETEER , TITLE_MUSKETEER_COMMANDER , TITLE_GOLD_MUSKETEER ,
				PRAEFECTUS , TITLE_SENIOR_GOLD_MUSKETEER , TITLE_PRAEFECTUS_CASTRORUM , TITLE_ANVIL_ADVOCATE , TITLE_FORGE_FANATIC , TITLE_ACCOMPLISHED_BLACKSMITH , TITLE_ARMORY_OWNER , TITLE_TRINKET_TURNER ,
				TITLE_SILVER_SMELTER , TITLE_ACCOMPLISHED_GOLDSMITH , TITLE_JEWELRY_STORE_OWNER , TITLE_FORMULA_FIDDLER , TITLE_POTION_POTENTATE , TITLE_ACCOMPLISHED_ALCHEMIST , TITLE_APOTHECARY_OWNER ,
				0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { TITLE_MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x00C8,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x00C8) then
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
				player:setTitle( title5[option - 512] )
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
				player:setTitle(  title7[option - 1280])
			end
		end
	end
end;