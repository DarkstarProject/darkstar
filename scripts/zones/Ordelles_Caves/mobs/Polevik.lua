-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Polevik
-- Involved In Quest: Sharpening the Sword
-- @zone 193
-- @pos -51 0 3
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

	if(killer:getVar("sharpeningTheSwordCS") == 3) then
		killer:setVar("PolevikKilled",1);
		killer:setVar("Polevik_Timer",os.time());
	end

end;