-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Medusa
-- @pos -460 -20.5 460 54
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
	mob:addMod(MOD_REGAIN,1);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
    
end;
function onMobFight(mob,target)
    local mobHP = mob:getHPP();
	local mobID = mob:getID();
	

	local petIDs = {16998863,16998864,16998865,16998866};
	local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4])};
	
	
	
	if(mobHP < 75) then
		for i = 1, 4 do
		    GetMobByID(petIDs[i]):changeSkin(18);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i],800):updateEnmity(target);
			end
		end
	end	
	if(mobHP < 50 and mobHP > 25) then
	       mob:setdMod(MOD_REGAIN,7);
	end	   
	if(mobHP < 25 and mobHP > 10) then	
            mob:setMod(MOD_REGAIN,1);
	
	end	   
    if(mobHP < 10) then
	    GetMobByID(16998863):addStatusEffect(EFFECT_CHAINSPELL,0,0,15);
		GetMobByID(16998864):addStatusEffect(EFFECT_CHAINSPELL,0,0,15);
		GetMobByID(16998865):addStatusEffect(EFFECT_CHAINSPELL,0,0,15);
		GetMobByID(16998866):addStatusEffect(EFFECT_CHAINSPELL,0,0,15);  
	end
	
    for i = 1, 4 do
		if (petStatus[i] == 16 or petStatus[i] == 18) then
			GetMobByID(petIDs[i],800):updateEnmity(target);
		end
	end
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    DespawnMob(16998863);
	DespawnMob(16998864);
	DespawnMob(16998865);
	DespawnMob(16998866);
	killer:addTitle(GORGONSTONE_SUNDERER);
end;