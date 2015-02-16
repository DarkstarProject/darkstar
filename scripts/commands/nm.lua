---------------------------------------------------------------------------------------------------
-- func: @nm -- Spawns a ton of NMs at once
-- auth: <Unknown> :: Modded by Tagban
-- desc: Allows GM's to trigger NMs that are commonly requested. Add more if you tell me!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player)
       SpawnMob('17297441'); -- KB
   SpawnMob('17408018'); -- Fafnir
   SpawnMob('17301538'); -- Aspi
   SpawnMob('17301537'); -- Adamantoise
   SpawnMob('17387866'); -- Morbol
   SpawnMob('17498522'); -- Chary
   SpawnMob('17268851'); -- Deadly Dodo
   SpawnMob('16806215'); -- Xolotl
   SpawnMob('17231971'); -- Nue
       SpawnMob('17404333'); -- Voluptuous Vivian
   SpawnMob('17645755'); -- Ungur
   SpawnMob('17649731'); -- LoO
   SpawnMob('17199438'); -- VE
   SpawnMob('17228242'); -- Simurgh
   SpawnMob('17244539'); -- Cactrot
   SpawnMob('16806227'); -- Tiamat
   SpawnMob('17461307'); -- Sewer Syrup
   SpawnMob('17555980'); -- Vrtra
   SpawnMob('17596720'); -- Serket
end
