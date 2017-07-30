---------------------------------------------------------------------------------------------------
-- func: setplayernation
-- desc: Sets the target players nation.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, nation)
    if (nation > 2 or nation < 0) then
        player:PrintToPlayer( "Invalid nation id given! Must be 0, 1, or 2!" );
        return;
    end

    --[[ need to fetch from table and change argument to string type
    nation = tonumber(nation) or _G[string.upper(nation)];
    ]]

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        targ:setNation( nation );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end;