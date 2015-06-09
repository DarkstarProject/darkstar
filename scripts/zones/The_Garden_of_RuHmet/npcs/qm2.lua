-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Ix'aern (Dark Knight) Spawn)
-- Allows players to spawn the Ix'aern (Dark Knight) by checking ??? only after killing the required mobs in the same room as the ???.
-- @pos ,-560 5 239
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
		
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------
 
function onTrigger(player,npc)
	--[[
	Kills = GetServerVariable("[PH]Ix_aern_drk");
		--print(Kills)
	moba = GetMobByID(16921018);
	mobb = GetMobByID(16921019);
	mobc = GetMobByID(16921020);
	if (Kills == 0) then 
		player:messageSpecial(UNKNOWN_PRESENCE);
	elseif (Kills == 1) then
		player:messageSpecial(NONE_HOSTILE);
	elseif (Kills == 2) then
		player:messageSpecial(NONE_HOSTILE);--(SHEER_ANIMOSITY);
	elseif (Kills == 3) then 
		moba:setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players @pos.
		SpawnMob(16921018,180):updateClaim(player);
		mobb:setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players @pos.
		SpawnMob(16921019,180):updateClaim(player);
		mobc:setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players @pos.
		SpawnMob(16921020,180):updateClaim(player);
		GetNPCByID(16921028):hideNPC(900);
			if (math.random(0,1) == 1) then -- random do select which item do drop. Will select one item 100% of the time.
				SetDropRate(4397,1854,000);
				else
				SetDropRate(4397,1902,000);
			end
	end
	]]--
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	end;