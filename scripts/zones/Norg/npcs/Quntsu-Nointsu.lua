-----------------------------------
-- Area: Norg
-- NPC: Quntsu-Nointsu
-- Title Change NPC
-- @pos -67 -1 34 252
-----------------------------------

require("scripts/globals/titles");

local title2 = { title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES , title.BUSHIDO_BLADE , title.BLACK_MARKETEER , title.CRACKER_OF_THE_SECRET_CODE ,
				title.LOOKS_SUBLIME_IN_A_SUBLIGAR , title.LOOKS_GOOD_IN_LEGGINGS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { title.APPRENTICE_SOMMELIER , title.TREASUREHOUSE_RANSACKER , title.HEIR_OF_THE_GREAT_WATER , title.PARAGON_OF_SAMURAI_EXCELLENCE ,
				title.PARAGON_OF_NINJA_EXCELLENCE , title.GUIDER_OF_SOULS_TO_THE_SANCTUARY , title.BEARER_OF_BONDS_BEYOND_TIME , title.FRIEND_OF_THE_OPOOPOS ,
				title.PENTACIDE_PERPETRATOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { title.BEARER_OF_THE_WISEWOMANS_HOPE , title.BEARER_OF_THE_EIGHT_PRAYERS , LIGHTWEAVER , title.DESTROYER_OF_ANTIQUITY , title.SEALER_OF_THE_PORTAL_OF_THE_GODS ,
				title.BURIER_OF_THE_ILLUSION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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
	player:startEvent(0x03F3,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x03F3) then
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
		end
	end
end;