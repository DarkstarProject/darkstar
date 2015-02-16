---------------------------------------------------------------------------------------------------
-- func: despawnnpc
-- auth: <Unknown>
-- desc: Spawns an NPC.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, npcid) 
  
   DespawnNPC( npcid );   
end