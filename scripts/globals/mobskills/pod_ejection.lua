---------------------------------------------
-- Pod Ejection
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local omegaID = mob:getID()
    local pod = GetMobByID(omegaID + 1)
    if not pod:isSpawned() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local omegaID = mob:getID()
    local pod = GetMobByID(omegaID + 1)
    local players = mob:getBattlefield():getPlayers()

    if not pod:isSpawned() then
        local random = math.random(1, #players)
        local X = mob:getXPos()
        local Y = mob:getYPos()
        local Z = mob:getZPos()

        pod:spawn()
        pod:setPos(X,Y,Z)
        pod:updateEnmity(players[random])
    end
    return 0
end