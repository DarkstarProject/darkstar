---------------------------------------------------------------------------------------------------
-- func:  @hydra
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (near hydra pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('-287', '-24', '-31', '234', '51');
end

