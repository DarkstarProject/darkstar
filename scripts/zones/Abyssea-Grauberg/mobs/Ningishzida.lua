-----------------------------------
--  Area: Abyssea - Grauberg (254)
--   Mob: Ningishzida
-----------------------------------

-- require("scripts/zones/Abyssea-Grauberg/MobIDs");
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,375);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-100);
	mob:addMod(MOD_DEF,-200);	
	mob:addMod(MOD_DOUBLE_ATTACK,35);	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)	
end;

-----------------------------------
-- onMobFight
-----------------------------------

function OnMobSpawn(mob)
end;

function onMobFight(mob, target)

	local battletime = mob:getBattleTime();
    local headgrow = mob:getLocalVar("headgrow");
	local broken = mob:AnimationSub();
	
	if (headgrow < battletime and broken > 0) then
		mob:AnimationSub(broken - 1);
		mob:setLocalVar("headgrow", battletime + 300);
	end

end;

function onCriticalHit(mob)

	local rand = math.random();
	local battletime = mob:getBattleTime();
    local headgrow = mob:getLocalVar("headgrow");
	local headbreak = mob:getLocalVar("headbreak");
	local broken = mob:AnimationSub();
	
	if (rand <= 0.15 and battletime >= headbreak and broken < 2) then
		mob:AnimationSub(broken + 1);
		mob:setLocalVar("headgrow", battletime + math.random(120, 240))
        mob:setLocalVar("headbreak", battletime + 300);
	end

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;

