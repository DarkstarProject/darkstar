-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Militant
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	if(mob:getID() == 17539301) then
		killer:addTimeToDynamis(10);
	end
	
end;