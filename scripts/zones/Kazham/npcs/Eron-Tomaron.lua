-----------------------------------
-- Area: Kazham
-- NPC: Eron-Tomaron
-- Title Change NPC
-- @pos -22 -4 -24 250
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_DISCERNING_INDIVIDUAL , TITLE_VERY_DISCERNING_INDIVIDUAL , TITLE_EXTREMELY_DISCERNING_INDIVIDUAL , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_HEIR_OF_THE_GREAT_FIRE  , TITLE_YA_DONE_GOOD , TITLE_GULLIBLES_TRAVELS , TITLE_KAZHAM_CALLER , TITLE_EXCOMMUNICATE_OF_KAZHAM , TITLE_EVEN_MORE_GULLIBLES_TRAVELS ,
				TITLE_KING_OF_THE_OPOOPOS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TITLE_FODDERCHIEF_FLAYER , TITLE_WARCHIEF_WRECKER , TITLE_DREAD_DRAGON_SLAYER , TITLE_OVERLORD_EXECUTIONER , TITLE_DARK_DRAGON_SLAYER ,
				TITLE_ADAMANTKING_KILLER  , TITLE_BLACK_DRAGON_SLAYER , TITLE_MANIFEST_MAULER , TITLE_BEHEMOTHS_BANE , TITLE_ARCHMAGE_ASSASSIN , HELLSBANE , TITLE_GIANT_KILLER ,
				TITLE_LICH_BANISHER , JELLYBANE , BOGEYDOWNER , BEAKBENDER , SKULLCRUSHER , MORBOLBANE , TITLE_GOLIATH_KILLER , TITLE_MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { TITLE_SIMURGH_POACHER , TITLE_ROC_STAR , TITLE_SERKET_BREAKER  , CASSIENOVA , TITLE_THE_HORNSPLITTER , TITLE_TORTOISE_TORTURER , TITLE_MON_CHERRY ,
				TITLE_BEHEMOTH_DETHRONER , TITLE_THE_VIVISECTOR , TITLE_DRAGON_ASHER , TITLE_EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { TITLE_ADAMANTKING_USURPER , TITLE_OVERLORD_OVERTHROWER , TITLE_DEITY_DEBUNKER , TITLE_FAFNIR_SLAYER , TITLE_ASPIDOCHELONE_SINKER , TITLE_NIDHOGG_SLAYER ,
				TITLE_MAAT_MASHER , TITLE_KIRIN_CAPTIVATOR , TITLE_CACTROT_DESACELERADOR , TITLE_LIFTER_OF_SHADOWS , TITLE_TIAMAT_TROUNCER , TITLE_VRTRA_VANQUISHER , TITLE_WORLD_SERPENT_SLAYER ,
				TITLE_XOLOTL_XTRAPOLATOR , TITLE_BOROKA_BELEAGUERER , TITLE_OURYU_OVERWHELMER , TITLE_VINEGAR_EVAPORATOR , TITLE_VIRTUOUS_SAINT , TITLE_BYEBYE_TAISAI , TITLE_TEMENOS_LIBERATOR ,
				TITLE_APOLLYON_RAVAGER , TITLE_WYRM_ASTONISHER , TITLE_NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
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
	player:startEvent(0x271D,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x271D) then
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
		end
	end
end;