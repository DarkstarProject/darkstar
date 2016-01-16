---------------------------------------------------------------------------------------------------
-- func: @delkeyitem
-- desc: Deletes the given key item from the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, keyId, target)
    if (keyId == nil or tonumber(keyId) == 0 or tonumber(keyId) == nil or keyId == 0) then
        player:PrintToPlayer("You must enter a valid keyitem ID.");
        player:PrintToPlayer( "@delkeyitem <ID> <player>" );
        return;
    end

    if (target == nil) then
        player:delKeyItem( keyId );
        player:PrintToPlayer( string.format( "Keyitem ID '%u' deleted from self!", keyId ) );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delKeyItem( keyId );
            player:PrintToPlayer( string.format( "Keyitem ID '%u' deleted from player!", keyId ) );
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@delkeyitem <ID> <player>" );
        end
    end
end;