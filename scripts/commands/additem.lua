---------------------------------------------------------------------------------------------------
-- func: additem
-- auth: <Unknown>
-- desc: Adds an item to the players inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiiiiiiii"
};

function onTrigger(player, itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)
    -- Load needed text ids for players current zone..
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

    -- Ensure item id was given..
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        player:PrintToPlayer( "You must enter a valid item id." );
        return;
    end
    
    -- Ensure the player has room to obtain the item..
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, itemId );
        return;
    end
    
    -- Give the player the item..
    player:addItem( itemId,  quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val );
    player:messageSpecial( ITEM_OBTAINED, itemId );
end