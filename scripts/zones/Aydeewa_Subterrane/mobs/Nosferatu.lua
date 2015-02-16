-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Nosferatu
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_REGAIN,1);
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
	local mobHP = mob:getHPP();
	local mobID = mob:getID();
	local petIDs1 = {17056160,17056161,17056159};
	local petIDs2 = {17056162,17056163,17056164};
	local petIDs3 = {17056165,17056166,17056167};
	local petStatus = {GetMobAction(petIDs1[1]),GetMobAction(petIDs1[2]),GetMobAction(petIDs1[3])};
	local petStatus = {GetMobAction(petIDs2[1]),GetMobAction(petIDs2[2]),GetMobAction(petIDs2[3])};
	local petStatus = {GetMobAction(petIDs3[1]),GetMobAction(petIDs3[2]),GetMobAction(petIDs3[3])};
	
	if(target:getAnimation() == 0) then
		mob:resetEnmity(target);
		mob:ActionDisengage(true);
	end
	
	if(mobHP < 75) then
		for i = 1, 3 do
			if petStatus[i] == 0 then
				SpawnMob(petIDs1[i],800):updateEnmity(target);
				GetMobByID(petIDs1[i]):addStatusEffect(EFFECT_REGAIN,300,0,1);
			end
		end
	end	
	if(mobHP < 50 and mobHP > 25) then
	    mob:setMod(MOD_REGAIN, 7);
		for i = 1, 3 do
			if petStatus[i] == 0 then
				SpawnMob(petIDs2[i],800):updateEnmity(target);
				GetMobByID(petIDs2[i]):addStatusEffect(EFFECT_REGAIN,300,0,1);
			end
		end   
	end	   
	if(mobHP < 25 and mobHP > 10) then	
        mob:setMod(MOD_REGAIN, 0);
		for i = 1, 3 do
			if petStatus[i] == 0 then
				SpawnMob(petIDs3[i],800):updateEnmity(target);
				GetMobByID(petIDs3[i]):addStatusEffect(EFFECT_REGAIN,300,0,1);
			end
		end   
	end	   
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	local petIDs1 = {17056160,17056161,17056159};
	local petIDs2 = {17056162,17056163,17056164};
	local petIDs3 = {17056165,17056166,17056167};
	
	for i = 1, 3 do
		DespawnMob(petIDs1[i]);
		DespawnMob(petIDs2[i]);
		DespawnMob(petIDs3[i]);
	end	
end;
