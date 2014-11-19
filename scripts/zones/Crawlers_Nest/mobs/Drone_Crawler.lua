-----------------------------------
-- Area: Crawler's Nest
-- NPC:  Drone Crawler 
-- @pos 4.045 -2.703 285.026 (Spawn 1)
-- @pos -74.939 -2.606 244.139 197 (Spawn 2)                                                                     
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------


function onMobDeath(mob,killer)

	mob = mob:getID();
	 
	if (mob == 17584131) then
		GetNPCByID(17584456):hideNPC(900); -- qm3
	elseif (mob == 17584132) then
		GetNPCByID(17584457):hideNPC(900);-- qm4
	end
	
end;



