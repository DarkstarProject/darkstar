-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Ix'aern (drg)
-----------------------------------
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");
require( "scripts/globals/status" );
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;
-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight( mob, target )

	  --[[  local drga = mob:getLocalVar("drga");
        local drgb = mob:getLocalVar("drgb");
        local drgc = mob:getLocalVar("drgc");


        if (drga == 1 and drgb == 1 and drgc == 1) then
            return;
        end

        -- Pick a pet to spawn at random..
        local ChosenPet = nil;
        local newVar = nil;
        repeat

            local rand = math.random( 0, 2 );
            ChosenPet = 16921023 + rand;

            switch (ChosenPet): caseof {
                [16921023] = function (x) if (drga == 1) then ChosenPet = 0; else newVar = "drga";  end end, -- drga
                [16921024] = function (x) if (drgb == 1) then ChosenPet = 0; else newVar = "drgb"; end end, -- drgb
                [16921025] = function (x) if (drgc == 1) then ChosenPet = 0; else newVar = "drgc"; end end, -- drgc
            }

        until (ChosenPet ~= 0 and ChosenPet ~= nil)

        -- Spawn the pet..
        local pet = SpawnMob( ChosenPet );
        pet:updateEnmity( target );
        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );

        -- Update Ix'aern (drg) extra vars
        mob:setLocalVar(newVar, 1);


    -- Ensure all spawned pets are doing stuff..
    for pets = 16921023, 16921025 do
        if (GetMobAction( pets ) == 16) then
            -- Send pet after current target..
            GetMobByID( pets ):updateEnmity( target );
        end
    end]]--
end



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	-- Despawn pets..
	DespawnMob(16921023);
	DespawnMob(16921024);
	DespawnMob(16921025);
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
    -- Despawn pets..
	DespawnMob( 16921023 );
	DespawnMob( 16921024 );
	DespawnMob( 16921025 );

    -- Reset popped var..
    SetServerVariable("[PH]Ix_aern_drg",0);
end
