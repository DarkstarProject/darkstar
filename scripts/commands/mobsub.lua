---------------------------------------------------------------------------------------------------
-- func: mobsub
-- auth: PrBlahBlahtson
-- desc: Changes the sub-animation of the given mob. (For testing purposes.)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, target, animationId)
    local mob = GetMobByID( target );
    if (mob ~= nil) then
        mob:AnimationSub( animationId );
    end
end