-----------------------------------
-- Area: bibiki bay
-- NPC:  Shen
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() % 45 == 0) then
		if(GetMobAction(16793860) == 0) then
			SpawnMob(16793860,300):updateEnmity(target);
		elseif(GetMobAction(16793861) == 0) then
			SpawnMob(16793861,300):updateEnmity(target);
		end
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob,target)
    
	-- casts Water IV, Waterga III, Flood, Drown 
    rnd = math.random();
    
    if (rnd < 0.5) then
        return 201; -- waterga 3
    elseif (rnd < 0.7) then
         return 172; -- water 4
    elseif (rnd < 0.9) then
        return 214; -- flood
    else
        return 240; -- drown
    end
    
end;