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
    player:PrintToPlayer("@takexp <amount> {player}");
end;

function onTrigger(player, amount, target)

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

    -- validate amount
    local oldAmount = targ:getExp();
    if (amount == nil or amount < 1) then
        error(player, "Invalid amount.");
        return;
    end
    if (amount > oldAmount) then
        amount = oldAmount;
    end

    -- take xp
    targ:delExp(amount);
    player:PrintToPlayer( string.format( "Removed %i exp from %s. They are now level %i with %i exp.", amount, targ:getName(), targ:getMainLvl(), targ:getExp() ));

end;