-----------------------------------
-- Area: Sealions Den
--  Mob: Mammet-22_Zeta
-----------------------------------
require("scripts/zones/Sealions_Den/MobIDs");
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- find mob offset for given battlefield instance
    local inst = math.floor((mob:getID() - ONE_TO_BE_FEARED_OFFSET) / 7);
    local instOffset = ONE_TO_BE_FEARED_OFFSET + (7 * (inst));
    
    -- if all five mammets in this instance are dead, start event    
    local allMammetsDead = true;
    for i = instOffset + 0, instOffset + 4 do
        if (not GetMobByID(i):isDead()) then
            allMammetsDead = false;
            break;
        end
    end
    if (allMammetsDead) then
        player:release(); -- prevents event collision if player kills multiple remaining mammets with an AOE move/spell
        player:startEvent(11);
    end
end;

function onEventFinish(player,csid,option)
    if (csid == 11) then
        local inst = player:getVar("bcnm_instanceid");
        if (inst >= 1 and inst <= 3) then
            -- players are healed in between fights, but their TP is set to 0
            player:addTitle(BRANDED_BY_LIGHTNING);
            player:setHP(player:getMaxHP());
            player:setMP(player:getMaxMP());
            player:setTP(0);

            -- spawn omega for given instance
            local omegaId = ONE_TO_BE_FEARED_OFFSET + (7 * (inst - 1)) + 5;
            if (omegaId ~= nil and not GetMobByID(omegaId):isSpawned()) then
                SpawnMob(omegaId);
            end

            -- move player to instance
            if (inst == 1) then
                player:setPos(-779, -103, -80);
            elseif (inst == 2) then
                player:setPos(-140, -23, -440);
            elseif (inst == 3) then
                player:setPos(499, 56, -802);
            end
        end
    end
end;
