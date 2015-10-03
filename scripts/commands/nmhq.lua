---------------------------------------------------------------------------------------------------
-- func: @nm -- Spawns a ton of NMs at once 
-- auth: <Unknown> :: Modded by Tagban
-- desc: Allows GM's to trigger NMs that are commonly requested. Add more if you tell me!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)

   SpawnMob('17297441'); -- KB
   SpawnMob('17408019'); -- Nidhogg
   SpawnMob('17301538'); -- Aspi
   SpawnMob('16896159'); -- Tiamat
   SpawnMob('17289575'); -- King_Vinegarroon

  
   
   player:PrintToPlayer( "NM Spawn." );
end