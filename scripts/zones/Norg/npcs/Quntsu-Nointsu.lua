-----------------------------------
-- Area: Norg
-- NPC: Quntsu-Nointsu
-- Title Change NPC
-- @pos -67 -1 34 252
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local title2 = { HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES , BUSHIDO_BLADE , BLACK_MARKETEER , CRACKER_OF_THE_SECRET_CODE ,
				LOOKS_SUBLIME_IN_A_SUBLIGAR , LOOKS_GOOD_IN_LEGGINGS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { APPRENTICE_SOMMELIER , TREASUREHOUSE_RANSACKER , HEIR_OF_THE_GREAT_WATER , PARAGON_OF_SAMURAI_EXCELLENCE ,
				PARAGON_OF_NINJA_EXCELLENCE , GUIDER_OF_SOULS_TO_THE_SANCTUARY , BEARER_OF_BONDS_BEYOND_TIME , FRIEND_OF_THE_OPOOPOS ,
				PENTACIDE_PERPETRATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { BEARER_OF_THE_WISEWOMANS_HOPE , BEARER_OF_THE_EIGHT_PRAYERS , LIGHTWEAVER , DESTROYER_OF_ANTIQUITY , SEALER_OF_THE_PORTAL_OF_THE_GODS ,
				BURIER_OF_THE_ILLUSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }												
player:startEvent(0x03F3,gentitle(player,title2),gentitle(player,title3),gentitle(player,title4),gentitle(player,title5),gentitle(player,title6),gentitle(player,title7),1   ,player:getGil());
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
	 if(csid==0x03F3)then
		if(option > 0 and option <29)then
			if (player:delGil(200))then
				local title = { HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES , BUSHIDO_BLADE , BLACK_MARKETEER , CRACKER_OF_THE_SECRET_CODE ,
				LOOKS_SUBLIME_IN_A_SUBLIGAR , LOOKS_GOOD_IN_LEGGINGS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(title[option])
			end				
		elseif(option > 256 and option <285)then
			if (player:delGil(300))then
				local title = { APPRENTICE_SOMMELIER , TREASUREHOUSE_RANSACKER , HEIR_OF_THE_GREAT_WATER , PARAGON_OF_SAMURAI_EXCELLENCE ,
				PARAGON_OF_NINJA_EXCELLENCE , GUIDER_OF_SOULS_TO_THE_SANCTUARY , BEARER_OF_BONDS_BEYOND_TIME , FRIEND_OF_THE_OPOOPOS ,
				PENTACIDE_PERPETRATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(  title[option - 256])
			end
		elseif(option > 512 and option < 541)then
			if (player:delGil(400))then
				local title = { BEARER_OF_THE_WISEWOMANS_HOPE , BEARER_OF_THE_EIGHT_PRAYERS , LIGHTWEAVER , DESTROYER_OF_ANTIQUITY , SEALER_OF_THE_PORTAL_OF_THE_GODS ,
				BURIER_OF_THE_ILLUSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 512])
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



