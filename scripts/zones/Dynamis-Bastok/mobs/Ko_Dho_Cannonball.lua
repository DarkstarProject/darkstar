-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Ko'Dho Cannonball
-- Boss Trigger for Gu'Dha Effigy
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_MAIN_2HOUR,1);
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

	local bossTrigger = GetServerVariable("[DynaBastok]Boss_Trigger");

	if(bossTrigger == 0 or bossTrigger == 1 or bossTrigger == 4 or bossTrigger == 5) then
		SetServerVariable("[DynaBastok]Boss_Trigger",bossTrigger + 2);
	end

	-- If 3 boss trigger is killer -> pop the boss
	if(GetServerVariable("[DynaBastok]Boss_Trigger") == 7) then
		SpawnMob(17539073);
		SetServerVariable("[DynaBastok]Boss_Trigger",0);
	end

end;