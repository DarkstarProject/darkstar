---------------------------------------------------------------------------------------------------
-- @troll3 -- Spawns 3rd wave of Trolls
--
-- Besieged
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "iiii"
};
function onTrigger(player)
       SpawnMob('16974001'); -- Slaughterous Scorpion    GrpId=1572------PoolId=3664     45,0,20,163
   SpawnMob('16974002'); -- Gurlufur The Menacing      GrpId=1518      PoolId=1851      40,0,16,186
   SpawnMob('16974003'); -- Gere------------------------GrpId=1513------PoolId=1498      61,0,40,5         DropID=4508
   SpawnMob('16974004'); -- Girzorhor The Imprudent      GrpId=1515      PoolId=1608      21,0,39,254      DropID=4509
   SpawnMob('16974005'); -- Surmerdar-------------------GrpId=1574------PoolId=3812      62,0,22,189
   SpawnMob('16974006'); -- Dartorgor-------------------GrpId=1499      PoolId=3664      39,0,60,60
   SpawnMob('16974007'); -- Vorporlor               GrpId=1589------PoolId=922      75,0,39,3
   SpawnMob('16974008'); -- Vorjirzur-------------------GrpId=1588      PoolId=4255      82,0,32,243
   SpawnMob('16974009'); -- Worbordor               GrpId=1595------PoolId=4373      93,-1,40,251
   SpawnMob('16974010'); -- Cobalt sentinel         GrpId=1498      PoolId=754      35,0,48,66      DropID=4510
   SpawnMob('16974011'); -- White sentinel   ------------GrpId=1594------PoolId=4335      43,0,47,66      DropID=4510
   SpawnMob('16974012'); -- Hazel Sentinel            GrpId-1519      PoolId=1904      31,0,27,113      DropID=4510
   SpawnMob('16974013'); -- Carmine Sentinel------------GrpId=1497------PoolId=643      72,0,29,235      DropID=4510
   SpawnMob('16974014'); -- Xarhorkur the Claviger      GrpId=1596      PoolId=4393      75,0,47,12
   SpawnMob('16974015'); -- Zurmurwur The ruthless     GrpId=1598------PoolId=4524      63,0,57,61
   SpawnMob('16974016'); -- Troll destroyer          GrpID=1578      PoolId=4014      67,0,34,246      DropID=4510
   SpawnMob('16974017'); -- Troll destroyer                                    52,0,34,126
   SpawnMob('16974018'); -- Troll destroyer                                    52,0,44,117
   SpawnMob('16974019'); -- Troll destroyer                                    55,0,49,61
   SpawnMob('16974020'); -- Troll destroyer                                    70,0,49,61
   SpawnMob('16974021'); -- Troll destroyer                                    70,0,52,16
end