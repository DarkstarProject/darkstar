-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Kirin
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/titles");

function onMobInitialize( mob )
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end

function onMobSpawn(mob)
    mob:setMod(MOD_WINDRES, -64);
    mob:setLocalVar("numAdds", 1);
end

function onMobFight( mob, target )

    -- use astral flow
    if (mob:getHPP() < math.random(50,60) and mob:getLocalVar("astralFlow") == 0) then
        mob:useMobAbility(734);
        mob:spawnPet();
        mob:setLocalVar("astralFlow", 1);
    end

    -- spawn gods
    local numAdds = mob:getLocalVar("numAdds");
    if (mob:getBattleTime() / 180 == numAdds) then
        local godsRemaining = {};
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining,i);
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)];
            local god = SpawnMob(KIRIN + g);
            god:updateEnmity(target);
            god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
            mob:setLocalVar("add"..g, 1);
            mob:setLocalVar("numAdds", numAdds + 1);
        end
    end

    -- ensure all spawned pets are doing stuff
    for i = KIRIN + 1, KIRIN + 4 do
        local god = GetMobByID(i);
        if (god:getCurrentAction() == ACTION_ROAMING) then
            god:updateEnmity(target);
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle( KIRIN_CAPTIVATOR );
    player:showText( mob, KIRIN_OFFSET + 1 );
    for i = KIRIN + 1, KIRIN + 4 do
        DespawnMob(i);
    end;
end

function onMobDespawn( mob )
    for i = KIRIN + 1, KIRIN + 4 do
        DespawnMob(i);
    end;
    GetNPCByID(KIRIN_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end
