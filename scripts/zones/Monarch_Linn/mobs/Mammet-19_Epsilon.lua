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
	local engaged = mob:getID();

	if (engaged >= 16904193 and engaged <= 16904195) then -- first instance
		for i=16904193,16904195 do
			GetMobByID(i):updateEnmity(target);
			AncientVowsFormTimer[i] = os.time() + math.random(30,90);
			if (GetMobByID(i):AnimationSub() ~= 3) then
				mob:SetMagicCastingEnabled(false);
			end
		end
	elseif (engaged >= 16904196 and engaged <= 16904198) then -- second instance
		for i=16904196,16904198 do
			GetMobByID(i):updateEnmity(target);
			AncientVowsFormTimer[i] = os.time() + math.random(30,90);
			if (GetMobByID(i):AnimationSub() ~= 3) then
				mob:SetMagicCastingEnabled(false);
			end
		end
	elseif (engaged >= 16904199 and engaged <= 16904201) then -- third instance
		for i=16904199,16904201 do
			GetMobByID(i):updateEnmity(target);
			AncientVowsFormTimer[i] = os.time() + math.random(30,90);
			if (GetMobByID(i):AnimationSub() ~= 3) then
				mob:SetMagicCastingEnabled(false);
			end
		end
	end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)
	local randnum;
	local form = mob:AnimationSub();
	local mobid = mob:getID();

	-- Mammets seem to be able to change to any given form, per YouTube videos
	-- Added a random chance to change forms every 3 seconds if 60 seconds have passed, just to make things less formulaic.
		-- May be able to change forms more often.  Witnessed one at ~50 seconds, most were 60-80.
		-- Believe it or not, these changes may be too slow @ 50% chance.  Probability is a pain.
	-- L40 means their "weapons" are 40 DMG by default.
	if (os.time() > AncientVowsFormTimer[mobid] and math.random(0,1) == 1) then

		-- Locks forms if inflicted with Yellow Liquid
		if (mob:hasStatusEffect(EFFECT_FOOD) == true) then
			local effect = mob:getStatusEffect(EFFECT_FOOD);
			if (effect:getPower() == 5264) then
				return;
			end
		end

		-- Pick a new form.
		repeat
			randnum = math.random(0,3);
		until (randnum ~= form);

		-- setDamage works beautifully, but setDelay doesn't seem to be working.  Increased DMG turned off.
		if (randnum == 0) then -- Hand Form, ~3s delay
			mob:SetMagicCastingEnabled(false);
			-- mob:setDelay(3000);
			-- mob:setDamage(40);
		elseif (randnum == 1) then -- Sword Form, ~2s delay, melee hits for ~50-100 vs WHM/BLM w/o buffs, 40 DMG seems to work.
			mob:SetMagicCastingEnabled(false);
			-- mob:setDelay(2000);
			-- mob:setDamage(40);
		elseif (randnum == 2) then -- Polearm Form, ~3-3.5s delay, melee hits for ~100-150.  Takes about 70-80 DMG to make this happen.
			mob:SetMagicCastingEnabled(false);
			-- mob:setDelay(3250);
			-- mob:setDamage(75);
		elseif (randnum == 3) then -- Staff Form, ~4s delay, ~10 seconds between spell ends and next cast
			mob:setMobMod(MOBMOD_MAGIC_COOL, 10);
			mob:SetMagicCastingEnabled(true);
			-- mob:setDelay(700);
			-- mob:setDamage(40);
		end
		mob:AnimationSub(randnum);
		-- Set new timers
		AncientVowsFormTimer[mobid] = os.time() + 60;
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;