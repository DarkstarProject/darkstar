-----------------------------------
--	Area: Mhaura
--	NPC: Willah Maratahya
--	Title Change NPC
--  @pos 23 -8 63 249
-----------------------------------

require("scripts/globals/titles");

local title2 = { title.PURVEYOR_IN_TRAINING , title.ONESTAR_PURVEYOR , title.TWOSTAR_PURVEYOR , title.THREESTAR_PURVEYOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { title.FOURSTAR_PURVEYOR , title.FIVESTAR_PURVEYOR , title.HEIR_OF_THE_GREAT_LIGHTNING , title.ORCISH_SERJEANT , title.BRONZE_QUADAV , title.YAGUDO_INITIATE ,
				title.MOBLIN_KINSMAN , title.DYNAMISBUBURIMU_INTERLOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { title.FODDERCHIEF_FLAYER , title.WARCHIEF_WRECKER , title.DREAD_DRAGON_SLAYER , title.OVERLORD_EXECUTIONER , title.DARK_DRAGON_SLAYER ,
				title.ADAMANTKING_KILLER , title.BLACK_DRAGON_SLAYER , title.MANIFEST_MAULER , title.BEHEMOTHS_BANE , title.ARCHMAGE_ASSASSIN , HELLSBANE , title.GIANT_KILLER ,
				title.LICH_BANISHER , JELLYBANE , BOGEYDOWNER , BEAKBENDER , SKULLCRUSHER , MORBOLBANE , title.GOLIATH_KILLER , title.MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { title.SIMURGH_POACHER , title.ROC_STAR , title.SERKET_BREAKER , CASSIENOVA , title.THE_HORNSPLITTER , title.TORTOISE_TORTURER , title.MON_CHERRY ,
				title.BEHEMOTH_DETHRONER , title.THE_VIVISECTOR , title.DRAGON_ASHER , title.EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { title.ADAMANTKING_USURPER , title.OVERLORD_OVERTHROWER , title.DEITY_DEBUNKER , title.FAFNIR_SLAYER , title.ASPIDOCHELONE_SINKER , title.NIDHOGG_SLAYER ,
				title.MAAT_MASHER , title.KIRIN_CAPTIVATOR , title.CACTROT_DESACELERADOR , title.LIFTER_OF_SHADOWS , title.TIAMAT_TROUNCER , title.VRTRA_VANQUISHER , title.WORLD_SERPENT_SLAYER ,
				title.XOLOTL_XTRAPOLATOR , title.BOROKA_BELEAGUERER , title.OURYU_OVERWHELMER , title.VINEGAR_EVAPORATOR , title.VIRTUOUS_SAINT , title.BYEBYE_TAISAI , title.TEMENOS_LIBERATOR ,
				title.APOLLYON_RAVAGER , title.WYRM_ASTONISHER , title.NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
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
	player:startEvent(0x2711,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if (csid==0x2711) then
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