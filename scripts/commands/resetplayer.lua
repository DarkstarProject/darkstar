---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
                player:delMod(MOD_STEALTH, -2000);
                player:delMod(MOD_ENEMYCRITRATE, 80);
                player:delMod(MOD_CRITHITRATE, -60);
                player:delMod(MOD_MOVE, -50);
                player:delMod(MOD_SPELLINTERRUPT, -80);
                player:PrintToPlayer("Hope you had fun! It also resets on zone... try @zone?")
end