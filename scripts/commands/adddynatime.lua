---------------------------------------------------------------------------------------------------
-- func: adddynatime
-- desc: Adds an amount of time to the given target. If no target; then to the current player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, arg1, arg2)
    if (arg2 ~= nil) then
        local target = GetPlayerByName(arg1);
        if (target == nil) then
            player:PrintToPlayer(string.format( "Player named '%s' not found!", arg1 ));
        else
            -- Ensure the target is in Dynamis..
            if (target:isInDynamis()) then
                target:addTimeToDynamis(arg2);
            end
        end
    else
        local amount = tonumber(arg1);
        if (amount == nil) then
            player:PrintToPlayer("Enter a valid amount of time (as a number)!");
        else
            -- Ensure the player is in Dynamis..
            if (player:isInDynamis()) then
                player:addTimeToDynamis(amount);
            end
        end
    end
end