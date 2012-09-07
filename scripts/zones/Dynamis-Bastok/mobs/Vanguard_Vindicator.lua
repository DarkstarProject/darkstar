-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Vindicator
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
	
	if(mob:getID() == 17539300) then
		killer:addTimeToDynamis(10);
	end
	
end;