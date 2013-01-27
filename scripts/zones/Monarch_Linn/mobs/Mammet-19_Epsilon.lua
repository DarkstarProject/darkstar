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
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	if (mob >= 16904193 and mob =< 16904195) then -- first instance
		GetMobByID(16904193):updateEnmity(target);
		GetMobByID(16904194):updateEnmity(target);
		GetMobByID(16904195):updateEnmity(target);
	elseif (mob >= 16904196 and mob =< 16904198) then -- second instance
		GetMobByID(16904196):updateEnmity(target);
		GetMobByID(16904197):updateEnmity(target);
		GetMobByID(16904198):updateEnmity(target);
	elseif (mob >= 16904199 and mob =< 16904201) then -- third instance
		GetMobByID(16904199):updateEnmity(target);
		GetMobByID(16904200):updateEnmity(target);
		GetMobByID(16904201):updateEnmity(target);
	end
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