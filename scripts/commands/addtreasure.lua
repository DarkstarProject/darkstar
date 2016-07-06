---------------------------------------------------------------------------------------------------
-- func: @additem <itemId> <quantity> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4> <trial>
-- desc: Adds an item to the GMs inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, itemId, target)
    local targ;
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target);
    end

    if (targ == nil) then
        player:PrintToPlayer(string.format("Player named '%s' not found!", target));
        return
    end

    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        player:PrintToPlayer("You must enter a valid item id.");
        return;
    end

    targ:addTreasure(itemId);
    player:PrintToPlayer(string.format("Item of ID %d was added to the treasure pool of %s or their party/alliance.", itemId, targ:getName()));
end