-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Aligi-Kufongi
-- Title Change NPC
-- @pos -23 -21 15 26
-----------------------------------

require("scripts/globals/titles");

local title2 = { TITLE_TAVNAZIAN_SQUIRE ,TITLE_PUTRID_PURVEYOR_OF_PUNGENT_PETALS , TITLE_MONARCH_LINN_PATROL_GUARD , TITLE_SIN_HUNTER_HUNTER , TITLE_DISCIPLE_OF_JUSTICE , TITLE_DYNAMISTAVNAZIA_INTERLOPER ,
				TITLE_CONFRONTER_OF_NIGHTMARES , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { TITLE_DEAD_BODY , TITLE_FROZEN_DEAD_BODY , DREAMBREAKER , TITLE_MIST_MELTER , TITLE_DELTA_ENFORCER , TITLE_OMEGA_OSTRACIZER , TITLE_ULTIMA_UNDERTAKER ,
				TITLE_ULMIAS_SOULMATE , TITLE_TENZENS_ALLY , TITLE_COMPANION_OF_LOUVERANCE , TITLE_TRUE_COMPANION_OF_LOUVERANCE  , TITLE_PRISHES_BUDDY  , TITLE_NAGMOLADAS_UNDERLING ,
				TITLE_ESHANTARLS_COMRADE_IN_ARMS , TITLE_THE_CHEBUKKIS_WORST_NIGHTMARE , TITLE_UNQUENCHABLE_LIGHT , TITLE_WARRIOR_OF_THE_CRYSTAL  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { TITLE_ANCIENT_FLAME_FOLLOWER , TITLE_TAVNAZIAN_TRAVELER , TITLE_TRANSIENT_DREAMER , TITLE_THE_LOST_ONE , TITLE_TREADER_OF_AN_ICY_PAST , TITLE_BRANDED_BY_LIGHTNING ,
				TITLE_SEEKER_OF_THE_LIGHT , TITLE_AVERTER_OF_THE_APOCALYPSE , TITLE_BANISHER_OF_EMPTINESS , TITLE_BREAKER_OF_THE_CHAINS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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
	player:startEvent(0x0156,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
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
	if(csid == 0x0156) then
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
		end
	end
end;