-----------------------------------
-- Area: Monarch Linn
-- NPC:  Mammet 19
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() % 30 == 0) then
		if(mob:hasStatusEffect(EFFECT_FOOD)) then
			local effect = mob:getStatusEffect(EFFECT_FOOD);
			
			if(effect:getPower() == 5264) then -- Yellow Liquid
				return;
			end
		end
		
		if(mob:getSkinID() == 0 or mob:getSkinID() == 1) then
			mob:changeSkin(2); -- Sword Form
		elseif(mob:getSkinID() == 2) then
			mob:changeSkin(3); -- Staff Form
		elseif(mob:getSkinID() == 3) then
			mob:changeSkin(4); -- Polearm Form
		else
			mob:changeSkin(1); -- Hand Form
		end
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;