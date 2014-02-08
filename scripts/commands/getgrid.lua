---------------------------------------------------------------------------------------------------
-- func: getgrid
-- auth: EDGECOM
-- desc: Tells the player current grid position.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    player:GetGrid();
end