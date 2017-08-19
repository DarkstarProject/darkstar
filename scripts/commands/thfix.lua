---------------------------------------------------------------------------------------------------
-- func: @nm -- Spawns a ton of NMs at once 
-- auth: <Unknown> :: Modded by Tagban
-- desc: Allows GM's to trigger NMs that are commonly requested. Add more if you tell me!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};
function onTrigger(player)
	DespawnMob('17056186','1'); -- Charyb
end