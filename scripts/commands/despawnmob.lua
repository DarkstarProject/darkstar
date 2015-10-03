---------------------------------------------------------------------------------------------------
-- func: despawnmob
-- desc: Despawns the given mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "i"
};

function onTrigger(player, mobId)
    DespawnMob( mobId );
end