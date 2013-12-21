-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Kirin
-----------------------------------
package.loaded[ "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" ] = nil;
-----------------------------------

require( "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" );
require( "scripts/globals/titles" );
require( "scripts/globals/status" );

-- TODO: Kirin at random 75%HP or below should use Astral Flow, and summon his avatar.

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onMobInitialize( mob )
end

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight( mob, target )

	local Kirin = mob:getID();

    if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 10 == 0) then -- Spawn a pet every 3 minutes
        -- Ensure we have not spawned all pets yet..
        local genbu, seiryu, byakko, suzaku = mob:getExtraVar( 4 );
        if (genbu == 1 and seiryu == 1 and byakko == 1 and suzaku == 1) then
            return;
        end
        
        -- Pick a pet to spawn at random..
        local ChosenPet = nil;
        repeat

            local rand = math.random( 0, 3 );		
            ChosenPet = Kirin + 1 + rand;			
            
            switch (ChosenPet): caseof {
                [Kirin+1] = function (x) if ( genbu == 1) then ChosenPet = 0; else  genbu = 1; end end, -- Genbu
                [Kirin+2] = function (x) if (seiryu == 1) then ChosenPet = 0; else seiryu = 1; end end, -- Seiryu
                [Kirin+3] = function (x) if (byakko == 1) then ChosenPet = 0; else byakko = 1; end end, -- Byakko
                [Kirin+4] = function (x) if (suzaku == 1) then ChosenPet = 0; else suzaku = 1; end end, -- Suzaku
            }
            
        until (ChosenPet ~= 0 and ChosenPet ~= nil)
        
        -- Spawn the pet..
        local pet = SpawnMob( ChosenPet );
        pet:updateEnmity( target );
        pet:setPos(mob:getXPos() + 10, mob:getYPos(), mob:getZPos() + 10);

        -- Update Kirins extra vars..
        mob:setExtraVar( genbu, seiryu, byakko, suzaku );
    end

    -- Ensure all spawned pets are doing stuff..
    for pets = Kirin+1, Kirin+4 do
        if (GetMobAction( pets ) == 16) then 
            GetMobByID( pets ):updateEnmity( target );
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath( mob, killer )
    -- Award title and cleanup..
    killer:addTitle( KIRIN_CAPTIVATOR );
    killer:showText( mob, KIRIN_OFFSET + 1 );
    GetNPCByID( 17506693 ):hideNPC( 900 );
    
	local Kirin = mob:getID();

	for i = Kirin+1, Kirin+4 do
		if (GetMobAction(i) ~= 0) then
			DespawnMob(i);
		end
	end
    
    -- Reset popped pet var..
    mob:setExtraVar( 0 );
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )

	local Kirin = mob:getID();

	for i = Kirin+1, Kirin+4 do
		if (GetMobAction(i) ~= 0) then
			DespawnMob(i);
		end
	end
    
    -- Reset popped pet var..
    mob:setExtraVar( 0 );
end;
