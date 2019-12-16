-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Doll Factory
-- BCNM: Factory Rejects
-----------------------------------

function onMobFight(mob, target)
    local lastDoll = mob:getLocalVar("lastDoll")

    if lastDoll == 0 or (lastDoll < 5 and GetMobByID(mob:getID() + lastDoll):isDead()) then
        lastDoll = lastDoll + 1
        SpawnMob(mob:getID() + lastDoll):updateEnmity(target)
        mob:setLocalVar("lastDoll", lastDoll)
        if lastDoll == 5 then
            mob:setHP(0)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if mob:getLocalVar("lastDoll") < 5 then
            mob:getBattlefield():lose()
        end
    end
end