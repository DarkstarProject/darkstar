---------------------------------------------------------------------------------------------------
-- func: @hasitem
-- desc: Checks if a player has a specific item
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, itemId, target)
    if (itemId == nil or tonumber(itemId) == 0 or tonumber(itemId) == nil or itemId == 0) then
        player:PrintToPlayer("You must enter a valid item ID.");
        player:PrintToPlayer( "@hasitem <ID> <player>" );
        return;
    end

    if (target == nil) then
        player:PrintToPlayer("You must enter a valid target name.");
        player:PrintToPlayer( "@hasitem <ID> <player>" );
        return;
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        if (targ:hasItem(itemId)) then
            player:PrintToPlayer(string.format("Player '%s' has item with ID %u.", target, itemId));
        else
            player:PrintToPlayer(string.format("Player '%s' does not have item with ID %u.", target, itemId));
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@hasitem <ID> <player>" );
    end
end;