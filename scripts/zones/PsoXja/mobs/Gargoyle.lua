-----------------------------------
-- Area: Pso'xja
-- NPC:  Gargoyle
-----------------------------------



-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	for i = 0, 16, 1 do
	
	local GargoyleOffset = 16814081 + (i-1);
	local DoorOffset = 16814444 + (i-1);
	
		if(mob:getID() == GargoyleOffset) then
			GetNPCByID(DoorOffset):openDoor(30);
		end
	end
	
end;