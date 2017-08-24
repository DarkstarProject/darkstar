---------------------------------------------------------------------------------------------------
-- func: takexp <amount> <player>
-- desc: Removes experience points from the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!takexp <amount> {player}");
end;

function onTrigger(player, amount, target)

    -- validate amount
    if (amount == nil or amount < 1) then
        error(player, "Invalid amount.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- take xp
    targ:delExp(amount);
    player:PrintToPlayer( string.format( "Removed %i exp from %s. They are now level %i.", amount, targ:getName(), targ:getMainLvl() ));

end;