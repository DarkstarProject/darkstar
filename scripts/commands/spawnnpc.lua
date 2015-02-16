---------------------------------------------------------------------------------------------------
-- func: spawnnpc
-- auth: <Unknown>
-- desc: Spawns an NPC.
---------------------------------------------------------------------------------------------------
require("scripts/globals/common");
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
};

function onTrigger(player,npc) 
  
   SpawnMob(petIDs[73]):updateEnmity(target);
end