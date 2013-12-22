-----------------------------------	
-- Area: The Shrouded Maw
-- MOB:  Diabolos
-----------------------------------	

-- TODO: CoP Diabolos 
-- 1) Make the diremites in the pit all aggro said player that falls into region
-- 2) Diremites also shouldnt follow you back to the fight area if you make it there. 
-- 3) ANIMATION Packet ids for instance 2 and 3 are wrong (needs guesswork). Sounds working. 

-- TODO: Diabolos Prime
-- Note: Diabolos Prime fight drops all tiles at once. 

-----------------------------------	
-- onMobEngaged
-----------------------------------	

function OnMobEngaged(mob)
end;	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
function onMobDeath(mob,killer)		
end;
	
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;
	
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

	local DiabolosID = 16818177;
	local DiabolosHPP = ((mob:getHP()/mob:getMaxHP())*100); 
	
	if (mob:getID() == DiabolosID) then
	
		local TileOffset = 16818242;
		
		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8); -- Floor opens
			SendEntityVisualPacket(TileOffset, 0x62, 0x79, 0x63, 0x31);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, 0x62, 0x79, 0x63, 0x32); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, 0x62, 0x79, 0x63, 0x33); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, 0x62, 0x79, 0x63, 0x34); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, 0x62, 0x79, 0x63, 0x35); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, 0x62, 0x79, 0x63, 0x36); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, 0x62, 0x79, 0x63, 0x37); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, 0x62, 0x79, 0x63, 0x38); -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, 0x73, 0x31, 0x32, 0x33); -- Tile dropping sound
		end
		
	elseif (mob:getID() == DiabolosID+7) then
	
		local TileOffset = 16818250;
		
		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8);
			SendEntityVisualPacket(TileOffset, 0x62, 0x79, 0x63, 0x39);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound	
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, 0x62, 0x79, 0x63, 0x40);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, 0x62, 0x79, 0x63, 0x41);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, 0x62, 0x79, 0x63, 0x42);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, 0x62, 0x79, 0x63, 0x43);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, 0x62, 0x79, 0x63, 0x44);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, 0x62, 0x79, 0x63, 0x45);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, 0x62, 0x79, 0x63, 0x46);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		end
		
	elseif (mob:getID() == DiabolosID+14) then
	
		local TileOffset = 16818258;
	
		if(DiabolosHPP < 10 and GetNPCByID(TileOffset):getAnimation() == 9)then
			GetNPCByID(TileOffset):setAnimation(8);
			SendEntityVisualPacket(TileOffset, 0x62, 0x79, 0x63, 0x47);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 20 and GetNPCByID(TileOffset+1):getAnimation() == 9)then
			GetNPCByID(TileOffset+1):setAnimation(8);
			SendEntityVisualPacket(TileOffset+1, 0x62, 0x79, 0x63, 0x48);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+1, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 30 and GetNPCByID(TileOffset+2):getAnimation() == 9)then
			GetNPCByID(TileOffset+2):setAnimation(8);
			SendEntityVisualPacket(TileOffset+2, 0x62, 0x79, 0x63, 0x49);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+2, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 40 and GetNPCByID(TileOffset+3):getAnimation() == 9)then
			GetNPCByID(TileOffset+3):setAnimation(8);
			SendEntityVisualPacket(TileOffset+3, 0x62, 0x79, 0x63, 0x50);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+3, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 50 and GetNPCByID(TileOffset+4):getAnimation() == 9)then
			GetNPCByID(TileOffset+4):setAnimation(8);
			SendEntityVisualPacket(TileOffset+4, 0x62, 0x79, 0x63, 0x51);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+4, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 65 and GetNPCByID(TileOffset+5):getAnimation() == 9)then
			GetNPCByID(TileOffset+5):setAnimation(8);
			SendEntityVisualPacket(TileOffset+5, 0x62, 0x79, 0x63, 0x52);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+5, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 75 and GetNPCByID(TileOffset+6):getAnimation() == 9)then
			GetNPCByID(TileOffset+6):setAnimation(8);
			SendEntityVisualPacket(TileOffset+6, 0x62, 0x79, 0x63, 0x53);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+6, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		elseif (DiabolosHPP < 90 and GetNPCByID(TileOffset+7):getAnimation() == 9)then
			GetNPCByID(TileOffset+7):setAnimation(8);
			SendEntityVisualPacket(TileOffset+7, 0x62, 0x79, 0x63, 0x54);   -- Animation for floor dropping
			SendEntityVisualPacket(TileOffset+7, 0x73, 0x31, 0x32, 0x33);   -- Tile dropping sound
		end
	end
end;