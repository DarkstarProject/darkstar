-----------------------------------
-- Area: Maze of Shakhrami
-- Mob: Lost_Soul
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if(killer:getVar("EquipedforAllOccasions") == 1) then
		killer:setVar("EquipedforAllOccasions",2);
	end
end;
	

