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
function onTrigger(player)

   SpawnMob('17203216'); -- King Arthro
   SpawnMob('17297440'); -- Behemoth
   SpawnMob('17408018'); -- Fafnir
   SpawnMob('17301537'); -- Adamantoise
   SpawnMob('16806227'); -- Tiamat
   SpawnMob('16797969'); -- Jormungand
   SpawnMob('16912876'); -- Absolute_Virtue
   SpawnMob('17395800'); -- Mee Deggi the Punisher
   SpawnMob('17395954'); -- Yaa Haqa the Profane
   SpawnMob('17395870'); -- Quu Domi the Gallant
   SpawnMob('17596720'); -- Serket
   SpawnMob('17269106'); -- Roc 
   SpawnMob('17555890'); -- Vrtra
   SpawnMob('17371515'); -- Hoo Mjuu

   
   player:PrintToPlayer( "NM Spawn." );
end