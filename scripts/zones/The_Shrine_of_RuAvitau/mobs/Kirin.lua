-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Kirin
-----------------------------------
package.loaded[ "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" ] = nil;
-----------------------------------
require( "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" );
require( "scripts/globals/titles" );
require( "scripts/globals/ability" );
require( "scripts/globals/pets" );
require( "scripts/globals/status" );

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize( mob )
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_WINDRES, -64);
end

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight( mob, target )
    if (mob:getHPP() < math.random(50,60) and mob:getLocalVar("astralFlow") == 0) then
        mob:useMobAbility(734);
        -- Spawn Avatar
        mob:spawnPet();
        mob:setLocalVar("astralFlow", 1);
    end
    if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 180 == 0) then
        -- Ensure we have not spawned all pets yet..
        local genbu = mob:getLocalVar("genbu");
        local seiryu = mob:getLocalVar("seiryu");
        local byakko = mob:getLocalVar("byakko");
        local suzaku = mob:getLocalVar("suzaku");

        if (genbu == 1 and seiryu == 1 and byakko == 1 and suzaku == 1) then
            return;
        end

        -- Pick a pet to spawn at random..
        local ChosenPet = nil;
        local newVar = nil;
        repeat

            local rand = math.random( 0, 3 );
            ChosenPet = 17506671 + rand;

            switch (ChosenPet): caseof {
                [17506671] = function (x) if ( genbu == 1) then ChosenPet = 0; else newVar = "genbu";  end end, -- Genbu
                [17506672] = function (x) if (seiryu == 1) then ChosenPet = 0; else newVar = "seiryu"; end end, -- Seiryu
                [17506673] = function (x) if (byakko == 1) then ChosenPet = 0; else newVar = "byakko"; end end, -- Byakko
                [17506674] = function (x) if (suzaku == 1) then ChosenPet = 0; else newVar = "suzaku"; end end, -- Suzaku
            }

        until (ChosenPet ~= 0 and ChosenPet ~= nil)

        -- Spawn the pet..
        local pet = SpawnMob( ChosenPet );
        pet:updateEnmity( target );
        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );

        -- Update Kirins extra vars..
        mob:setLocalVar(newVar, 1);
    end

    -- Ensure all spawned pets are doing stuff..
    for pets = 17506671, 17506674 do
        if (GetMobAction( pets ) == 16) then
            -- Send pet after current target..
            GetMobByID( pets ):updateEnmity( target );
        end
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Award title and cleanup..
    player:addTitle( KIRIN_CAPTIVATOR );
    player:showText( mob, KIRIN_OFFSET + 1 );

    -- Despawn pets..
    DespawnMob( 17506671 );
    DespawnMob( 17506672 );
    DespawnMob( 17506673 );
    DespawnMob( 17506674 );
end

-----------------------------------
-- OnMobDespawn
-----------------------------------

function onMobDespawn( mob )
    -- Despawn pets..
    DespawnMob( 17506671 );
    DespawnMob( 17506672 );
    DespawnMob( 17506673 );
    DespawnMob( 17506674 );
    GetNPCByID( 17506693 ):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end
