-----------------------------------
-- Area: 
-- NPC:  Pandemonium_Warden
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

-- Uncomment if you're testing with @spawnmob, otherwise you'll get all kinds of nil errors and no pets, while onMobFight doesn't run.
-- Leave commented in most situations, otherwise players can reset their despawn timer.
--[[
	PWardenDespawnTime = os.time(t) + 7200; -- Two hours to forcible depop, if PWarden is engaged.
 	PWardenAstralFlows = 0;

	for i = 17056170, 17056177, 1 do 
		SpawnMob(i,180):updateEnmity(target);
	end
]]--
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)

	local mobID = mob:getID();
	local mobSkin = mob:getSkinID();
	local mobHP = mob:getHP();
	local mobMaxHP = mob:getMaxHP();

	local petIDs = {17056170,17056171,17056172,17056173,17056174,17056175,17056176,17056177};
	local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4]),GetMobAction(petIDs[5]),GetMobAction(petIDs[6]),GetMobAction(petIDs[7]),GetMobAction(petIDs[8])};

	-- changing skin and lamps change skin with him
	-- only needs skills so that will trigger his next skin change and to trigger on his last spawn the change of the lamps to avatars
	-- astral needs to trigger avatar skin change at 25% 50% and 75% i only added 50% for now till the skills are in and i or somebody else can change the script a bit

	-- 2/26/13
	-- I can't help but think this could be better executed with a single set of logic checks and a table of HP and skin values.
	-- Just the same, at least his pets respawn every form, and he doesn't get stuck.
	-- There are two sets of PW in the mobids.  It's entirely possible SE did this fight by swapping between the two somehow.

	-- Some sources claim he should linger in Dverger form and throw off a few TP moves between forms.
	-- Should end up in "mini-dverger" form at the end.  Currently does not.

	-- Missing TP moves, et al.  Might want to give him custom ones so we don't clutter up a bunch of unrelated onMobSkillChecks.

	------------------------ FORM CHANGES ------------------------

	-- Khimera + Puks (20k HP)
	if(mobHP < 20000 and mobSkin <= 13) then
		mob:changeSkin(14);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(22);
			if petStatus[i] == 0 then -- Dead pet, get it up.
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Hydra + Dahaks (20k HP)
	elseif(mobHP < 40000 and mobSkin <= 12) then
		mob:changeSkin(13);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(21);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Cerberus + Bombs (20k HP)
	elseif(mobHP < 60000 and mobSkin <= 11) then
		mob:changeSkin(12);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(20);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Gurfurlur the Menacing + Trolls (15k hp)
	elseif(mobHP < 75000 and mobSkin <= 10) then
		mob:changeSkin(11);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(19);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Medusa + Lamia / Merrows (15k hp)
	-- Reports of RNG x2, BLM x1, RDM x2, and SAMx1, instead of all the same.  Needs to be researched and possibly corrected.
	elseif(mobHP < 90000 and mobSkin <= 9) then
		mob:changeSkin(10);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(18);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Gulool Ja Ja + Mamool Ja (15k hp)
	elseif(mobHP < 105000 and mobSkin <= 8) then
		mob:changeSkin(9);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(17);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Long-Bowed Chariot + Gear Trios (10k hp)
	elseif(mobHP < 115000 and mobSkin <= 7) then
		mob:changeSkin(8);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(16);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Armored Chariot + Gear Trios (10k hp)
	elseif(mobHP < 125000 and mobSkin <= 6) then
		mob:changeSkin(7);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(16);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Battleclad Chariot + Gear Trios (10k hp)
	elseif(mobHP < 135000 and mobSkin <= 5) then
		mob:changeSkin(6);
		for i = 1, 8 do
			GetMobByID(petIDs[i]):changeSkin(16);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Long-Armed Chariot + Gear Trios (10k hp)
	elseif(mobHP < 145000 and mobSkin == 15) then
		mob:changeSkin(5);
		for i = 1, 8 do
			
			GetMobByID(petIDs[i]):changeSkin(16);
			if petStatus[i] == 0 then
				SpawnMob(petIDs[i]):updateEnmity(target);
			end
		end

	-- Reverts back to Pandemonium Warden form (is this correct behavior?)
	elseif(mobHP > 145000 and mobSkin ~= 15) then
		mob:changeSkin(15);
	end


	------------------------ Keep pets active ------------------------
	-- Pets probably shouldn't despawn for this, but proof otherwise should remove this code.

	for i = 1, 8 do
		if (petStatus[i] == 16 or petStatus[i] == 18) then -- idle or disengaging pet
			GetMobByID(petIDs[i]):updateEnmity(target);
		end
	end

	------------------------ Despawn timer ------------------------
	if (os.time(t) > PWardenDespawnTime) then
		for i=17056170, 17056186 do
			DespawnMob(i);
		end
	end

	-- Very much early code.  Couldn't find a way to depop the mob after AF pacts had executed.  As such, doesn't work.
	-- Obviously, you have to move the Avatars to their own family, and give them access to AFlows via a new set of moves.
	-- Might be able to cheat by giving them a copy AFlow (change the name!) that despawns the mob once completed.
	-- Rearranging the skins may be necessary to use this trick efficiently on more SMNs.
	-- Either that, or probably somewhat complex core code.  Avatars may not always be mobid+1.
	-- It wasn't clear if the avatars were a separate pop, or if all dead lamps should revive, go avatar, and AFlow.

	--[[
	------------------------ Astral Flow Logic ------------------------
	-- Missing the log message for players.  Needs to be handled in the core somehow.
	-- Possibly supposed to use twice per trigger?  Did not check too far on this.  Sounds fun.
	if (mobHP <= (mobMaxHP * 0.75) and target:getMaskBit(PWardenAstralFlows,3) == false) then
		for i=17056178, 17056186 do
			local rannum = math.random(0,7);
			local avatar = GetMobByID(i);
			avatar:changeSkin(23 + rannum); -- Random avatar skin
			SpawnMob(i):updateEnmity(target);
			avatar:useMobAbility(656);
			DespawnMob(i);
		end
		PWardenAstralFlows = PWardenAstralFlows + 4;
		-- 23 = Shiva, 628 Diamond Dust
		-- 24 = Ramuh, 637 Judgement Bolt
		-- 25 = Titan, 601 Earthen Fury
		-- 26 = Ifrit, 592 Inferno
		-- 27 = Leviathan, 610 Tidal Wave
		-- 28 = Garuda, 619 Aerial Blast
		-- 29 = Fenrir, 583 Howling Moon
		-- 30 = Carbuncle, 656 Searing Light
		-- 31 = Diabolos
		-- 646 = wyvern breath.  Need to find diabolos.

	elseif (mobHP <= (mobMaxHP * 0.5) and target:getMaskBit(PWardenAstralFlows,2) == false) then
		for i=17056178, 17056186 do
			local rannum = math.random(0,7);
			local avatar = GetMobByID(i);
			avatar:changeSkin(23 + rannum); -- Random avatar skin
			SpawnMob(i):updateEnmity(target);
			avatar:useMobAbility(656);
			DespawnMob(i);
		end
		PWardenAstralFlows = PWardenAstralFlows + 2;
	elseif (mobHP <= (mobMaxHP * 0.25) and target:getMaskBit(PWardenAstralFlows,1) == false) then
		for i=17056178, 17056186 do
			local rannum = math.random(0,7);
			local avatar = GetMobByID(i);
			avatar:changeSkin(23 + rannum); -- Random avatar skin
			SpawnMob(i):updateEnmity(target);
			avatar:useMobAbility(656);
			DespawnMob(i);
		end
		PWardenAstralFlows = PWardenAstralFlows + 1;
	end
	]]--

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	-- TODO: Death speech.
	killer:addTitle(PANDEMONIUM_QUELLER);
end;