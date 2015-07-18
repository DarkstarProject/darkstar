-----------------------------------
-- Area: The Shrouded Maw
-- MOB:  Diabolos
-----------------------------------

-- TODO: CoP Diabolos
-- 1) Make the diremites in the pit all aggro said player that falls into region. Should have a respawn time of 10 seconds.
-- 2) Diremites also shouldnt follow you back to the fight area if you make it there. Should despawn and respawn instantly if all players
-- 	  make it back to the Diabolos floor area.
-- 3) ANIMATION Packet ids for instance 2 and 3 are wrong (needs guesswork). Sounds working.

-- TODO: Diabolos Prime
-- Note: Diabolos Prime fight drops all tiles at once.

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,killer)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	local DiabolosID = 16818177;
	local DiabolosHPP = ((mob:getHP()/mob:getMaxHP())*100);

	if (mob:getID() == DiabolosID) then

		local TileOffset = 16818258;

		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8); -- Floor opens
			SendEntityVisualPacket(TileOffset, "byc1");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, "byc2"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, "byc3"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, "byc4"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, "byc5"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, "byc6"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, "byc7"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, "s123"); -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, "byc8"); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, "s123"); -- Tile dropping sound
		end

	elseif (mob:getID() == DiabolosID+7) then

		local TileOffset = 16818266;

		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8);
			SendEntityVisualPacket(TileOffset, "bya1");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, "bya2");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, "bya3");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, "bya4");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, "bya5");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, "bya6");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, "bya7");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, "bya8");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, "s123");   -- Tile dropping sound
		end

	elseif (mob:getID() == DiabolosID+14) then

		local TileOffset = 16818274;

		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8);
			SendEntityVisualPacket(TileOffset, "byY1");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, "byY2");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, "byY3");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, "byY4");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, "byY5");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, "byY6");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, "byY7");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, "s123");   -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, "byY8");   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, "s123");   -- Tile dropping sound
		end
	end
end;