---------------------------------------------------------------------------------------------------
-- func: addkeyitem
-- auth: <Unknown>
-- desc: Adds a key item to the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems");

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, keyId)
    if (keyId == nil or tonumber(keyId) == nil or tonumber(keyId) == 0) then
        player:PrintToPlayer( "You must enter a valid key item id." );
        return;
    end
    
    -- Load needed text ids for players current zone..
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

    -- Give the player the item..
    player:addKeyItem( keyId );
    player:messageSpecial( KEYITEM_OBTAINED, keyId );
end