-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Hydra
-- @pos -282 -24 -1 51
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_MATT,75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_ACC,250);
	mob:addMod(MOD_REGAIN,33);	
	mob:addMod(MOD_ATT,50);
	mob:addMod(MOD_DEF,50);
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

function onMobDeath(mob, killer)
	
	killer:addTitle(HYDRA_HEADHUNTER);
	
end;