-----------------------------------
-- Area: Lower Jeuno
-- NPC: Tuh Almobankha
-- Title Change NPC
-- @pos -14 0 -61 245
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local title2 = { BROWN_MAGE_GUINEA_PIG , BROWN_MAGIC_BYPRODUCT , RESEARCHER_OF_CLASSICS , TORCHBEARER , FORTUNETELLER_IN_TRAINING ,
				CHOCOBO_TRAINER , CLOCK_TOWER_PRESERVATIONIST , LIFE_SAVER , CARD_COLLECTOR , TWOS_COMPANY , TRADER_OF_ANTIQUITIES , GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN ,
				TENSHODO_MEMBER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { ACTIVIST_FOR_KINDNESS , ENVOY_TO_THE_NORTH , EXORCIST_IN_TRAINING , FOOLS_ERRAND_RUNNER , STREET_SWEEPER ,
				MERCY_ERRAND_RUNNER , BELIEVER_OF_ALTANA , TRADER_OF_MYSTERIES , WANDERING_MINSTREL , ANIMAL_TRAINER , HAVE_WINGS_WILL_FLY ,
				ROD_RETRIEVER , DESTINED_FELLOW , TROUPE_BRILIOTH_DANCER , PROMISING_DANCER , STARDUST_DANCER ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TIMEKEEPER , BRINGER_OF_BLISS , PROFESSIONAL_LOAFER , TRADER_OF_RENOWN , HORIZON_BREAKER , SUMMIT_BREAKER ,
				BROWN_BELT , DUCAL_DUPE , CHOCOBO_LOVE_GURU , PICKUP_ARTIST , WORTHY_OF_TRUST , A_FRIEND_INDEED , CHOCOROOKIE , CRYSTAL_STAKES_CUPHOLDER ,
				WINNING_OWNER , VICTORIOUS_OWNER , TRIUMPHANT_OWNER , HIGH_ROLLER , FORTUNES_FAVORITE , CHOCOCHAMPION ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { PARAGON_OF_BEASTMASTER_EXCELLENCE , PARAGON_OF_BARD_EXCELLENCE , SKY_BREAKER , BLACK_BELT , GREEDALOX , CLOUD_BREAKER ,
				STAR_BREAKER , ULTIMATE_CHAMPION_OF_THE_WORLD , DYNAMISJEUNO_INTERLOPER , DYNAMISBEAUCEDINE_INTERLOPER , DYNAMISXARCABARD_INTERLOPER ,
				DYNAMISQUFIM_INTERLOPER , CONQUEROR_OF_FATE , SUPERHERO , SUPERHEROINE , ELEGANT_DANCER , DAZZLING_DANCE_DIVA , GRIMOIRE_BEARER ,
				FELLOW_FORTIFIER , BUSHIN_ASPIRANT , BUSHIN_RYU_INHERITOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { GRAND_GREEDALOX , SILENCER_OF_THE_ECHO , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }																				
player:startEvent(0x271E,gentitle(player,title2),gentitle(player,title3),gentitle(player,title4),gentitle(player,title5),gentitle(player,title6),gentitle(player,title7),1   ,player:getGil());
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
	 if(csid==0x271E)then
		if(option > 0 and option <29)then
			if (player:delGil(400))then
				local title = { BROWN_MAGE_GUINEA_PIG , BROWN_MAGIC_BYPRODUCT , RESEARCHER_OF_CLASSICS , TORCHBEARER , FORTUNETELLER_IN_TRAINING ,
				CHOCOBO_TRAINER , CLOCK_TOWER_PRESERVATIONIST , LIFE_SAVER , CARD_COLLECTOR , TWOS_COMPANY , TRADER_OF_ANTIQUITIES , GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN ,
				TENSHODO_MEMBER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(title[option])
			end				
		elseif(option > 256 and option <285)then
			if (player:delGil(500))then
				local title = { ACTIVIST_FOR_KINDNESS , ENVOY_TO_THE_NORTH , EXORCIST_IN_TRAINING , FOOLS_ERRAND_RUNNER , STREET_SWEEPER ,
				MERCY_ERRAND_RUNNER , BELIEVER_OF_ALTANA , TRADER_OF_MYSTERIES , WANDERING_MINSTREL , ANIMAL_TRAINER , HAVE_WINGS_WILL_FLY ,
				ROD_RETRIEVER , DESTINED_FELLOW , TROUPE_BRILIOTH_DANCER , PROMISING_DANCER , STARDUST_DANCER ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(  title[option - 256])
			end
		elseif(option > 512 and option < 541)then
			if (player:delGil(600))then
				local title = { TIMEKEEPER , BRINGER_OF_BLISS , PROFESSIONAL_LOAFER , TRADER_OF_RENOWN , HORIZON_BREAKER , SUMMIT_BREAKER ,
				BROWN_BELT , DUCAL_DUPE , CHOCOBO_LOVE_GURU , PICKUP_ARTIST , WORTHY_OF_TRUST , A_FRIEND_INDEED , CHOCOROOKIE , CRYSTAL_STAKES_CUPHOLDER ,
				WINNING_OWNER , VICTORIOUS_OWNER , TRIUMPHANT_OWNER , HIGH_ROLLER , FORTUNES_FAVORITE , CHOCOCHAMPION ,
				0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 512])
			end
		elseif(option > 768 and option <797)then
			if (player:delGil(700))then
				local title = { PARAGON_OF_BEASTMASTER_EXCELLENCE , PARAGON_OF_BARD_EXCELLENCE , SKY_BREAKER , BLACK_BELT , GREEDALOX , CLOUD_BREAKER ,
				STAR_BREAKER , ULTIMATE_CHAMPION_OF_THE_WORLD , DYNAMISJEUNO_INTERLOPER , DYNAMISBEAUCEDINE_INTERLOPER , DYNAMISXARCABARD_INTERLOPER ,
				DYNAMISQUFIM_INTERLOPER , CONQUEROR_OF_FATE , SUPERHERO , SUPERHEROINE , ELEGANT_DANCER , DAZZLING_DANCE_DIVA , GRIMOIRE_BEARER ,
				FELLOW_FORTIFIER , BUSHIN_ASPIRANT , BUSHIN_RYU_INHERITOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 768])
			end
		elseif(option > 1024 and option < 1053)then
			if (player:delGil(800))then
				local title = { GRAND_GREEDALOX , SILENCER_OF_THE_ECHO , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 1024])
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


