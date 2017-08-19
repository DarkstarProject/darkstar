---------------------------------------------------------------------------------------------------
-- func: Teleports player to Hakutaku.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}; 
function onTrigger(player, x, y, z, zone)
            player:setPos('22', '26', '-299', '0', '160');
            SpawnMob('17433005','160000'); -- HakuTaku
            player:PrintToServer("The eyes have awaken.... Be the first to fight!", 0xF);
end
