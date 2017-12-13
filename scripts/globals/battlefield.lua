local MaxAreas =
{
    -- temenos
    {Max = 8, Zones = {37}},

    -- apollyon
    {Max = 6, Zones = {38}},

    -- dynamis
    {Max = 1, Zones = {39, 40, 41, 42, 134, 135, 185, 186, 187, 188,
                                140}}, -- ghelsba
}

function onBattlefieldHandlerInitialise(zone)
    local id = zone:getID()
    local default = 3
    for _, battlefield in pairs(MaxAreas) do
        for _, zoneid in pairs(battlefield.Zones) do
            if id == zoneid then
                return battlefield.Max
             end
        end
    end
    return default
end



g_Battlefield = {}

g_Battlefield.STATUS =
{
    OPEN     = 0,
    LOCKED   = 1,
    WON      = 2,
    LOST     = 3,
}

g_Battlefield.RETURNCODE =
{
    WAIT              = 1,
    CUTSCENE          = 2,
    INCREMENT_REQUEST = 3,
    LOCKED            = 4,
    REQS_NOT_MET      = 5,
    BATTLEFIELD_FULL  = 6
}

g_Battlefield.LEAVECODE =
{
    EXIT = 1,
    WON = 2,
    WARPDC = 3,
    LOST = 4
}

function g_Battlefield.onBattlefieldTick(battlefield, timeinside, players)
    local killedallmobs = true
    local mobs = battlefield:getMobs(true, true)
    local status = battlefield:getStatus()
    local leavecode = -1
    local players = battlefield:getPlayers()
    local cutsceneTimer = battlefield:getLocalVar("cutsceneTimer")

    if status == g_Battlefield.STATUS.LOST then
        leavecode = 4
    elseif status == g_Battlefield.STATUS.WON then
        leavecode = 2
    end

    if leavecode ~= -1 then
        battlefield:setLocalVar("cutsceneTimer", cutsceneTimer + 1)

        local canLeave = battlefield:getLocalVar("loot") == 0
        if status == g_Battlefield.STATUS.WON and not canLeave then
            if battlefield:getLocalVar("lootSpawned") == 0 and battlefield:spawnLoot() then
                canLeave = false
            elseif battlefield:getLocalVar("lootSeen") == 1 then
                canLeave = true
            end
        end
        if canLeave and cutsceneTimer >= 15 then
            battlefield:cleanup(true)
        end
    end

    for _, mob in pairs(mobs) do
        if mob:getHP() > 0 then
            killedallmobs = false
            break
        end
    end

    g_Battlefield.HandleWipe(battlefield, players)

    -- if we cant send anymore time prompts theyre out of time
    if not g_Battlefield.SendTimePrompts(battlefield, players) then
        battlefield:cleanup(true)
    end

    if killedallmobs then
        battlefield:setStatus(g_Battlefield.STATUS.WON)
    end
end

-- returns false if out of time
function g_Battlefield.SendTimePrompts(battlefield, players)
    local tick = battlefield:getTimeInside()
    local status = battlefield:getStatus()
    local remainingTime = battlefield:getRemainingTime()
    local message = 0
    local lastTimeUpdate = battlefield:getLastTimeUpdate()

    players = players or battlefield:getPlayers()

    if lastTimeUpdate == 0 and remainingTime < 600 then
        message = 600;
    elseif lastTimeUpdate == 600 and remainingTime < 300 then
        message = 300;
    elseif lastTimeUpdate == 300 and remainingTime < 60 then
        message = 60;
    elseif lastTimeUpdate == 60 and remainingTime < 30 then
        message = 30;
    elseif lastTimeUpdate == 30 and remainingTime < 10 then
        message = 10;
    end

    if message ~= 0 then
        for i, player in pairs(players) do
            player:messageBasic(202, remainingTime)
        end
        battlefield:setLastTimeUpdate(message)
    end

    return remainingTime >= 0
end

function g_Battlefield.HandleWipe(battlefield, players)
    local rekt = true
    local wipeTime = battlefield:getWipeTime()
    local elapsed = battlefield:getTimeInside()

    players = players or battlefield:getPlayers()

    -- pure stolen from instance.lua
    if wipeTime <= 0 then
        for _, player in pairs(players) do
            if player:getHP() ~= 0 then
                rekt = false
                break
            end
        end
        if rekt then
            for _, player in pairs(players) do
                -- v:messageSpecial(ID, 3)
            end
            battlefield:setWipeTime(elapsed)
        end
    else
        if (elapsed - wipeTime) > 180 then
            battlefield:setStatus(g_Battlefield.STATUS.LOST)
        else
            for _, player in pairs(players) do
                if player:getHP() ~= 0 then
                    battlefield:setWipeTime(0)
                    rekt = false
                    break
                end
            end

            if rekt then
                battlefield:setStatus(g_Battlefield.STATUS.LOST)
            end
        end
    end
end


function g_Battlefield.onBattlefieldStatusChange(battlefield, players, status)

end

function g_Battlefield.HandleLootRolls(battlefield, lootTable, players, npc)
    players = players or battlefield:getPlayers()
    local lootGroup = lootTable[math.random(1, #lootTable)]

    if battlefield:getStatus() == g_Battlefield.STATUS.WON and battlefield:getLocalVar("lootSeen") == 0 then
        if npc then
            npc:setAnimation(8)
        end
        if lootGroup then
            for _, entry in pairs(lootGroup) do
                local chansu = entry.droprate / 1000
                local watashiNoChansu = math.random()

                if watashiNoChansu <= chansu then
                    players[1]:addTreasure(entry.itemid)
                end
            end
        else
            printf("fuckin loot groups")
        end
        battlefield:setLocalVar("cutsceneTimer", 10)
        battlefield:setLocalVar("lootSeen", 1)
    end
end

function g_Battlefield.ExtendTimeLimit(battlefield, minutes, message, param, players)
    local timeLimit = battlefield:getTimeLimit()
    local extension = minutes * 60
    battlefield:setTimeLimit(timeLimit + extension)

    if message then
        players = players or battlefield:getPlayers()
        for _, player in pairs(players) do
            player:messageBasic(message, param or minutes)
        end
    end
end