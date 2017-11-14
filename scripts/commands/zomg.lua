---------------------------------------------------------------------------------------------------
-- func: vrtra/vrtra @vrtra
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = ""
}; 
function onTrigger(player, x, y, z, zone) 
            --player:setPos('-540', '-12', '-68', '191', '7'); -- Tiamat
            SpawnMob('16806227','160000'); -- Tiamat
            player:PrintToServer("Something big has spawned.. Use @tobattle to join! Ask for invite!", 0x1E);
end