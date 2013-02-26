-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Kirin
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/globals/titles");


function onMobInitialize(mob)

	mob:addMod(MOD_REGEN, 50);
	mob:addMod(MOD_REGAIN, 15);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	local ChosenPet;
	local RandomMod;
	local pets;

	if(mob:getBattleTime() % 180 == 0) then -- Every 3 minutes ...
		local KirinCalledPets = GetServerVariable("Kirin_PetsCalled");
		if (KirinCalledPets < 15) then -- ... if you haven't called all four pets already ...
			repeat
				RandomMod = math.random(0,3);
				ChosenPet = 17506671 + RandomMod;  -- ... pick a random pet...

				-- ... unless you've already called that pet ...
				if (target:getMaskBit(KirinCalledPets,RandomMod) == true) then
					ChosenPet = 0;
				end
			until(ChosenPet ~= 0 and ChosenPet ~= nil)

			-- ... then pop it and send it after the tank ...
			SpawnMob(ChosenPet):updateEnmity(target);
			GetMobByID(ChosenPet):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());

			-- ... and set a bit so you can't resummon that pet.
			switch (ChosenPet): caseof {
				[17506671] = function (x) SetServerVariable("Kirin_PetsCalled", KirinCalledPets + 1); end, -- Genbu
				[17506672] = function (x) SetServerVariable("Kirin_PetsCalled", KirinCalledPets + 2); end, -- Seiryu
				[17506673] = function (x) SetServerVariable("Kirin_PetsCalled", KirinCalledPets + 4); end, -- Byakko
				[17506674] = function (x) SetServerVariable("Kirin_PetsCalled", KirinCalledPets + 8); end, -- Suzaku
			}
		end
	end

	-- If any pets are idle ...
	for pets = 17506671,17506674 do
		if (GetMobAction(pets) == 16) then
			GetMobByID(pets):updateEnmity(target); -- ... get back in the fight.
		end
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(KIRIN_CAPTIVATOR);
	killer:showText(mob,KIRIN_OFFSET + 1);
	GetNPCByID(17506693):hideNPC(900);

	-- Depop Pets
	DespawnMob(17506671);
	DespawnMob(17506672);
	DespawnMob(17506673);
	DespawnMob(17506674);
end;