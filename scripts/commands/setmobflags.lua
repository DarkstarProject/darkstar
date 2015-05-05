---------------------------------------------------------------------------------------------------
-- func: @mobflags <flags> <optional MobID>
-- desc: Used to manipulate a mob's flags for testing.
--       MUST either target a mob first or else specify a Mob ID.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, flags, target)
    if (flags == nil) then
        player:PrintToPlayer("You need to specify a value to set...");
        return
    end

    if (target == nil) then
        player:setMobFlags(flags);
    else
        player:setMobFlags(flags, target);
    end
end;