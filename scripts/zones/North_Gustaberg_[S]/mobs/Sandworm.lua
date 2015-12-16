-----------------------------------
-- Area: North_Gustaberg_S
-- NPC:  Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------

require("scripts/globals/titles");
-----------------------------------
-- onMobInitialize
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	
		DespawnMob(17150317); 
		DespawnMob(17109357); 
		DespawnMob(17166720); 
		DespawnMob(17178901); 
		DespawnMob(17121693); 
		DespawnMob(17174888); 	
		local random = 0;
		random = math.random(10);
		
		if (random<=7) then
		mob:setLocalVar("GuivreFight",1);
		end
		if (random >=8) then
		mob:setLocalVar("LambtonWormFight",3);
		end
	
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

function onMobDeath(mob, killer)
	killer:addTitle(SANDWORM_WRANGLER);
	mob:setRespawnTime(math.random(64,128));

end;
-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

end;
