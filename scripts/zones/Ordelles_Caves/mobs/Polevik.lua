-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Polevik
-- Involved In Quest: Dark Puppet
-- @pos -51 0.1 3 193
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if (killer:getVar("sharpeningTheSwordCS") == 3) then
		killer:setVar("PolevikKilled",1);
		killer:setVar("Polevik_Timer",os.time());
	end

end;