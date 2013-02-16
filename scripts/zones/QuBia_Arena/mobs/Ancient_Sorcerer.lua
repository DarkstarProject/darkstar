-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	-- Select the mobs from this specific BCNM
	self = mob:getID()
	if(self == 17620994 or self == 17621001 or self == 17621008) then
		Lich = self-1
		Sorc = self+1
	else
		Lich = self-2
		Sorc = self-1
	end

	-- Link other Sorcerer and Archlich when attacked
	GetMobByID(Sorc):updateEnmity(attacker);
	GetMobByID(Lich):updateEnmity(attacker);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;