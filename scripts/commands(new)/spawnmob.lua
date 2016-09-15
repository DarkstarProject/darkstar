---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
};

function onTrigger(player, mobId, despawntime, respawntime)
    SpawnMob( mobId, despawntime, respawntime );
end