-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Pandemonium_Warden
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Make sure model is reset back to start
    mob:setModelId(1839);

    -- Two hours to forced depop
    mob:setLocalVar("PWardenDespawnTime", os.time(t) + 7200);
    for i = 17056170, 17056177, 1 do
        SpawnMob(i,180):updateEnmity(target);
    end
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    local depopTime = mob:getLocalVar("PWardenDespawnTime");
    local petsModelId = 0;
    local mobHPP = mob:getHPP();
    local change = mob:getLocalVar("change");
    local petIDs = {17056170,17056171,17056172,17056173,17056174,17056175,17056176,17056177};
    local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4]),GetMobAction(petIDs[5]),GetMobAction(petIDs[6]),GetMobAction(petIDs[7]),GetMobAction(petIDs[8])};
    local TP = mob:getLocalVar("TP");

    ------------------------ Notes  ------------------------
    -- I can't help but think this could be better executed with a single set of logic checks and a table of HP and skin values.
    -- Just the same, at least his pets respawn every form, and he doesn't get stuck.
    -- There are two sets of PW in the mobids.  It's entirely possible SE did this fight by swapping between the two somehow.

    -- Some sources claim he should linger in Dverger form and throw off a few TP moves between forms.
    -- Should end up in "mini-dverger" form at the end.

    -- Using custom mobskill scripts so we don't clutter up existing scritps with a bunch of onMobSkillChecks.


    ------------------------ FORM CHANGES ------------------------
    if (mobHPP <= 15 and change == 13) then -- Final Form, pets take Dvger form as well
        mob:setModelId(1839);
        mob:setLocalVar("change", 14);
        petsModelId = 1840;
    elseif (mobHPP <= 26 and change == 12) then -- Khim and Co.
        mob:setModelId(1805);
        mob:setLocalVar("change", 13);
        petsModelId = 1746;
    elseif (mobHPP <= 28 and change == 11) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 12);
        if (TP <= 5) then
            mob:useMobAbility(1858);
            mob:setLocalVar("TP", 6)
        end
    elseif (mobHPP <= 38 and change == 10) then -- Hydra and Co.
        mob:setModelId(1796);
        mob:setLocalVar("change", 11);
        petsModelId = 421;
    elseif (mobHPP <= 40 and change == 9) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 10);
        if (TP <= 4) then
            mob:useMobAbility(1860);
            mob:setLocalVar("TP", 5)
        end
    elseif (mobHPP <= 50 and change == 8) then -- Cerb and Co.
        mob:setModelId(1793);
        mob:setLocalVar("change", 9);
        petsModelId = 281;
    elseif (mobHPP <= 52 and change == 7) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 8);
        if (TP <= 3) then
            mob:useMobAbility(1861);
            mob:setLocalVar("TP", 4)
        end
    elseif (mobHPP <= 62 and change == 6) then -- Troll and Co.
        mob:setModelId(1867);
        mob:setLocalVar("change", 7);
        petsModelId = 1680;
    elseif (mobHPP <= 64 and change == 5) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 6);
        if (TP <= 2) then
            mob:useMobAbility(1862);
            mob:setLocalVar("TP", 3)
        end
    elseif (mobHPP <= 74 and change == 4) then -- Lamia and Co.
        mob:setModelId(1865);
        mob:setLocalVar("change", 5);
        petsModelId = 1643;
    elseif (mobHPP <= 76 and change == 3) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 4);
        if (TP <= 1) then
            mob:useMobAbility(1863);
            mob:setLocalVar("TP", 2)
        end
    elseif (mobHPP <= 86 and change == 2) then -- Mamool and Co.
        mob:setModelId(1863);
        mob:setLocalVar("change", 3);
        petsModelId = 1639;
    elseif (mobHPP <= 88 and change == 1) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 2);
        if (TP <= 0) then
            mob:useMobAbility(1857);
            mob:setLocalVar("TP", 1)
        end
    elseif (mobHPP <= 98 and change == 0) then -- Chariots
        mob:setModelId(1825);
        mob:setLocalVar("change", 1);
        petsModelId = 1820;
    end


    ------------------------ Keep pets active ------------------------
    -- Pets probably shouldn't despawn for this, but proof otherwise should remove this code.

    for i = 1, 8 do
        if (petStatus[i] == 16 or petStatus[i] == 18) then -- idle or disengaging pet
            GetMobByID(petIDs[i]):updateEnmity(target);
        end
    end

    -- Repops pets sets model and sets them agro..
    for i = 1, 8 do
        GetMobByID(petIDs[i]):setModelId(petsModelId);
        if petStatus[i] == 0 then
           SpawnMob(petIDs[i]):updateEnmity(target);
        end
    end


    ------------------------ Despawn timer ------------------------
    if (os.time(t) > depopTime) then
        for i=17056170, 17056186 do
            DespawnMob(i);
        end
        printf("Timer expired at %i. Despawning Pandemonium Warden.", depopTime);
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