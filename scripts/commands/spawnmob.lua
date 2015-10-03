---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iii"
};

function onTrigger(player, mobId, despawntime, respawntime)
    SpawnMob( mobId, despawntime, respawntime );
end