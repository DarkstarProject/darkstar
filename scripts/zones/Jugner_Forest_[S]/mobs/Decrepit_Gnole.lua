-----------------------------------
-- Area: Jugner Forest (S)
-- NPC:  Decrepit Gnole
-----------------------------------
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-- Change forms every 60 seconds
-----------------------------------

function onMobEngaged(mob,target)	
	local changeTime = mob:getLocalVar("changeTime");
	
	if(mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(1);
		mob:setLocalVar("changeTime", mob:getBattleTime());
	elseif(mob:AnimationSub() == 1 and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(0);
		mob:setLocalVar("changeTime", mob:getBattleTime());
	end
end;