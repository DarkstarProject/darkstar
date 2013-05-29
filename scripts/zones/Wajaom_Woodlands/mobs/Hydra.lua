-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Hydra
-- @pos: -282 -24 -1 51
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

function onMobFight(mob, target)

	local battletime = mob:getBattleTime();
	local headbreak, headgrow = mob:getExtraVar(2);
	local broken = mob:AnimationSub();
	
	if (headgrow < battletime and broken > 0) then
		mob:AnimationSub(broken - 1);
		mob:setExtraVar(headbreak, battletime + 300);
	end

end;

function OnCriticalHit(mob)

	local rand = math.random();
	local battletime = mob:getBattleTime();
	local headbreak, headgrow = mob:getExtraVar(2);
	local broken = mob:AnimationSub();
	
	if (rand <= 0.15 and battletime >= headbreak and broken < 2) then
		mob:AnimationSub(broken + 1);
		mob:setExtraVar(battletime + math.random(120, 240), battletime + 300);
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	killer:addTitle(HYDRA_HEADHUNTER);
	
end;