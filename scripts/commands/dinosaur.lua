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
            player:setPos('-442', '-64', '482', '125', '265');
            SpawnMob('17863277','160000'); -- ACHUKA
            player:PrintToServer("You sense a tingling... OH SNAP HERE IT COMES!", 0xF);
end