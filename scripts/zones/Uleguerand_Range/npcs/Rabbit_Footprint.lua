-----------------------------------
--  Area: Uleguerand_Range
--   NPC: Rabbit Footprint (Spawns White/Black Coney)
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/status")
require("scripts/globals/npc_util")
-----------------------------------

local points = {
		[1]  = { 390.0830, -0.9039, -424.3834 },
		[2]  = { 405.3988,  0.6603, -416.0932 },
		[3]  = { 403.3210,  0.0126, -404.2754 },
		[4]  = { 410.5687,  0.3688, -391.4490 },
		[5]  = { 418.4933, -0.5737, -383.5276 },
		[6]  = { 431.5144, -0.1639, -392.2122 },
		[7]  = { 426.7340,  0.5218, -402.4513 },
		[8]  = { 420.3062,  0.0522, -414.9328 },
		[9]  = { 404.6560,  0.2487, -430.3242 },
		[10] = { 411.2559,  0.3616, -441.8631 },
		[11] = { 420.9601,  0.2481, -430.3242 },
		[12] = { 427.6630,  0.4786, -434.4034 },
		[13] = { 432.0447,  0.8000, -420.8208 },
		[14] = { 442.7804,  0.3118, -410.2596 },
		[15] = { 449.1314, -0.2384, -421.2825 },
		[16] = { 443.1774,  0.1091, -433.7953 },
		[17] = { 439.1841, -0.1640, -447.2572 }
}

function onTrade(player,npc,trade)
    local coney = nil
	local newMoon = IsMoonNew()
	local fullMoon = IsMoonFull()
	local currentPoint = npc:getLocalVar("currentPoint")
	
	if newMoon then
		coney = ID.mob.BLACK_CONEY
	elseif fullMoon then
		coney = ID.mob.WHITE_CONEY
	end
	
	if coney ~= nil then
		local x = points[currentPoint][1]
		local y = points[currentPoint][2]
		local z = points[currentPoint][3]
		GetMobByID(coney):setSpawn(x,y,z,0)
		if npcUtil.tradeHas(trade, 4389) and npcUtil.popFromQM(player, npc, coney) then -- 4389 is sandorian carrot
			player:confirmTrade()
		end
	end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

-- https://ffxiclopedia.fandom.com/wiki/Black_Coney
-- The Rabbit Footprint is located at (K-11) in the wooded area, and moves around every 7-10 seconds between various spots in that locale.
-- It will spawn 9-15 minutes after the New Moon phase starts and will last until the end of the phase.
-- NOTE: i think 7-10 seconds is WAY too fast, through testing on a GM character with 255 speed i can't even get a carrot into the trade menu before it moves so i used a much higher number

function moveFootprint(npc)
	
	-- triggers every 38.4 seconds (16 vana minutes)
	
	local currentPoint = npc:getLocalVar("currentPoint")
	local nextPoint = math.random(1,17)
	
	if nextPoint == currentPoint then
		nextPoint = nextPoint + 1
		if nextPoint == 18 then
			nextPoint = 1
		end
	end
	
	local nextPointLoc = points[nextPoint]
	npc:setLocalVar("currentPoint",nextPoint)
	npc:setStatus(dsp.status.NORMAL)
	npcUtil.queueMove(npc, nextPointLoc, 1000)
	
end

function onTimeTrigger(npc, triggerID)
	local newMoon = IsMoonNew()
	local fullMoon = IsMoonFull()
	local isSpawned = GetMobByID(ID.mob.WHITE_CONEY):isSpawned() or GetMobByID(ID.mob.BLACK_CONEY):isSpawned()
	local activeTime = npc:getLocalVar("activeTime")
	
	if not isSpawned then
		if newMoon or fullMoon then
			if activeTime == 0 then
				npc:setLocalVar("activeTime",os.time()+math.random(60*9,60*15)) -- moon phase just changed, i'm active in 9 to 15 mins from now
			elseif os.time() > activeTime then
				print("MOVING!")
				moveFootprint(npc)
			end
		else
			npc:setLocalVar("activeTime", 0)
			npc:setLocalVar("currentPoint", 0)
			npc:setStatus(dsp.status.DISAPPEAR)
		end
	end
end

