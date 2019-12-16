-----------------------------------
-- Area: Batallia Downs
--  Mob: Weeping Willow
-----------------------------------

function onMobFight(mob,target)
    if (mob:getHPP() <= 50 and mob:getLocalVar("Saplings") < 1) then
        SpawnMob(mob:getID()+1):updateEnmity(target)
        SpawnMob(mob:getID()+2):updateEnmity(target)
        SpawnMob(mob:getID()+3):updateEnmity(target)
        SpawnMob(mob:getID()+4):updateEnmity(target)
        SpawnMob(mob:getID()+5):updateEnmity(target)
        mob:setLocalVar("Saplings", 1)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- Retail behavior is for it to walk back to where willow died if unclaimed *unless* willow was pulled down the cliff
    -- In that case, it will walk back near where Willow was spawned at.
    GetMobByID(mob:getID() + 6):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
end
