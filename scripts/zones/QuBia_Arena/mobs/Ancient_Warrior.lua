-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Acient_Warrior
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
	local self = mob:getID()
	-- SpawnMob won't currently work here because the server doesn't actually consider the mob "dead" until this trigger is complete
	-- SpawnMob(self):updateEnmity(killer)
end;
