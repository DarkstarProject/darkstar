-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Bomb Queen
-----------------------------------
require("scripts/zones/Ifrits_Cauldron/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.HP_STANDBACK, -1);
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    mob:addMod(dsp.mod.STUNRES, 50);
end;

function onMobFight(mob,target)
    local battleTime = mob:getBattleTime();

    if (battleTime > 20 and battleTime % 25 == 0) then
        local mobId = mob:getID();
        local pets = {};

        for i = mobId + 1, mobId + 5 do
            if (not GetMobByID(i):isSpawned()) then
                table.insert(pets, i);
            end
        end

        if (#pets > 0) then
            local petId = pets[math.random(#pets)];
            local pet = GetMobByID(petId);
            pet:setSpawn(mob:getXPos()-0.5, mob:getYPos(), mob:getZPos(), mob:getRotPos());
            pet:spawn();
            pet:updateEnmity(target);
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(BOMB_QUEEN_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
