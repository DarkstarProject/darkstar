---------------------------------------------------------------------------------------------------
-- func: @delcurrency <currency type> <amount> <target player>
-- desc: Removes the specified currency from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sis"
};

function onTrigger(player,currency,amount,target)
    local targ = nil

    if (currency == nil or amount == nil) then
        player:PrintToPlayer( "You must enter a valid currency and amount." );
        player:PrintToPlayer( "@delcurrency <currency type> <amount> <target player>" );
        return
    end

    -- "target" will only be nil if no target was specified
    -- "targ" will only be nil if an invalid target was specified
    if (target ~= nil) then
        targ = GetPlayerByName(target);
    else
        targ = player;
    end

    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        return
    end

    -- Making sure currency type valid before deling.
    if (targ:getCurrency(currency) ~= nil) then
        targ:delCurrency(currency,amount);
    else
        player:PrintToPlayer( string.format( "Currency of type '%s' not found!", currency ) );
    end

end;