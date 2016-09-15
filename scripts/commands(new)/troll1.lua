---------------------------------------------------------------------------------------------------
-- @troll1 -- Spawns 1st wave of Trolls
--
-- Besieged
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player)
   SpawnMob('16973930'); --Troll_Paviser-------GrpId=1581      poolID=4025
   SpawnMob('16973931'); --Troll_Stormer      GrpId=1584      poolID=4033
   SpawnMob('16973932'); --Troll_Hoplite-------GrpId=1580      poolID=4020
   SpawnMob('16973933'); --Troll_Pezhetairoi   GrpId=1582      poolID=4026
   SpawnMob('16973934'); --Troll_Cannoneer-----GrpId=1577      poolID=4011
   SpawnMob('16973935'); --Troll_Velites      GrpId=1586      poolID=4037
   SpawnMob('16973936'); --Troll_Speculator----GrpId=1583      poolID=4031
   SpawnMob('16973937'); --Troll_Automaton      GrpId=1585      poolID=4035
   SpawnMob('16973938'); --Troll_Paviser
    SpawnMob('16973939'); --Troll_Stormer
   SpawnMob('16973940'); --Troll_Hoplite
   SpawnMob('16973941'); --Troll_Pezhetairoi
   SpawnMob('16973942'); --Troll_Cannoneer
   SpawnMob('16973943'); --Troll_Velites
   SpawnMob('16973944'); --Troll_Speculator
   SpawnMob('16973945'); --Troll_Automaton
   SpawnMob('16973946'); --Troll_Paviser
   SpawnMob('16973947'); --Troll_Stormer
   SpawnMob('16973948'); --Troll_Hoplite
   SpawnMob('16973949'); --Troll_Pezhetairoi
   SpawnMob('16973950'); --Troll_Cannoneer
   SpawnMob('16973951'); --Troll_Velites
   SpawnMob('16973952'); --Troll_Speculator
   SpawnMob('16973953'); --Troll_Automaton
   SpawnMob('16973954'); --Flame_Eruca---------GrpId=1506      poolID=1357
   SpawnMob('16973955'); --Flame_Eruca
   SpawnMob('16973956'); --Flame_Eruca
   SpawnMob('16973957'); --Flame_Eruca
   SpawnMob('16973958'); --Flame_Eruca
   SpawnMob('16973959'); --War_Wamouracampa----GrpId=1592      poolID=4301
   SpawnMob('16973960'); --War_Wamouracampa
   SpawnMob('16973961'); --War_Wamouracampa

end