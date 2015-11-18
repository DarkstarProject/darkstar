-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Aligi-Kufongi
-- Title Change NPC
-- @pos -23 -21 15 26
-----------------------------------

require("scripts/globals/titles");

local title2 = { TAVNAZIAN_SQUIRE ,PUTRID_PURVEYOR_OF_PUNGENT_PETALS , MONARCH_LINN_PATROL_GUARD , SIN_HUNTER_HUNTER , DISCIPLE_OF_JUSTICE , DYNAMISTAVNAZIA_INTERLOPER ,
				CONFRONTER_OF_NIGHTMARES , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { DEAD_BODY , FROZEN_DEAD_BODY , DREAMBREAKER , MIST_MELTER , DELTA_ENFORCER , OMEGA_OSTRACIZER , ULTIMA_UNDERTAKER ,
				ULMIAS_SOULMATE , TENZENS_ALLY , COMPANION_OF_LOUVERANCE , TRUE_COMPANION_OF_LOUVERANCE  , PRISHES_BUDDY  , NAGMOLADAS_UNDERLING ,
				ESHANTARLS_COMRADE_IN_ARMS , THE_CHEBUKKIS_WORST_NIGHTMARE , UNQUENCHABLE_LIGHT , WARRIOR_OF_THE_CRYSTAL  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { ANCIENT_FLAME_FOLLOWER , TAVNAZIAN_TRAVELER , TRANSIENT_DREAMER , THE_LOST_ONE , TREADER_OF_AN_ICY_PAST , BRANDED_BY_LIGHTNING ,
				SEEKER_OF_THE_LIGHT , AVERTER_OF_THE_APOCALYPSE , BANISHER_OF_EMPTINESS , BREAKER_OF_THE_CHAINS , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
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
	if (csid == 0x0156) then
		if (option > 0 and option <29) then
			if (player:delGil(200)) then
				player:setTitle( title2[option] )
			end
		elseif (option > 256 and option <285) then
			if (player:delGil(300)) then
				player:setTitle( title3[option - 256] )
			end
		elseif (option > 512 and option < 541) then
			if (player:delGil(400)) then
				player:setTitle( title4[option - 512] )
			end
		end
	end
end;