---------------------------------------------------------------------------------------------------
-- func:  @aspi
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (near Aspi pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};
function onTrigger(player)
            player:setPos('20', '-1', '48', '84', '128');
end