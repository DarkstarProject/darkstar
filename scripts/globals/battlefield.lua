local MaxAreas =
{
    -- temenos
    {Max = 8, Zones = {37}},

    -- apollyon
    {Max = 6, Zones = {38}},

    -- dynamis
    {Max = 1, Zones = {39, 40, 41, 42, 134, 135, 185, 186, 187, 188,
                                140}}, -- ghelsba
};

function onBattlefieldHandlerInitialise(zone)
    local id = zone:getID();
    local default = 3;
    for _, battlefield in pairs(MaxAreas) do
        for _, zoneid in pairs(battlefield.Zones) do
            if id == zoneid then
                return battlefield.Max;
             end;
        end
    end;
    return default;
end;



g_Battlefield = {};

g_Battlefield.Status =
{
    OPEN     = 0,
    LOCKED   = 1,
    WON      = 2,
    LOST     = 3,
};

g_Battlefield.ReturnCode =
{
    WAIT              = 1,
    CUTSCENE          = 2,
    INCREMENT_REQUEST = 3,
    LOCKED            = 4,
    REQS_NOT_MET      = 5,
    BATTLEFIELD_FULL  = 6
}

function g_Battlefield.onBattlefieldTick(battlefield, timeinside)
    -- local tick = battlefield:getTick();
    local killedallmobs = true;
    local mobs = battlefield:getMobs(true, true);
    local status = battlefield:getStatus();
    local leavecode = -1;
    local players = battlefield:getPlayers();

    print("shit")

    if status == g_Battlefield.Status.LOST then
        leavecode = 4;
    elseif status == g_Battlefield.Status.WON then
        leavecode = 2;
    end;

    if leavecode ~= -1 then
        for _, player in pairs(players) do
            player:leaveBattlefield(leavecode);
        end;
        if #players == 0 then
            battlefield:cleanup(true);
        end
        return;
    end;

    for _, mob in pairs(mobs) do
        if mob:getHP() > 0 then
            killedallmobs = false;
            break;
        end;
    end;

    g_Battlefield.HandleWipe(battlefield);
    g_Battlefield.HandleTimePrompts(battlefield);
    print("fuck")
    if killedallmobs then
        print("dicks")
        battlefield:setStatus(g_Battlefield.Status.WON);
    end
end;

function g_Battlefield.HandleTimePrompts(battlefield)
    local tick = battlefield:getTimeInside();
    local status = battlefield:getStatus();
    local players = battlefield:getPlayers();
    local remainingTime = battlefield:getRemainingTime();

    if tick % 60 == 0 then
        for _, player in pairs(players) do
            if remainingTime > 0 then
                 player:messageBasic(202, remainingTime);
            else
                --player:messageSpecial(ID, PARAM);
                battlefield:setStatus(g_Battlefield.Status.LOST);
            end;
        end;
    end;

    if remainingTime <= 0 then
        if status ~= g_Battlefield.Status.WON then
            battlefield:setStatus(g_Battlefield.Status.LOST);
        end
        battlefield:cleanup(true)
    end
end;

function g_Battlefield.HandleWipe(battlefield)
    local rekt = true;

    local players = battlefield:getPlayers();
    local totalrekt = 0;
    local wipeTime = battlefield:getWipeTime();
    local elapsed = battlefield:getTimeInside();


    -- pure stolen from instance.lua
    if (wipeTime == 0) then
        for i,v in pairs(players) do
            if v:getHP() ~= 0 then
                rekt = false;
                break;
            end
        end
        if rekt then
            for i,v in pairs(players) do
                -- v:messageSpecial(ID, 3);
            end
            battlefield:setWipeTime(elapsed);
        end
    else
        if (elapsed - wipeTime) > 180 then
            battlefield:setStatus(g_Battlefield.Status.LOST);
        else
            for i,v in pairs(players) do
                if v:getHP() ~= 0 then
                    battlefield:setWipeTime(0);
                    rekt = false;
                    break;
                end
            end

            if rekt then
                battlefield:setStatus(g_Battlefield.Status.LOST);
            end;
        end
    end

end;


function g_Battlefield.onBattlefieldStatusChange(battlefield, status)
    if status == g_Battlefield.Status.WON then
        if battlefield:getLocalVar("LootID") and battlefield:getLocalVar("LootSpawned") then
        -- todo: spawn loot
        end
        local players = battlefield:getPlayers();
        return;
    end;
end;

function g_Battlefield.HandleLootRolls(battlefield, lootTable)
    lootTable = lootTable or nil;

    local players = battlefield:getPlayers();

end;