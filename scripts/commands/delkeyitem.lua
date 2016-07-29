---------------------------------------------------------------------------------------------------
-- func: @delkeyitem
-- desc: Deletes the given key item from the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, keyId, target)

    keyId = tonumber(keyId) or _G[keyId];

    if (keyId == nil or keyId == 0) then
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