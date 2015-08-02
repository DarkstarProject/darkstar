---------------------------------------------------------------------------------------------------
-- func: despawnmob
-- desc: Despawns the given mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mobId)
    DespawnMob( mobId );
end