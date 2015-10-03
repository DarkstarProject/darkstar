---------------------------------------------------------------------------------------------------
-- func:  @npc
-- auth: Wadski
-- desc: Sets the players position to Celennium Memorial Library.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
            player:setPos('-98', '-2', '-87', '85', '284');
end