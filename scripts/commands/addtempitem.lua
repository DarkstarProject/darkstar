---------------------------------------------------------------------------------------------------
-- func: addtempitem
-- desc: Adds a temp item to the players inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, itemId, quantity)
    -- Ensure item id was given..
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        player:PrintToPlayer( "You must enter a valid item id." );
        return;
    end

    -- Give the player the item..
    player:addTempItem( itemId,  quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val );
end