---------------------------------------------------------------------------------------------------
-- func: vrtra/vrtra @vrtra
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}; 
function onTrigger(player, x, y, z, zone) 
            player:setPos('-540', '-12', '-68', '191', '7'); -- Tiamat
            player:PrintToServer("I've joined the fight, you should to! Use @tobattle to join!", 0xC);
end