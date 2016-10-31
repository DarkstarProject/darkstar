---------------------------------------------------------------------------------------------------
-- @mamool1 -- Spawns 1st wave of Mamool
--
-- Besieged
---------------------------------------------------------------------------------------------------


cmdprops =
{
    permission = 2,
    parameters = "iiii"
};
function onTrigger(player)                                                   --@pos
   SpawnMob('16973825'); --Mamool Ja Sapper          GrpId=1546    poolID=2532      12,-6,25,(254) DropID=4510
   SpawnMob('16973826'); --Mamool Ja Hosplitaler--------GrpId=1543      poolID=2520      12,-6,34,(254)
   SpawnMob('16973827'); --Mamool Ja Fetial------------                        12,-6,48,(254)
   SpawnMob('16973828'); --Mamool Ja Spotter----------- GrpId=1547      poolID=2536       8,-6,56(252)   DropID=4510
   SpawnMob('16973829'); --Mamool Ja Handler------------GrpId=1542      poolID=2519      12,-6,40,(254)   DropID=4510
   SpawnMob('16973830'); --Mamool Ja Lizard          GrpId=1548      poolID=2539      11,-6,41,(254)   DropID=4510
    SpawnMob('16973831'); --Mamool Ja Cataphract-------- GrpId=1539      poolID=2510    23,-3,61,(255)   DropID=4510
   SpawnMob('16973832'); --Mamool Ja Wyvern          GrpId=1549      poolID=2541      18,-5,60,(20)   DropID=4510
    SpawnMob('16973833'); --Mamool_Ja_Entrancer--------- 1540         poolID=2514      11,-6,68,(34)   DropID=4510
   SpawnMob('16973834'); --Mamool_Ja_Sapper                                 17,-6,67,(61)   DropID=4510
   SpawnMob('16973835'); --Mamool_Ja_Hospitaler                              31,-6,66,(59)
   SpawnMob('16973836'); --Mamool_Ja_Fetial                                 34,-6,68,(117)
   SpawnMob('16973837'); --Mamool_Ja_Spotter                                 34,-6,65,(129)
   SpawnMob('16973838'); --Mamool_Ja_Handler                                 47,-6,65,(67)
   SpawnMob('16973839'); --Mamool_Ja_Lizard                                 45,-6,66,(75)
   SpawnMob('16973840'); --Mamool_Ja_Cataphract                              56,-6,68,(57)
   SpawnMob('16973841'); --Mamool_Ja_Wyvern                                 54,-6,69,(63)
   SpawnMob('16973842'); --Mamool_Ja_Entrancer                                 68,-6,66,(66)
   SpawnMob('16973843'); --Mamool Ja Sapper                                 80,-6,66,(73)
   SpawnMob('16973844'); --Mamool Ja Hosplitaler--------                         92,-6,64,(64)
   SpawnMob('16973845'); --Mamool Ja Fetial------------ GrpId=1541    poolID=2517      (22,-3,18,(254))   DropID=4510
   SpawnMob('16973846'); --Mamool_Ja_Spotter--------                           99,-6,67,(128)
   SpawnMob('16973847'); --Mamool_Ja_Handler--------                               106,-6,68,(127)
   SpawnMob('16973848'); --Mamool_Ja_Lizard--------                              109,-6,68,(124)
   SpawnMob('16973849'); --Mamool_Ja_Cataphract--------                            106,-6,66,(147)
   SpawnMob('16973850'); --Mamool_Ja_Wyvern--------                                109,-6,66,(138)
   SpawnMob('16973851'); --Mamool_Ja_Entrancer                                 23,-6,08,190
   SpawnMob('16973852'); --Scout_Puk   ----------------GrpId=1569      poolID=3505      13,-6,16,233   PoolID=4513
   SpawnMob('16973853'); --Scout_Puk                                       18,-6,13,236
   SpawnMob('16973854'); --Scout_Puk                                       26,-1,19,121
   SpawnMob('16973855'); --Scout_Puk                                       30,-6,13,131
   SpawnMob('16973856'); --Scout_Puk                                       40,-6,13,131
   SpawnMob('16973857'); --Raid_Raptor ----------------GrpId=1566      poolID=3309      49,-6,11,202   PoolID=4513
   SpawnMob('16973858'); --Raid_Raptor                                       55,-6,12,129
   SpawnMob('16973859'); --Raid_Raptor                                       64,-6,12,127
   SpawnMob('16973860'); --Raid_Raptor                                       71,-6,13,202
   SpawnMob('16973861'); --Raid_Raptor                                       84,-6,13,205
end