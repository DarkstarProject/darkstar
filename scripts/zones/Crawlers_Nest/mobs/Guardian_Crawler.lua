-----------------------------------
-- Area: Crawler's Nest
-- NPC:  Guardian Crawler
-- @pos 124.335 -34.609 -75.373 197 (spawn area 1)
-- @pos 44.436 -2.602 195.381 197 (spawn area 2)
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

	local mob = mob:getID();
	 
	if (mob == 17584129) then
		GetNPCByID(17584454):hideNPC(900); -- qm1
	elseif (mob == 17584130) then
		GetNPCByID(17584455):hideNPC(900); -- qm2
	end
	
end;