---------------------------------------------------
-- Sand Pit
-- Single target bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));
	
	if (mob:getID()== 16806242) then -- if the mobID == Feeler Antlion ID
		local npcX	= mob:getXPos();
		local npcY	= mob:getYPos();
		local npcZ	= mob:getZPos();
		local spawnId = 0;
		
		-- Spawn an Executioner Antlion
		local firstExecutioner = 16806243; -- there are only 5 in the database.		
		if (GetMobAction(firstExecutioner) == 0) then	-- if not spawned, set variable to spawn later.
			spawnId=firstExecutioner;
		elseif (GetMobAction(firstExecutioner+1) == 0) then
			spawnId=firstExecutioner+1;
		elseif (GetMobAction(firstExecutioner+2) == 0) then
			spawnId=firstExecutioner+2;
		elseif (GetMobAction(firstExecutioner+3) == 0) then
			spawnId=firstExecutioner+3;
		elseif (GetMobAction(firstExecutioner+4) == 0) then
			spawnId=firstExecutioner+4;
		else
			spawnId=0; -- If they are all up, then don't spawn any more.
		end;
	
		if (spawnId>0) then
			local executioner = GetMobByID(spawnId);
			executioner:setSpawn(npcX-1,npcY-2,npcZ-1); -- Set its spawn location.
			SpawnMob(spawnId,120):updateEnmity(target);
		end;
	end;
    return typeEffect;
end;