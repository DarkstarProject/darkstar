-----------------------------------
-- Area: Batallia Downs
--  MOB: Weeping Willow
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
    local JACK = mob:getID()+6
    SpawnMob(JACK)
    GetMobByID(JACK):setPos( mob:getXPos(), mob:getYPos(), mob:getZPos(), 0);
end
