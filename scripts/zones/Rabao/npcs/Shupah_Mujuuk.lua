-----------------------------------
-- Area: Rabao
-- NPC: Shupah Mujuuk
-- Title Change NPC
-- @pos 12 8 20 247
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
local title2 = { THE_IMMORTAL_FISHER_LU_SHANG , INDOMITABLE_FISHER , KUFTAL_TOURIST , ACQUIRER_OF_ANCIENT_ARCANUM , DESERT_HUNTER ,
				ROOKIE_HERO_INSTRUCTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { HEIR_OF_THE_GREAT_WIND , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { FODDERCHIEF_FLAYER , WARCHIEF_WRECKER , DREAD_DRAGON_SLAYER , OVERLORD_EXECUTIONER , DARK_DRAGON_SLAYER ,
				ADAMANTKING_KILLER , BLACK_DRAGON_SLAYER , MANIFEST_MAULER , BEHEMOTHS_BANE , ARCHMAGE_ASSASSIN , HELLSBANE , GIANT_KILLER ,
				LICH_BANISHER , JELLYBANE , BOGEYDOWNER , BEAKBENDER , SKULLCRUSHER , MORBOLBANE , GOLIATH_KILLER , MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { SIMURGH_POACHER , ROC_STAR , SERKET_BREAKER , CASSIENOVA , THE_HORNSPLITTER , TORTOISE_TORTURER , MON_CHERRY ,
				BEHEMOTH_DETHRONER , THE_VIVISECTOR , DRAGON_ASHER , EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { ADAMANTKING_USURPER , OVERLORD_OVERTHROWER , DEITY_DEBUNKER , FAFNIR_SLAYER , ASPIDOCHELONE_SINKER , NIDHOGG_SLAYER ,
				MAAT_MASHER , KIRIN_CAPTIVATOR , CACTROT_DESACELERADOR , LIFTER_OF_SHADOWS , TIAMAT_TROUNCER , VRTRA_VANQUISHER , WORLD_SERPENT_SLAYER ,
				XOLOTL_XTRAPOLATOR , BOROKA_BELEAGUERER , OURYU_OVERWHELMER , VINEGAR_EVAPORATOR , VIRTUOUS_SAINT , BYEBYE_TAISAI , TEMENOS_LIBERATOR ,
				APOLLYON_RAVAGER , WYRM_ASTONISHER , NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
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
				local title = { THE_IMMORTAL_FISHER_LU_SHANG , INDOMITABLE_FISHER , KUFTAL_TOURIST , ACQUIRER_OF_ANCIENT_ARCANUM , DESERT_HUNTER ,
				ROOKIE_HERO_INSTRUCTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(title[option])
			end				
		elseif(option > 256 and option <285)then
			if (player:delGil(300))then
				local title = { HEIR_OF_THE_GREAT_WIND , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle(  title[option - 256])
			end
		elseif(option > 512 and option < 541)then
			if (player:delGil(400))then
				local title = { FODDERCHIEF_FLAYER , WARCHIEF_WRECKER , DREAD_DRAGON_SLAYER , OVERLORD_EXECUTIONER , DARK_DRAGON_SLAYER ,
				ADAMANTKING_KILLER , BLACK_DRAGON_SLAYER , MANIFEST_MAULER , BEHEMOTHS_BANE , ARCHMAGE_ASSASSIN , HELLSBANE , GIANT_KILLER ,
				LICH_BANISHER , JELLYBANE , BOGEYDOWNER , BEAKBENDER , SKULLCRUSHER , MORBOLBANE , GOLIATH_KILLER , MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 512])
			end
		elseif(option > 768 and option <797)then
			if (player:delGil(500))then
				local title = { SIMURGH_POACHER , ROC_STAR , SERKET_BREAKER , CASSIENOVA , THE_HORNSPLITTER , TORTOISE_TORTURER , MON_CHERRY ,
				BEHEMOTH_DETHRONER , THE_VIVISECTOR , DRAGON_ASHER , EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
				player:setTitle( title[option - 768])
			end
		elseif(option > 1024 and option < 1053)then
			if (player:delGil(600))then
				local title = { ADAMANTKING_USURPER , OVERLORD_OVERTHROWER , DEITY_DEBUNKER , FAFNIR_SLAYER , ASPIDOCHELONE_SINKER , NIDHOGG_SLAYER ,
				MAAT_MASHER , KIRIN_CAPTIVATOR , CACTROT_DESACELERADOR , LIFTER_OF_SHADOWS , TIAMAT_TROUNCER , VRTRA_VANQUISHER , WORLD_SERPENT_SLAYER ,
				XOLOTL_XTRAPOLATOR , BOROKA_BELEAGUERER , OURYU_OVERWHELMER , VINEGAR_EVAPORATOR , VIRTUOUS_SAINT , BYEBYE_TAISAI , TEMENOS_LIBERATOR ,
				APOLLYON_RAVAGER , WYRM_ASTONISHER , NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
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



