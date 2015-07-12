-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Moozo-Koozo
--  Title Change NPC
--  @pos 83 0 120 230
-------------------------------------
package.loaded["scripts/zones/TITLE_Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/TITLE_Southern_San_dOria/TextIDs");

local title2 = { TITLE_NEW_ADVENTURER , TITLE_BEAN_CUISINE_SALTER , TITLE_DAYBREAK_GAMBLER , TITLE_ENTRANCE_DENIED , RABBITER , TITLE_ROYAL_GRAVE_KEEPER ,
				TITLE_COURIER_EXTRAORDINAIRE , TITLE_RONFAURIAN_RESCUER , TITLE_PICKPOCKET_PINCHER , TITLE_THE_PURE_ONE , TITLE_LOST_CHILD_OFFICER , TITLE_SILENCER_OF_THE_LAMBS ,
				TITLE_LOST_AMP_FOUND_OFFICER , TITLE_GREEN_GROCER , TITLE_THE_BENEVOLENT_ONE , TITLE_KNIGHT_IN_TRAINING , TITLE_ADVERTISING_EXECUTIVE , TITLE_FAMILY_COUNSELOR ,
				TITLE_MOGS_MASTER , TITLE_VERMILLION_VENTURER , TITLE_DISCERNING_INDIVIDUAL , TITLE_VERY_DISCERNING_INDIVIDUAL , TITLE_EXTREMELY_DISCERNING_INDIVIDUAL ,
				0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_SHEEPS_MILK_DELIVERER , TITLE_THE_PIOUS_ONE , APIARIST , TITLE_FAITH_LIKE_A_CANDLE , TITLE_LIZARD_SKINNER , TITLE_BUG_CATCHER ,
				SPELUNKER , TITLE_ARMS_TRADER , TITLE_THIRDRATE_ORGANIZER , TITLE_ROYAL_WEDDING_PLANNER , TITLE_CONSORT_CANDIDATE , TITLE_CERTIFIED_ADVENTURER , TITLE_VAMPIRE_HUNTER_DMINUS ,
				TITLE_A_MOSS_KIND_PERSON , TITLE_FANG_FINDER , TITLE_TRAVELING_MEDICINE_MAN , TITLE_CAT_SKINNER , TITLE_CARP_DIEM , TITLE_SECONDRATE_ORGANIZER , TITLE_MOGS_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TITLE_FIRSTRATE_ORGANIZER , TITLE_PILGRIM_TO_HOLLA , TITLE_TRIED_AND_TESTED_KNIGHT , TITLE_HEIR_TO_THE_HOLY_CREST , TITLE_OBSIDIAN_STORM ,
				TITLE_TALKS_WITH_TONBERRIES , TITLE_SHADOW_BANISHER , TITLE_MOGS_EXCEPTIONALLY_KIND_MASTER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { TITLE_SEARING_STAR , TITLE_STRIKING_STAR , TITLE_SOOTHING_STAR , TITLE_SABLE_STAR , TITLE_SCARLET_STAR , TITLE_SONIC_STAR , TITLE_SAINTLY_STAR , TITLE_SHADOWY_STAR ,
				TITLE_SAVAGE_STAR , TITLE_SINGING_STAR , TITLE_SNIPING_STAR , TITLE_SLICING_STAR , TITLE_SNEAKING_STAR , TITLE_SPEARING_STAR , TITLE_SUMMONING_STAR , TITLE_SAPPHIRE_STAR ,
				TITLE_SURGING_STAR , TITLE_SWAYING_STAR , TITLE_SPRIGHTLY_STAR , TITLE_SAGACIOUS_STAR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { TITLE_ROOK_BUSTER , BANNERET , TITLE_GOLD_BALLI_STAR , TITLE_MYTHRIL_BALLI_STAR , TITLE_SILVER_BALLI_STAR , TITLE_BRONZE_BALLI_STAR , BALLISTAGER ,
				TITLE_FINAL_BALLI_STAR , TITLE_BALLI_STAR_ROYALE , TITLE_PARAGON_OF_RED_MAGE_EXCELLENCE , TITLE_PARAGON_OF_WHITE_MAGE_EXCELLENCE , TITLE_PARAGON_OF_PALADIN_EXCELLENCE ,
				TITLE_PARAGON_OF_DRAGOON_EXCELLENCE , TITLE_HEIR_OF_THE_GREAT_ICE , TITLE_MOGS_LOVING_MASTER , TITLE_SAN_DORIAN_ROYAL_HEIR , TITLE_DYNAMISSAN_DORIA_INTERLOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { TITLE_ROYAL_ARCHER , TITLE_ROYAL_SPEARMAN , TITLE_ROYAL_SQUIRE , TITLE_ROYAL_SWORDSMAN , TITLE_ROYAL_CAVALIER , TITLE_ROYAL_GUARD , TITLE_GRAND_KNIGHT_OF_THE_REALM ,
				TITLE_GRAND_TEMPLE_KNIGHT , TITLE_RESERVE_KNIGHT_CAPTAIN , TITLE_ELITE_ROYAL_GUARD , TITLE_WOOD_WORSHIPER , TITLE_LUMBER_LATHER , TITLE_ACCOMPLISHED_CARPENTER ,
				TITLE_ANVIL_ADVOCATE , TITLE_FORGE_FANATIC , TITLE_ACCOMPLISHED_BLACKSMITH , TITLE_ARMORY_OWNER , TITLE_HIDE_HANDLER , TITLE_LEATHER_LAUDER , TITLE_ACCOMPLISHED_TANNER ,
				TITLE_SHOESHOP_OWNER , TITLE_MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
	local FlyerForRegine = player:getQuestStatus(SANDORIA,TITLE_FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		local count = trade:getItemCount();
		local MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(TITLE_FLYER_REFUSED);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x2A3,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),0,npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x2A3) then
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