-----------------------------------
-- Area: Lower Jeuno
-- NPC: Tuh Almobankha
-- Title Change NPC
-- @pos -14 0 -61 245
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_BROWN_MAGE_GUINEA_PIG , TITLE_BROWN_MAGIC_BYPRODUCT , TITLE_RESEARCHER_OF_CLASSICS , TORCHBEARER , TITLE_FORTUNETELLER_IN_TRAINING ,
				TITLE_CHOCOBO_TRAINER , TITLE_CLOCK_TOWER_PRESERVATIONIST , TITLE_LIFE_SAVER , TITLE_CARD_COLLECTOR , TITLE_TWOS_COMPANY , TITLE_TRADER_OF_ANTIQUITIES , TITLE_GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN ,
				TITLE_TENSHODO_MEMBER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_ACTIVIST_FOR_KINDNESS , TITLE_ENVOY_TO_THE_NORTH , TITLE_EXORCIST_IN_TRAINING , TITLE_FOOLS_ERRAND_RUNNER , TITLE_STREET_SWEEPER ,
				TITLE_MERCY_ERRAND_RUNNER , TITLE_BELIEVER_OF_ALTANA , TITLE_TRADER_OF_MYSTERIES , TITLE_WANDERING_MINSTREL , TITLE_ANIMAL_TRAINER , TITLE_HAVE_WINGS_WILL_FLY ,
				TITLE_ROD_RETRIEVER , TITLE_DESTINED_FELLOW , TITLE_TROUPE_BRILIOTH_DANCER , TITLE_PROMISING_DANCER , TITLE_STARDUST_DANCER ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TIMEKEEPER , TITLE_BRINGER_OF_BLISS , TITLE_PROFESSIONAL_LOAFER , TITLE_TRADER_OF_RENOWN , TITLE_HORIZON_BREAKER , TITLE_SUMMIT_BREAKER ,
				TITLE_BROWN_BELT , TITLE_DUCAL_DUPE , TITLE_CHOCOBO_LOVE_GURU , TITLE_PICKUP_ARTIST , TITLE_WORTHY_OF_TRUST , TITLE_A_FRIEND_INDEED , CHOCOROOKIE , TITLE_CRYSTAL_STAKES_CUPHOLDER ,
				TITLE_WINNING_OWNER , TITLE_VICTORIOUS_OWNER , TITLE_TRIUMPHANT_OWNER , TITLE_HIGH_ROLLER , TITLE_FORTUNES_FAVORITE , CHOCOCHAMPION ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { TITLE_PARAGON_OF_BEASTMASTER_EXCELLENCE , TITLE_PARAGON_OF_BARD_EXCELLENCE , TITLE_SKY_BREAKER , TITLE_BLACK_BELT , GREEDALOX , TITLE_CLOUD_BREAKER ,
				TITLE_STAR_BREAKER , TITLE_ULTIMATE_CHAMPION_OF_THE_WORLD , TITLE_DYNAMISJEUNO_INTERLOPER , TITLE_DYNAMISBEAUCEDINE_INTERLOPER , TITLE_DYNAMISXARCABARD_INTERLOPER ,
				TITLE_DYNAMISQUFIM_INTERLOPER , TITLE_CONQUEROR_OF_FATE , SUPERHERO , SUPERHEROINE , TITLE_ELEGANT_DANCER , TITLE_DAZZLING_DANCE_DIVA , TITLE_GRIMOIRE_BEARER ,
				TITLE_FELLOW_FORTIFIER , TITLE_BUSHIN_ASPIRANT , TITLE_BUSHIN_RYU_INHERITOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { TITLE_GRAND_GREEDALOX , TITLE_SILENCER_OF_THE_ECHO , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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
	player:startEvent(0x271E,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x271E) then
		if(option > 0 and option <29) then
			if (player:delGil(400)) then
				player:setTitle( title2[option] )
			end
		elseif(option > 256 and option <285) then
			if (player:delGil(500)) then
				player:setTitle(  title3[option - 256] )
			end
		elseif(option > 512 and option < 541) then
			if (player:delGil(600)) then
				player:setTitle( title4[option - 512] )
			end
		elseif(option > 768 and option <797) then
			if (player:delGil(700)) then
				player:setTitle( title5[option - 768] )
			end
		elseif(option > 1024 and option < 1053) then
			if (player:delGil(800)) then
				player:setTitle( title6[option - 1024] )
			end
		end
	end
end;