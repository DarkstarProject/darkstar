---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- auth: <Unknown>
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mobId)
    SpawnMob( mobId );
end