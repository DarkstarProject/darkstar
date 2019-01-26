---------------------------------------------------------------------------------------------------
-- func: setplayerlevel
-- desc: Sets the target players level.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setplayerlevel {player} <level>");
end;

function onTrigger(player, arg1, arg2)
    local targ;
    local level;

    -- validate target
    if (arg2 ~= nil) then
        targ = GetPlayerByName(arg1);
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", arg1 ) );
            return;
        end
        level = tonumber(arg2);
    elseif (arg1 ~= nil) then
        targ = player;
        level = tonumber(arg1);
    end

    -- validate level
    if (level == nil or level < 1 or level > 99) then
        error(player, "Invalid level.  Must be between 1 and 99.");
        return;
    end

    -- set level
    targ:setLevel( level );
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer( string.format("Set %s's level to %i.", targ:getName(), level) );
    end
end