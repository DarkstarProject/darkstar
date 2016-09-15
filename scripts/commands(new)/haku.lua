---------------------------------------------------------------------------------------------------
-- func: vrtra/vrtra @vrtra
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}; 
function onTrigger(player, x, y, z, zone)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
else
            player:setPos('22', '26', '-299', '0', '160');
            SpawnMob('17433005','160000'); -- HakuTaku
            player:PrintToServer("The eyes have awaken.... Be the first to fight!", 0xF);
end
end