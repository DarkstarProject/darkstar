---------------------------------------------------------------------------------------------------
-- func: title
-- auth: <Unknown>
-- desc: Sets a players title.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, titleId)
    if (titleId == nil) then
        player:PrintToPlayer("You must enter a valid title id.");
        return
    end
    player:addTitle( titleId );
end