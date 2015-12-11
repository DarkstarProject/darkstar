-----------------------------------
-- Area: East Ronfaure [S]
-- NPC:  Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------

require("scripts/globals/titles");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
	
	local mobids = {17109357,
					17138041,
					17166720,
					17178901,
					17121693,
					17150317,
					17174888}
	local mob = mobids[math.random(1, #mobids)];
	SpawnMob(mob);
end;
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob,player)
		
		
		GetMobByID(17138041):setHP(0);
		GetMobByID(17166720):setHP(0);
		GetMobByID(17178901):setHP(0);
		GetMobByID(17121693):setHP(0);
		GetMobByID(17150317):setHP(0);
		GetMobByID(17174888):setHP(0);		
		
		
			
end;

-----------------------------------
-- onMobWeaponSkill
-----------------------------------
function onMobWeaponSkill(target, mob, skill)
     if (mob:getHP() < ((mob:getMaxHP() / 10) * 2.5)) then
	mob:useMobAbility(1936);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	killer:addTitle(SANDWORM_WRANGLER);
	
	
end;
-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
	mob:setRespawnTime(math.random(64,128));
	
end;
